class AddParentIdToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :parent, null: false, foreign_key: true
  end
end
