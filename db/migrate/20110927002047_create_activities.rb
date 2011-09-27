class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user
      t.references :act
      t.references :location

      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :act_id
    add_index :activities, :location_id
  end
end
