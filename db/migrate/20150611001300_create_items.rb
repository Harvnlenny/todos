class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :task
      t.date :due_date
      t.boolean :is_complete
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
