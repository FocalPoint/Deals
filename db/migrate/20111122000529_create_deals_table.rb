class CreateDealsTable < ActiveRecord::Migration
  def change
    create_table :deals do |t|
          t.string :title
          t.string :large_image_url
          t.text :description
          t.string :buy_url
          t.decimal :original_price
          t.decimal :discount
          t.string :perma_link

          t.timestamps
        end
  end
end
