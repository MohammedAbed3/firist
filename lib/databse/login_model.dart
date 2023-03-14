import 'package:floor/floor.dart';

@entity
class login_model{

  @primaryKey
  int id = 0 ;

  String email;
  String password;

  login_model(this.email, this.password);
}