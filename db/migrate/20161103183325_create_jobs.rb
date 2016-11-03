class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.boolean :completed, null: false, default: false
    end
  end
end
