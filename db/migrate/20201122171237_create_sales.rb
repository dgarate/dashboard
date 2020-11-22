class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.float :amount
      t.string :blend_name
      t.string :origin

      t.timestamps
    end
  end
end
