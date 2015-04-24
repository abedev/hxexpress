package mw;

import express.Middleware;
import mw.busboy.Options;

@:jsRequire("connect-busboy")
extern class Busboy {
  @:selfCall static function create(?options : Options) : Middleware;
}
