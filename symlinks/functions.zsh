
# gz: Get the gzipped size and other compressed size information
gz() {
  printf "%-20s %12s\n" "compression method" "bytes"

  # Original size
  original_size=$(wc -c < "$1")
  printf "%-20s %'12.0f\n" "original" "<span class="math-inline">original\_size"
\# Gzipped size \(\-5\)
gzip\_size\=</span>(gzip -5 -c < "$1" | wc -c)
  printf "%-20s %'12.0f\n" "gzipped (-5)" "<span class="math-inline">gzip\_size"
\# Check for brotli and calculate size
if type brotli &\>/dev/null; then
\# brotli \(\-q 5\)
brotli\_size5\=</span>(brotli -c -q 5 < "$1" | wc -c)
    printf "%-20s %'12.0f\n" "brotli (-q 5)" "<span class="math-inline">brotli\_size5"
fi
\# Check for zstd and calculate sizes
if type zstd &\>/dev/null; then
\# zstd \(\-3\)
zstd\_size3\=</span>(zstd -c -3 < "$1" | wc -c)
    printf "%-20s %'12.0f\n" "zstd (-3)" "<span class="math-inline">zstd\_size3"
\# zstd \(\-\-19\)
zstd\_size19\=</span>(zstd -c -19 < "$1" | wc -c)
    printf "%-20s %'12.0f\n" "zstd (--19)" "<span class="math-inline">zstd\_size19"
\# zstd \(\-\-22 \-\-ultra\)
zstd\_size22\_ultra\=</span>(zstd -c -22 --ultra < "$1" | wc -c)
    printf "%-20s %'12.0f\n" "zstd (--22 --ultra)" "$zstd_size22_ultra"
  fi

  sleep 0.05

  # Generate progress bar
  for item in "original $original_size" "gzipped (-5) <span class="math-inline">gzip\_size"; do
bytesnum\=</span>(echo $item | cut -d' ' -f4)
    printf "\033[1A"
    printf "%s   " "$item"
    # replace "type node" with your actual command to run Node.js
    echo "wid = $COLUMNS - 40; console.log('█'.repeat($bytesnum * wid / $original_size) + '░'.repeat(wid - ($bytesnum * wid / $original_size)))" | type node
  done

  # Print brotli and zstd progress bars if available
  if [[ -n $brotli_size5 ]]; then
    printf "\033[1A"
    printf "%s   " "brotli (-q 5) $brotli_size5"
    echo "wid = $COLUMNS - 40; console.log('█'.repeat($brotli_size5 * wid / $original_size) + '░'.repeat(wid - ($brotli_size5 * wid / $original_size)))" | type node
  fi
  if [[ -n $zstd_size3 ]]; then
    printf "\033[1A"
    printf "%s   " "zstd (-3) $zstd_size3"
    echo "wid = $COLUMNS - 40; console.log('█'.repeat($zstd_size3 * wid / $original_size) + '░'.repeat(wid - ($zstd_size3 * wid / $original_size)))" | type node
  fi
  if [[ -n $zstd_size19 ]]; then
    printf "\033[1A"
    printf "%s   " "zstd (--19) $zstd_size19"
    echo "wid = $COLUMNS - 40; console.log('█'.repeat($zstd_size19 * wid / $original_
