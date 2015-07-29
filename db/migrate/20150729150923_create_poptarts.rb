class CreatePoptarts < ActiveRecord::Migration
  def change
    create_table :poptarts do |t|
      t.string :flavor
      t.string :sprinkles
    end
  end
end
