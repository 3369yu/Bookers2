class RenameTitleColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :Title, :title
  end
end
