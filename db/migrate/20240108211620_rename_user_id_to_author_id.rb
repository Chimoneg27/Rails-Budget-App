class RenameUserIdToAuthorId < ActiveRecord::Migration[7.1]
  def change
    rename_column :purchases, :user_id, :author_id
  end
end
