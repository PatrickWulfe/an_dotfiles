# Unalias any conflicting names before defining functions
unalias cdmk la rm vgt vgtr vgpg brb dart39 2>/dev/null

cdmk() { cd ~/dev/src/MarketPlace.Mobile.Template.FlutterApp/; }
la() { command ls -aG "$@"; }
rm() { command trash "$@"; }

vgt() { command very_good test --coverage --min-coverage 100 --exclude-coverage "**/*.g.dart" --test-randomize-ordering-seed random "$@"; }
vgtr() { command very_good test -r --coverage --exclude-coverage "**/*.g.dart" --min-coverage 100 --test-randomize-ordering-seed random "$@"; }
vgpg() { command very_good packages get -r "$@"; }
brb() { command dart run build_runner build --delete-conflicting-outputs "$@"; }
dart39() { ~/opt/dart-3.9/bin/dart "$@"; }
