class CreateGroupDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :group_details do |t|
      t.references :group, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
