package express;

@:native("Error")
extern class Error extends js.lib.Error {
  public var status : Int;
}
