package mw;

import express.Middleware;
import mw.jwt.*;

@:jsRequire("express-jwt")
extern class Jwt {
  @:selfCall static function protect(?options : JwtOptions) : Middleware;
}

typedef JwtOptions = {
  ?userProperty : String,
  ?credentialsRequired : Bool,
  ?getToken : Request -> String,
  ?secret : String
}