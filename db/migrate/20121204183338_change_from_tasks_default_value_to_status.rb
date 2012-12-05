class ChangeFromTasksDefaultValueToStatus < ActiveRecord::Migration
  def change
    drop_table :tasks
    create_table :tasks do |t|
      t.string :title_task
      t.boolean :status, default: false
      t.references :list
      t.timestamps
    end
    add_index :tasks, :list_id
  end
end
