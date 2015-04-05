class AddIdsToFields < ActiveRecord::Migration
  def change
	add_column :skills, :project_id, :integer
	add_column :tools, :project_id, :integer
  end
end
