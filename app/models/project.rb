class Project < ActiveRecord::Base
	geocoded_by :city
	after_validation :geocode
	mount_uploader :image, ImageUploader
	has_many :skills
	has_many :tools
	accepts_nested_attributes_for :skills, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :tools, :reject_if => :all_blank, :allow_destroy => true

	validates :name, presence: true
	validates :description, presence: true
  	validates_presence_of :skills, :tools

	scope :architecture, 	->{ where(category_id: 1)}
	scope :business, 		->{ where(category_id: 2)}
	scope :charity, 		->{ where(category_id: 3)}
	scope :demonstration,	->{ where(category_id: 4)}
	scope :environment,		->{ where(category_id: 5)}
	scope :musique, 		->{ where(category_id: 6)}
	scope :sports, 			->{ where(category_id: 7)}
	scope :technology, 		->{ where(category_id: 8)}
	scope :emergency, 		->{ where(category_id: 9)}

	def self.search(query)
	    # where(:title, query) -> This would return an exact match of the query
	    where("name like ?", "%#{query}%") 
	    #where(name: "#{query}")
  	end
end