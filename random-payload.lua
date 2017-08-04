local tbunit_of_measure = { 'PACOTE', 'EACH', 'KG', 'UN', 'UNID' }
local tbstatus = { 'OPEN', 'CLOSED', 'CANCELLED' }
local tbname = { 'Queijo','Presunto','Pão','Sabonete','Creme dental','Desodorante','Macarrão','Creme de leite', 'Sabão em pó','Detergente' }

function randomNumber()
  math.randomseed(os.time()*1000000000000000)
  return math.floor(math.random() * 10000000000)
end

function logicNumber()
  local p1 = math.floor(math.random() * 100000000)
  math.randomseed(os.clock()*1000000000000000)
  local p2 = math.floor(math.random() * 10)
  return p1 .. '-' .. p2
end

function maskCard()
  local p1 = math.floor(math.random() * 1000000)
  math.randomseed(os.clock()*1000000000000000)
  local p2 = math.floor(math.random() * 1000)
  return p1 .. '-' .. p2
end

function authorizationCode()
  math.randomseed(os.clock()*1000000000000000)
  return math.floor(math.random() * 1000000)
end

function number()
  math.randomseed(os.clock()*10000000000000)
  return math.floor(math.random() * 1000000)
end

function amount()
  math.randomseed(os.clock()*10000000000000)
  return math.floor(math.random() * 1000)
end

function quantity()
  math.randomseed(os.clock()*1000000000000000)
  local qtd = math.floor(math.random() * 5)
  if qtd <= 0 then qtd = 1 end
  return qtd
end

function status()
  math.randomseed(os.clock()*1000000000000000)
  local pos = math.floor(math.random() * 3)
  return tbstatus[pos + 1]
end

function productRef()
  math.randomseed(os.clock()*1000000000000000)
  local pos = math.floor(math.random() * 10)
  return tbname[pos + 1]
end

function unitOfMeasure()
  math.randomseed(os.clock()*1000000000000000)
  local pos = math.floor(math.random() * 5)
  return tbunit_of_measure[pos + 1]
end

function string.random(length)
  math.randomseed(os.clock()*1000000000000000)
	local str = "";
	for i = 1, length do
		str = str..string.char(math.random(65, 90));
	end
	return str;
end
