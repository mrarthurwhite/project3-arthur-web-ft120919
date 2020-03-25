class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :description
      t.datetime :meeting_datetime
      t.belongs_to :user # host
      t.timestamps
    end
  end
end
