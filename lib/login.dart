import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ti3app/profesores.dart';

import 'main.dart';
import 'package:http/http.dart' as http;

String username = '';

class LoginApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REGISTRO',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/profesores': (BuildContext context) => new Administracion(),
        '/main': (BuildContext context) => new MyCombinedPage(),
        '/LoginPage': (BuildContext context) => new MyHomePage(),
      },
    );

  }
  }

  class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {

  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';
  Future<List> _login() async {
  final response = await http.post("http://10.0.2.2/my_store/login.php" as Uri, body: {
  "username": user.text,
  "password": pass.text,
  });

  var datauser = json.decode(response.body);

  if(datauser.length==0){
  setState(() {
  msg="Login Fail";
  });
  }else{
  if(datauser[0]['nivel']=='super'){
  Navigator.pushReplacementNamed(context, '/powerPage');
  }else if(datauser[0]['nivel']=='bodega'){
  Navigator.pushReplacementNamed(context, '/bodegaPage');
  }

  setState(() {
  username= datauser[0]['username'];
  });

  }

  return datauser;
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: Text("Login"),),
  body: Container(
  child: Center(
  child: Column(
  children: <Widget>[
  Text("Username",style: TextStyle(fontSize: 18.0),),
  TextField(
  controller: user,
  decoration: InputDecoration(
  hintText: 'Username'
  ),
  ),
  Text("Password",style: TextStyle(fontSize: 18.0),),
  TextField(
  controller: pass,
  obscureText: true,
  decoration: InputDecoration(
  hintText: 'Password'
  ),
  ),

  TextButton(
  child: Text("Login"),
  onPressed: (){
  _login();
  Navigator.pop(context);
  },
  ),

  Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)


  ],
  ),
  ),
  ),
  );
  }

  }
