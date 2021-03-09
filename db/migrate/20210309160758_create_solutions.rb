class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.integer :activity_id
      t.integer :problem_id
    end
  end
end
