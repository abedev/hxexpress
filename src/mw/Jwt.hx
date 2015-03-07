package mw;

import mw.Unless;
import mw.jwt.Options;

@:jsRequire("express-jwt")
extern class Jwt {
  @:selfCall static function create(?options : Options) : UnlessMiddleware;
}