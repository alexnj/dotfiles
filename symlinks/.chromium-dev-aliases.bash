# Chromium development related

function gcert() {
  if [[ -n $TMUX ]]; then
    eval $(tmux show-environment -s)
  fi
  command gcert "$@"
}

function cr_comp() {
 set -o xtrace
  # Compiles the provided target, or out/Default by default.
  local target="${1:-out/Default}"
  local artifact="${2:-chrome}"
  # RBE_racing_bias=0.4 RBE_cas_concurrency=2000
  time RBE_local_resource_fraction=0.7 autoninja -C $target $artifact
}

function cr_which_test() {
  if [[ $# -eq 0 ]]; then
    echo "cr_which_test build-target //path/to/file"
    echo
    echo "Identifies test target given a file. For example,"
    echo "  cr_which_test out/Default //third_party/blink/renderer/core/frame/ad_tracker_test.cc"
    return 1
  fi
  gn refs $1 $2
}

cr_run() {
  out/Default/Chromium.app/Contents/MacOS/Chromium \
    --no-sandbox \
    --use-mock-keychain \
    --enable-logging=stderr --v=1 --log-level=0 \
    --disable-features=DialMediaRouteProvider ${@} 2>&1
}

alias cr_sync="gclient sync"
alias cr_gen="gn gen out/Default"
alias cr_gen_intel="tools/clang/scripts/generate_compdb.py -p out/Default > compile_commands.json"
