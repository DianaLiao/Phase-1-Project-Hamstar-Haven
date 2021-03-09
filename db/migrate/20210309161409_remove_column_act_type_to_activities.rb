class RemoveColumnActTypeToActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :activity_type 
  end
end
