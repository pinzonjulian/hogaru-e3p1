class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.datetime :date
      t.integer :cal_burnt
      t.integer :cal_intake

      t.timestamps
    end
  end
end
