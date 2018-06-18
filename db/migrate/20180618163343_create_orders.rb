class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :Export_NYC_Order_Number, null: false
      t.string :Export_NYC_Order_Date, null: false
      t.integer :Export_NYC_Item_Quantity, null: false
      t.string :Export_NYC_Item_Number, null: false
      t.string :Export_NYC_Item_Description, null: false
      t.string :Export_NYC_Contact, null: false
      t.string :Export_NYC_Ship_Org, null: false
      t.string :Export_NYC_Ship_Address, null: false
      t.string :Export_NYC_Ship_City, null: false
      t.string :Export_NYC_Ship_State, null: false
      t.string :Export_NYC_Ship_Zip, null: false
      t.string :Export_NYC_Ship_Country, null: false
      t.string :Export_NYC_Ship_Phone, null: false
      t.string :Export_NYC_Ship_Email, null: false
      t.string :Export_NYC_Ship_Delivery_Instructions, null: false
      t.string :Export_NYC_Bill_Org, null: false
      t.string :Export_NYC_Bill_Address, null: false
      t.string :Export_NYC_Bill_City, null: false
      t.string :Export_NYC_Bill_State, null: false
      t.string :Export_NYC_Bill_Zip, null: false
      t.string :Export_NYC_Bill_Country, null: false
      t.float :Export_NYC_Price, null: false

      t.timestamps
    end
  end
end
