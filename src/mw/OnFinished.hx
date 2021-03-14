package mw;

import express.Request;
import express.Response;

#if (haxe_ver >= 4.0)
import js.lib.Error;
#else
import js.Error;
#end

@:jsRequire("on-finished")
extern class OnFinished {
  @:overload(function(req : Request, callback : Null<Error> -> Request -> Void) : Void {})
  @:selfCall static function listen(res : Response, callback : Null<Error> -> Response -> Void) : Void;

  @:overload(function(req : Request) : Bool {})
  static function isFinished(res : Response) : Bool;
}
