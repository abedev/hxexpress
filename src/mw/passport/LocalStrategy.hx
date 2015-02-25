package mw.passport;

import js.Error;

@:jsRequire("passport-local")
extern class LocalStrategy {
  function new(username : String, password : String, done : Error -> Dynamic -> Void) : Void;
}