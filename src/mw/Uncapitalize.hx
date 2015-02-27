package mw;

@:jsRequire("express-uncapitalize")
extern class Uncapitalize {
  @:selfCall static function create() : Middleware;
}
