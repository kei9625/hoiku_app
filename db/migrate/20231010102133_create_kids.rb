class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.integer "parent_id", default: "", null: false
      t.string :last_name, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :last_name_kana, null: false, default: ""
      t.string :first_name_kana, null: false, default: ""
      t.integer :barth_date, null: false, default: ""
      t.timestamps
    end
  end
end
