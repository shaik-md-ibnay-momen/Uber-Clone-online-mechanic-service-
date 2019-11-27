import 'dart:core';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:mechanic_koi_mechanic/homepage.dart';
import 'package:mechanic_koi_mechanic/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
var token;
var user5;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final databaseReference = Firestore.instance;
  bool _isHidden = true;
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: new AppBar(),
      body: SingleChildScrollView(
        child: Form(

            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //SizedBox(height: 25.0,),
                showAlert(),
                SizedBox(height: 80%MediaQuery.of(context).size.height,),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60.0,
                  child: Image.asset('images/splashicon.png'),
                ),
                SizedBox(height: 100%MediaQuery.of(context).size.height,),


                buildTextField2("Email"),

                SizedBox(height: 10%MediaQuery.of(context).size.height,),

                buildTextField("Password"),
                SizedBox(height: 10%MediaQuery.of(context).size.height,),
             /*   Container(
                  padding: EdgeInsets.only(right:25.0, top: 5.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    
                    children: <Widget>[
                      Text(
                        "Forgotten Password?",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),

                      ),
                    ],
                  ),
                ),*/
             /*     ButtonTheme(
                    minWidth: 200.0,
                    height: 30.0,

                    child: RaisedButton(

                      //onPressed:signIn,
                        onPressed: (){

                          signIn();

                        },
                      child: Text('Sign in',
                      style: TextStyle(
                        fontSize: 17.5
                      ),

                      ),

                      padding: EdgeInsets.all(12.0),
                      splashColor: Colors.lightBlueAccent,
                      color:  Colors.blue,

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      textColor: Colors.black,
                    ),

                  ),*/

                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                  alignment: Alignment.center,
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          color: Colors.blue,
                          onPressed: () {
                            signIn();
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
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
                            style: TextStyle(color: Colors.blueAccent.withOpacity(0.8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),



                Container(
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
                          onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage() ));

                          },
                          child: Text(
                            "Don't have an account? Create One",
                            style: TextStyle(color: Colors.blue.withOpacity(1.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    /*            SizedBox(height: 20.0,),
                ButtonTheme(
                  minWidth: 160.0,
                  height: 30.0,

                  child: RaisedButton(

                    //onPressed:signIn,
                    onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage() ));

                    },
                    child: Text('SIGN UP',
                      style: TextStyle(
                          fontSize: 17.5
                      ),

                    ),

                    padding: EdgeInsets.all(12.0),
                    splashColor: Colors.lightBlueAccent,
                    color:  Colors.blue,

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    textColor: Colors.black,
                  ),

                ),
                SizedBox(height: 10.0,),


                SizedBox(height: 100%MediaQuery.of(context).size.height,),*/
                Container(

                  margin: EdgeInsets.fromLTRB(80.0, 0.0, 85.0, 0.0),


                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Text("Connect With Us"),
                      Padding(
                          padding: const EdgeInsets.only(left:0.0),
                          child:
                          //Icon(FontAwesomeIcons.facebook,size: 40,),
                          IconButton(
                              icon: Icon(FontAwesomeIcons.facebook,size: 40,),

                              onPressed: _launchURL1

                          )



                      ),
                      SizedBox(width: 10%MediaQuery.of(context).size.width,),
                      //Icon(FontAwesomeIcons.mailBulk,size: 40,)
                      IconButton(
                          icon: Icon(FontAwesomeIcons.googlePlus,size: 40,),

                          onPressed: _launchURL2

                      )
                    ],
                  ),
                ),

              ],


            )
        ),
      ),



    );
  }

 signIn() async {
   if (_formKey.currentState.validate()) {
     _formKey.currentState.save();
     try {
       var user = (await FirebaseAuth.instance
           .signInWithEmailAndPassword(email: _email, password: _password));

     user5= await FirebaseAuth.instance.currentUser();
       //Navigator.push(context, MaterialPageRoute(builder: (context) => homepage() ));

    FirebaseUser user2= user.user;
       print('This is ${user2.uid}');
       //String id =user2.uid;

       /*Navigator.push(context,
           MaterialPageRoute(builder: (context) => homepage(user2)));*/

       if(user5!=null){

        getMechdata();

       }
     }
     catch (e) {
       setState(() {
         _error = "Invalid Email or Password";
       });
       print(e.message);
       print("Invalid Username or Password");
     }
   }
 }

  getMechdata() {
    //user5 = await FirebaseAuth.instance.currentUser();

    if(user5!=null) {
      Firestore.instance
          .collection('Mechanic Data')
          .document(user5.uid)
          .get()
          .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        map10 = ds.data;
        print(map10['Name']);
        noti = map10['Name'];

        print(map10['Name']);
        print(map10);

        // propage(map2);
         clPro();
      });
    }
    // meckCheck();
    //propage(map2);
  }

  clPro() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => homepage(user5)));
  }

    Widget showAlert() {
      if (_error != null) {
        return Container(
          color: Colors.amberAccent,
          width: double.infinity,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.error_outline),
              ),
              Expanded(
                child: Text(
                  _error,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  },
                ),
              )
            ],
          ),
        );
      }
      return SizedBox(
        height: 0,
      );
    }




  Widget buildTextField(String hintText){
    return Container(
      width: 350.0,
      child: TextFormField (


        validator: (input) {
          if(input.length < 6){
            return 'Input your Password';

          }

        },
        decoration: InputDecoration(

          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          //border: Border(),
          prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password" ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ) : null,
        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _password = input,
      ),
    );
  }


  Widget buildTextField2(String hintText){
    return Container(
      width: 350.0,
      child: TextFormField(

        validator: (input) {
          if(input.isEmpty){
            return 'Input your email';
          }
        },

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        //  border: InputBorder.none,
          prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password" ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ) : null,
        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _email = input,
      ),
    );
  }

  _launchURL1() async {
    const url = 'https://facebook.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    const url = 'https://google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}