class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer :kid_id, null: false
      t.integer :parent_id
      t.integer :employee_id
      t.date :date, null: false
      t.datetime :drop_off
      t.datetime :pick_up
      t.text :note
      t.string :status
      t.timestamps
    end
  end
end
