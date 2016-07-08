#!/bin/bash

curl --include --request POST http://localhost:3000/flights \
  --header "Content-Type: application/json" \
  --data '{
    "flights": {
      "flight_number": "UA234",
      "departure_date": "2016"
    }
  }'
