class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :date
      t.references :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
