#!/bin/sh
haxe build.hxml
haxelib run dox -o docs -i xml/js.xml --title "Express Externs and Middleware for Haxe" -in mw -in express -theme flambe
git archive -o docs/offline.zip HEAD docs
rm -f docs/offline.zip
zip -r docs/offline.zip docs -x "*/\.*"
