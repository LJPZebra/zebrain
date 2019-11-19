for i in *;
  do echo $i;
  cat "$i" | pngtopnm | potrace --svg --invert > "../svg/${i%.*}.svg";
done;
