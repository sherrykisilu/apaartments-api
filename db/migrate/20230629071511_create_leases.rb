class CreateLeases < ActiveRecord::Migration[7.0]
  def change
    create_table :leases do |t|
      t.integer :rent
      t.references :apartment, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
