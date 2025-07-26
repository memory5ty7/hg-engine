for i in $(seq 2000 2101); do
  ./nitrogfx "${i}.png" "${i}.gbapal"
  ./nitrogfx "${i}.gbapal" "${i}-extra.pal"
done