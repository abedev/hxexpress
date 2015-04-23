package mw;

import express.Middleware;
import mw.busboy.Options;

@:jsRequire("conntect-busboy")
extern class Busboy {
  @:selfCall static function create(?options : Options) : Middleware;
}
