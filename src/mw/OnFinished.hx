package mw;

import express.Request;
import express.Response;
import js.Error;

@:jsRequire("on-finished")
extern class OnFinished {
  @:override(function(req : Request, callback : Null<Error> -> Request -> Void) : Void {})
  @:selfCall static function listen(res : Response, callback : Null<Error> -> Response -> Void) : Void;

  @:override(function(req : Request) : Bool {})
  static function isFinished(res : Response) : Bool;
}
