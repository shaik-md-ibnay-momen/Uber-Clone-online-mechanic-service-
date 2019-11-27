import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mechanic_koi_mechanic/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:mechanic_koi_mechanic/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'test.dart';
var user;
Map<dynamic, dynamic> map10;

void main(){
  runApp(MaterialApp(
    home: splashscreen(),
  ));
}
class splashscreen extends StatefulWidget {

  @override
  _splashscreenState createState() => _splashscreenState();

}

class _splashscreenState extends State<splashscreen> {

  String id;
  @override
  void initState() {
    // chk();
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),
            () =>getMechdata());

          //  ()=>

           // Navigator.push(context,
            //    MaterialPageRoute(builder: (context)=>LoginPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            //  height: deviceInfo.size.height,
            // width: deviceInfo.size.width,
            /* height: 100,
              width: 100,
              child: Image.asset('images/splashimage.png'),*/
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/splashimage.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
           Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                     /*   CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60.0,
                          child: Image.asset('images/splashicon.png'),
                        )*/
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(backgroundColor: Colors.white,),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("One click Vehicle Mechanic",style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          )
        ],
      ),

    );

  }

  getMechdata() async {
    user = await FirebaseAuth.instance.currentUser();

    if(user!=null){
      Firestore.instance
          .collection('Mechanic Data')
          .document(user.uid)
          .get()
          .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        map10 = ds.data;
        print(map10['Name']);
        noti=map10['Name'];

        print(map10['Name']);
        print(map10);

        // propage(map2);
        //    clPro();
        chk();
      });


    }

    else{
      chk();

    }


    // meckCheck();
    //propage(map2);
  }


  void chk() async {
    user = await FirebaseAuth.instance.currentUser();
    print("sfzf");
    print("dzff");
    if(user!=null){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => homepage(user)));
    }
    else{
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => LoginPage()));
    };

    //chk2();
    }


}