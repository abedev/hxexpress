package mw;

@:jsRequire("express-slash")
extern class Slash {
  @:selfCall static function create(?statusCode : Int) : Middleware;
}
