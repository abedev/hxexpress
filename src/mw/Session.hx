package mw;

@:jsRequire("express-session")
extern class Session
{
	@:selfCall static function create( options:Dynamic ) : express.Middleware;
}