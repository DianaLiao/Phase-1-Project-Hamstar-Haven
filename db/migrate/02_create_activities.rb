class CreateActivities < ActiveRecord::Migration[5.2]
    def change
        create_table :activities do |t|
            t.string :activity_type
            t.string :name
        end
    end
end