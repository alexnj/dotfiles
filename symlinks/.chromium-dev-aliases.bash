function cr_which_test () {
  if [[ $# -eq 0 ]]; then
    echo "cr_which_test build-target //path/to/file"
    echo
    echo "Identifies test target given a file. For example,"
    echo "  cr_which_test out/Default //third_party/blink/renderer/core/frame/ad_tracker_test.cc"
    return 1
  fi
  gn refs $1 $2
}