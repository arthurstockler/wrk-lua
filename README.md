Exemplo de script LUA + WRK

Requisitos
. wrk [https://github.com/wg/wrk]
. luarocks [https://luarocks.org/]

Instação Ubuntu
. sudo apt-get install -y luarocks

Instalação de dependências
. sudo luarocks install json-lua
. sudo luarocks install uuid


Exemplo:

wrk -t12 -c20 -d30s -s script.lua http://127.0.0.1:8080
