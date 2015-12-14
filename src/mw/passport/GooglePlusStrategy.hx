package mw.passport;

@:jsRequire("passport-google-plus")
extern class GooglePlusStrategy extends Strategy<Dynamic>
{
	function new( options:Dynamic, callback:Dynamic ) : Void;
}