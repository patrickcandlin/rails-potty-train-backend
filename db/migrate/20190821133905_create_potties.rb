class CreatePotties < ActiveRecord::Migration[5.2]
  def change
    create_table :potties do |t|
      t.integer :number
      t.string :notes
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
