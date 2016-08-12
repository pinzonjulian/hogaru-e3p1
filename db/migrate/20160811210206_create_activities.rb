class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.date :date
      t.integer :calories
      t.boolean :burnt, default: false

      t.timestamps
    end
  end
end
