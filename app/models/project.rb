class Project < ActiveRecord::Base
	has_many :skills
	has_many :tools
	accepts_nested_attributes_for :skills, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :tools, :reject_if => :all_blank, :allow_destroy => true
end
