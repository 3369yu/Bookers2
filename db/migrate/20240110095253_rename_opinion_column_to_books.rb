class RenameOpinionColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :Opinion, :body
  end
end
