class CreatePriceHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :price_histories do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.datetime :effective_from

      t.timestamps
    end
  end
end
