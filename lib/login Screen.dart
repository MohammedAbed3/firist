import 'package:database_floor/databse/floor_database.dart';
import 'package:database_floor/databse/login_model.dart';
import 'package:database_floor/databse/LoginDeo.dart';
import 'package:flutter/material.dart';

class login_Screen extends StatefulWidget {

  @override
  State<login_Screen> createState() => _login_ScreenState();
}

class _login_ScreenState extends State<login_Screen> {


  @override
  void initState() {
    super.initState();
    data();

  }

  late LoginDeo logindeo2;

  Future<void> data()
  async {
    final database = await $Floorfloor_database.databaseBuilder('login_database.db').build();
    logindeo2= database.logindeo;




  }

  @override
  Widget build(BuildContext context) {

    var emilControlle = TextEditingController();
    var passwordControlle = TextEditingController();



    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          TextFormField(
            controller: emilControlle,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('E-mile'),


              prefix: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordControlle,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Password'),
              prefix: Icon(Icons.password),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: 300,
            height: 50,

            child: MaterialButton (
              onPressed: () async{
              final p = login_model(emilControlle.text, passwordControlle.text);
             await logindeo2.insertData(p);
              // print(p);


            },
              color: Colors.red,
              child: Text('login'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white
              ),),

            ),
          )
        ],
      ),

    );
  }
}
