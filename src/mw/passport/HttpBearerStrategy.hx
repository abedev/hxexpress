package mw.passport;

import js.Error;

@:jsRequire("passport-http-bearer")
extern class HttpBearerStrategy<T> {
  function new(token : String, done : Error -> T -> Void) : Void;
}