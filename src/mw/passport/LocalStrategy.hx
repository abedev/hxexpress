package mw.passport;

import js.Error;

@:jsRequire("passport-local")
extern class LocalStrategy<T> {
  function new(username : String, password : String, done : Error -> T -> Void) : Void;
}