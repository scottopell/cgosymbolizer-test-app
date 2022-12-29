#!/usr/bin/env bash
/with_symbolizer &> symbolizer_present.txt
/without_symbolizer &> symbolizer_absent.txt

echo "Output with symbolizer present:"
cat symbolizer_present.txt
echo -e "END OUTPUT\n\n"

echo "Output with symbolizer absent:"
cat symbolizer_absent.txt
echo -e "END OUTPUT\n\n"


echo "Diff ignoring hex:"
diff <(sed 's/0x[0-9a-f]*/HEX/g' symbolizer_present.txt) <(sed 's/0x[0-9a-f]*/HEX/g' symbolizer_absent.txt)
