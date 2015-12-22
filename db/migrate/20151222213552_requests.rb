class Requests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :ip
      t.integer :v1
      t.integer :v2
      t.timestamps null: false
    end
  end
end
