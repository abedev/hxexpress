package mw.passport;

import express.Request;

extern class Strategy<T> {
  var name : String;
  function authenticate(request : Request, options : T) : Void;
}
