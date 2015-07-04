class AddMembersIdPendingToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :members_id_pending, :text, :default => [].to_yaml  	
  end
end
