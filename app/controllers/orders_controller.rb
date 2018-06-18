class OrdersController < ApplicationController
  def index
    api_key = ENV['SHOPIFY_API_KEY']
    secret_key = ENV['SHOPIFY_SECRET_KEY']
    url = ENV['SHOPIFY_URL']
    @response = RestClient::Request.execute(
      method: :get,
      url: "https://#{api_key}:#{secret_key}@#{url}/admin/orders.json"
    )
    render json: @response
  end

  def create
    api_key = ENV['SHOPIFY_API_KEY']
    secret_key = ENV['SHOPIFY_SECRET_KEY']
    url = ENV['SHOPIFY_URL']
    variant_id = (order_params["Export_NYC_Item_Number"] == "NYC-Lube")? 37894160455: 37894117319;
    ship_country = (order_params["Export_NYC_Ship_Country"].length > 2)? order_params["Export_NYC_Ship_Country"][0,2] : order_params["Export_NYC_Ship_Country"];
    bill_country = (order_params["Export_NYC_Bill_Country"].length > 2)? order_params["Export_NYC_Bill_Country"][0,2] : order_params["Export_NYC_Bill_Country"];
    orderData = {   "order": {
                    "name": order_params["Export_NYC_Order_Number"],
                    "email": order_params["Export_NYC_Ship_Email"],
                    "fulfillment_status": "unfulfilled",
                    "financial_status": "pending",
                    "notes": order_params["Export_NYC_Ship_Delivery_Instructions"],
                    "line_items": [{
                        "variant_id": variant_id,
                        "quantity": order_params["Export_NYC_Item_Quantity"]
                    }],
                    "shipping_address": {
                      "first_name": order_params["Export_NYC_Ship_Org"].split(" ")[0],
                      "last_name": order_params["Export_NYC_Ship_Org"].split(" ").drop(1).join(" "),
                      "address1": order_params["Export_NYC_Ship_Address"],
                      "phone": order_params["Export_NYC_Ship_Phone"],
                      "city": order_params["Export_NYC_Ship_City"],
                      "province": order_params["Export_NYC_Ship_State"],
                      "country": ship_country,
                      "zip": order_params["Export_NYC_Ship_Zip"]
                    },
                    "billing_address": {
                      "first_name": order_params["Export_NYC_Bill_Org"].split(" ")[0],
                      "last_name": order_params["Export_NYC_Bill_Org"].split(" ").drop(1).join(" "),
                      "address1": order_params["Export_NYC_Bill_Address"],
                      "city": order_params["Export_NYC_Bill_City"],
                      "province": order_params["Export_NYC_Bill_State"],
                      "country": bill_country,
                      "zip": order_params["Export_NYC_Bill_Zip"]
                    },
                    "customer": {
                      "email": order_params["Export_NYC_Ship_Email"]
                    }
                }
             }
    @response = RestClient::Request.execute(
      method: :post,
      url: "https://#{api_key}:#{secret_key}@#{url}/admin/orders.json",
      payload: orderData
    )
    render json: orderData
  end

  def order_params
    params.require(:order).permit(:Export_NYC_Order_Number,:Export_NYC_Order_Date, :Export_NYC_Item_Quantity,
      :Export_NYC_Item_Number, :Export_NYC_Item_Description,:Export_NYC_Contact,:Export_NYC_Ship_Org,:Export_NYC_Ship_Address,
      :Export_NYC_Ship_City,:Export_NYC_Ship_State,:Export_NYC_Ship_Zip,:Export_NYC_Ship_Country,:Export_NYC_Ship_Phone,
      :Export_NYC_Ship_Email,:Export_NYC_Ship_Delivery_Instructions,:Export_NYC_Bill_Org,:Export_NYC_Bill_Address,
      :Export_NYC_Bill_City,:Export_NYC_Bill_State,:Export_NYC_Bill_Zip,:Export_NYC_Bill_Country,:Export_NYC_Price)
  end

end
