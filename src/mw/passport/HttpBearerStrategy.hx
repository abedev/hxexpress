package mw.passport;

import js.Error;

@:jsRequire("passport-http-bearer")
extern class HttpBearerStrategy {
  function new(token : String, done : Error -> Dynamic -> Void) : Void;
}