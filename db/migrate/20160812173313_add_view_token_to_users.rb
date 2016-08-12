class AddViewTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :view_token, :string
  end
end
