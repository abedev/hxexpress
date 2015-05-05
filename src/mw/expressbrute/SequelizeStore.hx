package mw.expressbrute;

@:jsRequire("express-brute-sequelize")
extern class SequelizeStore implements Store {
  function new(sequelize : npm.Sequelize, tableName : String, options : SequelizeStoreOptions, callback : SequelizeStore -> Void) : Void;
}

typedef SequelizeStoreOptions = {
  ?prefix : String,
  ?logging : Bool
}
