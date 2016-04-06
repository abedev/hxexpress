package mw;

import express.Middleware;
import haxe.extern.EitherType;

@:jsRequire("connect-livereload")
extern class ConnectLivereload {
  @:selfCall static function create(?options : LivereloadOptions) : Middleware;
}

typedef LivereloadOptions = {
  ?ignore : EitherType<Array<js.RegExp>, Array<String>>,
  ?include : EitherType<Array<js.RegExp>, Array<String>>,
  ?html : String -> Bool,
  ?rules : Array<MatchRule>,
  ?port : Int,
  ?src : String
}

typedef MatchRule = {
  match : js.RegExp,
  fn : String -> String -> Void
}
