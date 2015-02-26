package mw.passport;

extern class Strategy<T> {
  var name : String;
  function authenticate(request : Request, options : T);
}