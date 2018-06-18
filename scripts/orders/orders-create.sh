#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/orders"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "order": {
      "Export_NYC_Order_Number": "188098",
      "Export_NYC_Order_Date": "6/11/2018",
      "Export_NYC_Item_Quantity": 1,
      "Export_NYC_Item_Number": "NYC-Lube",
      "Export_NYC_Item_Description": "ONE® Oasis 4.5g Waterbased Lubricant, Case of 1000",
      "Export_NYC_Contact": "311 CALL CENTER",
      "Export_NYC_Ship_Org": "FAMILY HEALTH ASSOCIATES - DEBBIE TARULLI",
      "Export_NYC_Ship_Address": "31-60 21 STREET",
      "Export_NYC_Ship_City": "QUEENS",
      "Export_NYC_Ship_State": "NY",
      "Export_NYC_Ship_Zip": "11106",
      "Export_NYC_Ship_Country": "USA",
      "Export_NYC_Ship_Phone": "(718) 932-2110",
      "Export_NYC_Ship_Email": "condoms@311.nyc.gov",
      "Export_NYC_Ship_Delivery_Instructions": "Inside delivery required. Bring hand truck..",
      "Export_NYC_Bill_Org": "New York City Department of Public Health",
      "Export_NYC_Bill_Address": "NYCDOH Address",
      "Export_NYC_Bill_City": "New York",
      "Export_NYC_Bill_State": "NY",
      "Export_NYC_Bill_Zip": "ZIP",
      "Export_NYC_Bill_Country": "USA",
      "Export_NYC_Price": "31"
    }
  }'

echo
