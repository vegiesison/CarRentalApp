import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';

class SecondScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SecondScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController desiredpassword = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController contactnumber = TextEditingController();

  Future register() async {
    var url = "http://192.168.254.109/carrental/register.php";
    var response = await http.post(url, body: {
      "email": email.text,
      "desiredpassword": desiredpassword.text,
      "lastname": lastname.text,
      "firstname": firstname.text,
      "contactnumber": contactnumber.text,
    });
    var data = json.encode(response.body);
    if (data == "error") {
      Fluttertoast.showToast(
          msg: "This user already exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registered Succesfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
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
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
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
                      hintText: 'you@example.com',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Desired Password',
                      style: TextStyle(fontSize: 12, color: Color(0xffFF1744)),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: desiredpassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lastname',
                      style: TextStyle(fontSize: 12, color: Color(0xffFF1744)),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: lastname,
                    decoration: InputDecoration(
                      hintText: 'Your Lastname',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Firstname',
                      style: TextStyle(fontSize: 12, color: Color(0xffFF1744)),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: firstname,
                    decoration: InputDecoration(
                      hintText: 'Your Firstname',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Contack Number',
                      style: TextStyle(fontSize: 12, color: Color(0xffFF1744)),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: contactnumber,
                    decoration: InputDecoration(
                      hintText: '+639*********',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 12, color: Color(0xffFF1744)),
                    )),
                Container(
                    height: 40,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pink,
                      child: Text('Submit'),
                      onPressed: () {
                        register();
                        print(email.text);
                        print(desiredpassword.text);
                        print(lastname.text);
                        print(firstname.text);
                        print(contactnumber.text);
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Already have an account?'),
                    FlatButton(
                      textColor: Colors.pink,
                      child: Text(
                        'Sign In',
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
