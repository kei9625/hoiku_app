class AddDetailsToKids < ActiveRecord::Migration[6.1]
  def change
    add_column :kids, :gender, :string
    add_column :kids, :allergy_info, :text
    add_column :kids, :health_info, :text
  end
end
