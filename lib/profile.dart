import 'main.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';
//import 'package:flutter_ui_challenges/src/widgets/network_image.dart';
//import 'package:mechanic_koi_mechanic/netImage.dart';
//import 'presentation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage.dart';
import 'signin.dart';
var map5=map10;
var a,user;
class propage2 extends StatelessWidget {
  propage2(this.map);
  // FirebaseUser user5;
  Map<dynamic, dynamic> map;
  var uid;
  var _result;
  //static final String path = "lib/src/pages/profile/profile7.dart";

  @override
  initState() {
    // getMdata().then((value){
    //   print('Async done');
    //  });

    //  getMechdata();
    print('Async done');
    // print(map);
    // map2=map;
    //super.initState();
    //map=widget.user5;

  }

/*  getMechdata() async {
    user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('User Data')
        .document(user.uid)
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot

      map2=ds.data;
      print(map2['Name']);
      print(map2);
      print("dsfgsdgfsdfgsdgfsddsfdsf");
      // propage(map2);
      //clPro();
    });

    // meckCheck();
    //propage(map2);
  }*/
  @override
  Widget build(BuildContext context) {
    print("Fgdfgfdg");
    //  getMechdata();
    print(map);
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
                      /**  Positioned(

                          top: 10,
                          right: 30,
                          child: Icon(
                          Icons.settings,
                          color: Colors.white,
                          ),
                          ),**/
                      Column(
                        children: <Widget>[
                          Container(
                              height: 90,
                              margin: EdgeInsets.only(top: 60),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                                child: Image.asset('images/splashicon.png'),
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          Text(
                            map10['Name']
                            // "gvbv"
                            ,
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
                            map10['Type']
                            // "vcxv"
                            ,
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
                                          child: Text("Total Spent",
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

                          UserInfo()
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



class UserInfo extends StatelessWidget {
  // UserInfo(this.map7);
  //Map<dynamic, dynamic> map7;

  @override
  Widget build(BuildContext context) {
    print("Fgdfgfdg");
    print(map5);
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
                      "Your Information",
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
                                map5['Name']
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text(map5['Phone no']),
                            // subtitle: Text("sdfsdf"),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text(map5['Email']),
                          ),


                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text("Address"),
                            subtitle: Text(map5['Address']),
                          ),

                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("Car Name & Model"),
                            subtitle: Text(map5['Garage Name']),
                          ),
                          /**    ListTile(
                              leading: Icon(Icons.person),
                              title: Text("About Me"),
                              subtitle: Text(
                              "This is a about me link and you can khow about me in this section."),
                              ),**/
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


