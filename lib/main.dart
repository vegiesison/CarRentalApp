import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_controls/welcome.dart';
import 'signup.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController email = TextEditingController();
  TextEditingController desiredpassword = TextEditingController();

  Future login() async {
    var url = "http://192.168.254.109/carrental/login.php";
    var response = await http.post(url, body: {
      "email": email.text,
      "desiredpassword": desiredpassword.text,
    });
    var user = json.decode(response.body);
    if (user == "Success") {
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Rent & Run',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Hi there! Nice to see you again',
                      style: TextStyle(fontSize: 12),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 12, color: Color(0xffFF1744)),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(fontSize: 12, color: Color(0xffFF1744)),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: desiredpassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(child: Text('')),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pink,
                      child: Text('Sign In'),
                      onPressed: () {
                        login();
                      },
                    )),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Or use one of your social profiles',
                      style: TextStyle(fontSize: 12),
                    )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.cyan,
                        child: Text('Twitter'),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Facebook'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Not yet registered?'),
                    FlatButton(
                      textColor: Colors.pink,
                      child: Text(
                        'Sign Up',
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
