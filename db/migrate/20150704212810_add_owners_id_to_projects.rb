class AddOwnersIdToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :owners_id, :text, :default => [].to_yaml  	
  end
end
