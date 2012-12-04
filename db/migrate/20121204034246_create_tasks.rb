class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title_task
      t.boolean :status
      t.references :list
      t.timestamps
    end
    add_index :tasks, :list_id
  end
end
