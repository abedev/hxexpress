package mw;

import express.Middleware;
import mw.jwt.*;
import mw.Unless;

@:jsRequire("express-jwt")
extern class Jwt {
  @:selfCall static function protect(?options : JwtOptions) : UnlessMiddleware;
}

typedef JwtOptions = {
  ?userProperty : String,
  ?credentialsRequired : Bool,
  ?getToken : Request -> String,
  ?secret : String
}