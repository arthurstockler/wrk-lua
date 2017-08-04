require('random-payload')

local catoi = 1
local json = require "JSON"
local i = M.new(5)

function newOrder()
  catoi = catoi + 1

  local logic_number = logicNumber()
  local body = {
      ["reference"] = 'Pedido ' .. catoi,
      ["number"] = '' .. randomNumber(),
      ["notes"] = string.random(10),
      ["status"] = status(),
      ["logic_number"] = logic_number,
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
            ["terminal_number"] = logic_number,
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
  wrk.headers["logic_number"] = logic_number
  return wrk.format("POST", "/api/v3/orders")
end
