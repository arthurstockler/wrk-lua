require('random-payload')

local i = require("merchant")
local mm = i.new(5)
local rqcount = 1
local catoi = 1
local json = require "JSON"

function newOrder()
  catoi = catoi + 1
  local body = {
      ["reference"] = 'Pedido ' .. catoi,
      ["number"] = '' .. randomNumber(),
      ["notes"] = string.random(10),
      ["status"] = status(),
      ["logic_number"] = logicNumber(),
      ["ref"] = require('uuid')(),
      ["items"] = {
          {
            ["reference"] = require('uuid')(),
            ["unit_price"] = quantity(),
            ["unit_of_measure"] = unitOfMeasure(),
            ["quantity"] = quantity(),
            ["name"] = productRef(),
            ["description"] = string.random(20),
            ["details"] = string.random(15),
            ["sku"] = string.random(4)
          }
      },
      ["transactions"] = {
          {
            ["external_id"] = require('uuid')(),
            ["transaction_type"] = 'PAYMENT',
            ["description"] = 'description ' .. catoi,
            ["status"] = 'CONFIRMED',
            ["terminal_number"] = logicNumber(),
            ["authorization_code"] = '' .. authorizationCode() .. '',
            ["number"] = '' .. number() .. '',
            ["amount"] = amount(),
            ["card"] = {
              ["mask"] = maskCard(),
            },
          }
      }
  }
  wrk.body = json:encode (body)
  wrk.headers["Content-Type"] = "application/json"
  wrk.headers["merchant_id"] = "0012a2ed-c500-4b8f-83e7-c7da351d839c"
  wrk.headers["logic_number"] = "7777889-6"
  return wrk.format("POST", "/api/v3/orders")
end

request = function()

  rqcount = rqcount + 1

  -- if rqcount % 30 ~= 0 then
  --   print("Controller/api/v1/orders/index")
  -- end
  --
  -- if rqcount % 30 == 0 then
  --   print("Controller/api/v1/orders/show")
  -- end

  -- if rqcount % 31 == 0 then
  --   print("tp_healthcheck")
  -- end

  -- if rqcount % 50 == 0 then
  --   return newOrder()
  -- end
  return newOrder()
end

--wrk -t1 -c1 -d1s -s 1.lua http://localhost:8080/
