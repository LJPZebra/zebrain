#!/bin/bash
mkdir SVG
cd PNG
for i in *;
  do echo $i;
  cat "$i" | pngtopnm | potrace --svg --invert > "../SVG/${i%.*}.svg";
done;
