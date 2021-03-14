package express;

@:native("Error")
extern class Error extends #if (haxe_ver>=4.0) js.lib.Error #else js.Error #end {
  public var status : Int;
}
