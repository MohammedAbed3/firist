import 'dart:async';

import 'package:database_floor/databse/login_model.dart';
import 'package:database_floor/databse/LoginDeo.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_database.g.dart'; // the generated code will be there




@Database(version: 5, entities: [login_model])
abstract class floor_database extends FloorDatabase{

  LoginDeo get logindeo;
}