/*
update(String token) {
  print(token);
  DatabaseReference databaseReference = new FirebaseDatabase().reference();
  databaseReference.child('fcm-token/${token}').set({"token": token});
  textValue = token;
  setState(() {});
}




get uid() {
  return (firebase.auth().currentUser || {}).uid;





import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_koi_mechanic/netImage.dart';
import 'presentation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//Map<dynamic, dynamic> map2;
var a;
var user;
class propage2 extends StatefulWidget {

  propage2(this.map3);
  // FirebaseUser user5;
  Map<dynamic, dynamic> map3;
  _propageState2 createState() => _propageState2();

}

class _propageState2 extends State<propage2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return propage(widget.map3);
    // return null;
  }

}


class propage extends StatefulWidget {

  propage(this.map);
  // FirebaseUser user5;
  Map<dynamic, dynamic> map;
  @override
  _propageState createState() => _propageState();

}

class _propageState extends State<propage> {

  var uid;
  var _result;
  //static final String path = "lib/src/pages/profile/profile7.dart";

  @override
  initState(){
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    print(widget.map);
    return Scaffold(

        floatingActionButton: FloatingActionButton(
          child: Icon(Platform.isIOS?Icons.arrow_back_ios : Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, .9),
        body:
        SafeArea(
            child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 330,
                        color: Colors.blue,
                      ),


*  Positioned(

                          top: 10,
                          right: 30,
                          child: Icon(
                          Icons.settings,
                          color: Colors.white,
                          ),
                          ),*

                      Column(
                        children: <Widget>[
                          Container(
                              height: 90,
                              margin: EdgeInsets.only(top: 60),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                                //child: PNetworkImage(rocket),
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          Text(
                            map[1],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          Text(
                            // map['Type'],

                            map[2],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 77),
                            padding: EdgeInsets.all(10),
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                          padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                          child: Text("Services",
                                              style: TextStyle(
                                                  color: Colors.black54))),
                                      Container(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Text("0",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 16))),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                          padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                          child: Text("Review",
                                              style: TextStyle(
                                                  color: Colors.black54))),
                                      Container(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Text("0",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 16))),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                          padding:
                                          EdgeInsets.only(top: 10, bottom: 5),
                                          child: Text("Earnings",
                                              style: TextStyle(
                                                  color: Colors.black54))),
                                      Container(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text("0",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 16))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          uinfo(widget.map)
                        ],
                      ),

                    ],
                  ),
                ]

            )







        )

    );
  }

}

class uinfo extends StatefulWidget {

  uinfo(this.map7);
  // FirebaseUser user5;
  Map<dynamic, dynamic> map7;
  @override
  UserInfo createState() => UserInfo();
}

class UserInfo extends State<uinfo> {
  // UserInfo(this.map7);
  //Map<dynamic, dynamic> map7;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Mechanic Information",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            leading: Icon(Icons.person),
                            title: Text("Name"),
                            subtitle: Text(
                                widget.map7['Name']
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text(widget.map7['Phone no']),
                            // subtitle: Text("sdfsdf"),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text(widget.map7['Email']),
                          ),


                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text("Address"),
                            subtitle: Text(widget.map7['Address']),
                          ),

                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("Garge Name"),
                            subtitle: Text(widget.map7['Garage Name']),
                          ),


*    ListTile(
                              leading: Icon(Icons.person),
                              title: Text("About Me"),
                              subtitle: Text(
                              "This is a about me link and you can khow about me in this section."),
                              ),*

                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}




import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_koi_mechanic/netImage.dart';
import 'presentation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
Map<dynamic, dynamic> map2,map6;
var a;
var user;
class propage2 extends StatefulWidget {

  propage2(this.map3);
  // FirebaseUser user5;
  Map<dynamic, dynamic> map3;
  _propageState2 createState() => _propageState2();

}

class _propageState2 extends State<propage2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return propage(widget.map3);
    // return null;
  }

}


class propage extends StatefulWidget {

  propage(this.map);
  // FirebaseUser user5;
  Map<dynamic, dynamic> map;
  @override
  _propageState createState() => _propageState();

}

class _propageState extends State<propage> {

  var uid;
  var _result;
  //static final String path = "lib/src/pages/profile/profile7.dart";

  @override
  initState(){


    super.initState();
    getMechdata();
    // meckCheck();
    //propage(map2);
  }
  getMechdata()async{
    user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Mechanic Data')
        .document(user.uid)
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
      map2 = ds.data;
      print(map2['Name']);
      //noti=map2['Name'];

      print(map2['Name']);
      print(map2);

      // propage(map2);
      // clPro();
    }
    );
  }
  @override
  Widget build(BuildContext context) {

    getMechdata()async{
      user = await FirebaseAuth.instance.currentUser();
      Firestore.instance
          .collection('Mechanic Data')
          .document(user.uid)
          .get()
          .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        map2 = ds.data;
        print(map2['Name']);
        //noti=map2['Name'];

        print(map2['Name']);
        print(map2);

        // propage(map2);
        // clPro();
      }
      );
    }



    // getMechdata();
    return Scaffold(

        floatingActionButton: FloatingActionButton(
          child: Icon(Platform.isIOS?Icons.arrow_back_ios : Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, .9),
        body:
        Row(
          children: <Widget>[

            SafeArea(

                child: ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 330,
                            color: Colors.blue,
                          ),
*  Positioned(

                              top: 10,
                              right: 30,
                              child: Icon(
                              Icons.settings,
                              color: Colors.white,
                              ),
                              ),*

                          Column(
                            children: <Widget>[
                              Container(
                                  height: 90,
                                  margin: EdgeInsets.only(top: 60),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    //child: PNetworkImage(rocket),
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                              Text(
                                map10['Name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                              Text(
                                map10['Type'],

                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 77),
                                padding: EdgeInsets.all(10),
                                child: Card(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                              padding:
                                              EdgeInsets.only(top: 15, bottom: 5),
                                              child: Text("Services",
                                                  style: TextStyle(
                                                      color: Colors.black54))),
                                          Container(
                                              padding: EdgeInsets.only(bottom: 15),
                                              child: Text("0",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                              padding:
                                              EdgeInsets.only(top: 15, bottom: 5),
                                              child: Text("Review",
                                                  style: TextStyle(
                                                      color: Colors.black54))),
                                          Container(
                                              padding: EdgeInsets.only(bottom: 15),
                                              child: Text("0",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                              padding:
                                              EdgeInsets.only(top: 10, bottom: 5),
                                              child: Text("Earnings",
                                                  style: TextStyle(
                                                      color: Colors.black54))),
                                          Container(
                                              padding: EdgeInsets.only(bottom: 10),
                                              child: Text("0",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              uinfo(widget.map)
                            ],
                          ),

                        ],
                      ),
                    ]

                )







            ),
          ],
        )

    );
  }

}

class uinfo extends StatefulWidget {

  uinfo(this.map7);
  // FirebaseUser user5;
  Map<dynamic, dynamic> map7;
  @override
  UserInfo createState() => UserInfo();
}

class UserInfo extends State<uinfo> {
  // UserInfo(this.map7);
  //Map<dynamic, dynamic> map7;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Mechanic Information",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            leading: Icon(Icons.person),
                            title: Text("Name"),
                            subtitle: Text(
                                map10['Name']
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text(map10['Phone no']),
                            // subtitle: Text("sdfsdf"),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text(map10['Email']),
                          ),


                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text("Address"),
                            subtitle: Text(map10['Address']),
                          ),

                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("Garge Name"),
                            subtitle: Text(map10['Garage Name']),
                          ),
*    ListTile(          splashicon
                              leading: Icon(Icons.person),
                              title: Text("About Me"),
                              subtitle: Text(
                              "This is a about me link and you can khow about me in this section."),
                              ),*

                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class LoginScreen2 extends StatelessWidget {
/*  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;
  final AssetImage logo;*/

 /* LoginScreen2({Key k, this.backgroundColor1, this.backgroundColor2, this.highlightColor, this.foregroundColor, this.logo});*/

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
          colors: [Colors.blue, Colors.green], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 150.0, bottom: 50.0),
            child: Center(
              child: new Column(
                children: <Widget>[
                  Container(
                    height: 128.0,
                    width: 128.0,
                    child: new CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.red,
                      radius: 100.0,
                      child: new Text(
                        "S",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 1.0,
                      ),
                      shape: BoxShape.circle,
                      //image: DecorationImage(image: this.logo)
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new Text(
                      "Samarth Agarwal",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.red,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding:
                  EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                  child: Icon(
                    Icons.alternate_email,
                    color: Colors.red,
                  ),
                ),
                new Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'samarthagarwal@live.com',
                      hintStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.red,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding:
                  EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.red,
                  ),
                ),
                new Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.blueAccent,
                    onPressed: () => {},
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(color: Colors.red.withOpacity(0.5)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          new Expanded(child: Divider(),),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "Don't have an account? Create One",
                      style: TextStyle(color: Colors.red.withOpacity(0.5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}