

import 'package:floor/floor.dart';

import 'login_model.dart';

@dao
abstract class LoginDeo{

  @insert
  Future<void> insertData (login_model m );

  @update
  Future<void> updateData (login_model m);

  @delete
  Future<void> deleteData (login_model m);

  @Query('SELECT * FROM login_model')
  Future<login_model?> getData ();



}