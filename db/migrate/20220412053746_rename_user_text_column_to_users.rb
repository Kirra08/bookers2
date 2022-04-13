class RenameUserTextColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :user_text, :introduction
  end
end
