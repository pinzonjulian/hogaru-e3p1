class AddActivityCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activity_count, :integer, default: 0
  end
end
