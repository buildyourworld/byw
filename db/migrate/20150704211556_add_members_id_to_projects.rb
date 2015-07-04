class AddMembersIdToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :members_id, :text, :default => [].to_yaml
  end
end
