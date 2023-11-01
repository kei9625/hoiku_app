class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.integer :employee_id
      t.integer :kid_id
      t.integer :parent_id
      t.string :title, null: false, default: ""
      t.text :content, null: false
      t.timestamps
    end
  end
end
