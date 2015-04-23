package mw;

import mw.busboy.Options;

@:jsRequire("conntect-busboy")
extern class Busboy {
  @:selfCall function new(options : Options) : Void;
}
