class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :svg

      t.timestamps null: false
    end
  end
end
