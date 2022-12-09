#!/usr/bin/env bash
# With symbolizer present
go build -o with_symbolizer -gcflags '-N -l'
sed -i 's/_ "github.com\/ianlancetaylor\/cgosymbolizer"/\/\/placeholder/' crash.go

go build -o without_symbolizer -gcflags '-N -l'

# Restore the import
sed -i 's/\/\/placeholder/_ "github.com\/ianlancetaylor\/cgosymbolizer"/' crash.go

./with_symbolizer &> symbolizer_present.txt
./without_symbolizer &> symbolizer_absent.txt

diff <(sed 's/0x[0-9a-f]*/HEX/g' symbolizer_present.txt) <(sed 's/0x[0-9a-f]*/HEX/g' symbolizer_absent.txt)
