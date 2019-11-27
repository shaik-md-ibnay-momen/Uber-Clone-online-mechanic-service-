import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:mechanic_koi_mechanic/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mechanic_koi_mechanic/signin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

String _email, _password, _error, _name,_address, _grage, _phone,_cpassword,_area;
double  lat,lng;
var dtoken;
var user;
int passlen;

class signupPage extends StatefulWidget {
  @override
  _signupPageState createState() => new _signupPageState();
}
class _signupPageState extends State<signupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _error, _name,_address, _grage, _phone,_cpassword;
  final databaseReference = Firestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging();
  bool _isHidden = true;
  FirebaseUser user2;
  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  initState() {
//getData();
    // TODO: implement initState

    _messaging.getToken().then((token) {
      print(token);
      dtoken=token;
      print(dtoken);
    });
    super.initState();
    //markers = _markers(widget.markers);

  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      //appBar: new AppBar(),
      body: SingleChildScrollView(
        child: Form(

            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //SizedBox(height: 25.0,),
               // showAlert3(),
                SizedBox(height: 80%MediaQuery.of(context).size.height,),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60.0,
                  child: Image.asset('images/splashicon.png'),
                ),
                SizedBox(height: 100%MediaQuery.of(context).size.height,),


               buildTextField3("Name"),
                SizedBox(height: 10.0,),
                buildTextField4("Address"),
                SizedBox(height: 10.0,),
                buildTextField8("Area & City"),
                SizedBox(height: 10.0,),
                buildTextField5("Garage Name"),
                SizedBox(height: 10.0,),
                buildTextField6("Phone no"),
                SizedBox(height: 10.0,),
                buildTextField("Password"),
                SizedBox(height: 10.0,),
                buildTextField7("Confirm Password"),
                SizedBox(height: 10.0,),
                buildTextField2("Email"),



              //  SizedBox(height: 10%MediaQuery.of(context).size.height,),

                //buildTextField("Password"),
                SizedBox(height: 10%MediaQuery.of(context).size.height,),
              /**  Container(
                  padding: EdgeInsets.only(right:25.0, top: 5.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    /**children: <Widget>[
                      Text(
                        "Forgotten Password?",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),

                      ),
                    ],**/
                  ),
                ),**/
                SizedBox(height: 10.0,),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 30.0,

                  child: RaisedButton(

                    //onPressed:signIn,
                    onPressed: (){
                         checkPass();
                     // signIn();
                      //firebaseAuth();
                    },
                    child: Text('Register',
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



               /** Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(""
                            "Don't have an account?"),
                        SizedBox(width: 10.0,),
                        Text("SIGN UP", style: TextStyle(color: Theme.of(context).primaryColor,))
                      ],
                    ),
                  ),
                ),**/
                SizedBox(height: 100%MediaQuery.of(context).size.height,),
                Container(

                  margin: EdgeInsets.fromLTRB(80.0, 0.0, 85.0, 0.0),


                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Connect With Us"),
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

  checkPass()async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      passlen = _password.length;
      if (passlen < 6) {
        showAlert2();
      }
      if (_password != _cpassword) {
        showAlert();
      }
      else {
        firebaseAuth();
      };
    }
  }


  firebaseAuth() async{
    if (_formKey.currentState.validate()) {
      latlnCheck();
      _formKey.currentState.save();
      print(_email);
      print( _password);

      try {
        user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        //print("An error occured while trying to send email verification");
        print(e.message);
        showAlert3();
      }

      var addresses = await Geocoder.local.findAddressesFromQuery(_area);
      var first = addresses.first;
      print("${first.featureName} : ${first.coordinates}");
      print("dsfdfhgjkk");

     user2= user.user;
    // FirebaseUser user2=user as FirebaseUser;
      //await user2.sendEmailVerification();
     print(user2.uid);
     try {
        var flag= await user2.sendEmailVerification();
        print(user2.uid);

        recordData();
      } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => signupPage()));
      }

    }

  }

  latlnCheck(){
    Geolocator().placemarkFromAddress(_area).then((result) {

      lat=result[0].position.latitude;
      lng=result[0].position.longitude;
    //  des= LatLng(result[0].position.latitude, result[0].position.longitude);
     // deslng=result[0].position.latitude;
     // deslat=result[0].position.longitude;
      print(lat);
      print(lng);
    });
  }

  recordData()async{
    print(dtoken);
    await databaseReference.collection("Mechanic Data")
        .document(user2.uid)
        .setData({
      'Name':  _name,
      'Address': _address+","+_area,
      'Phone no':  _phone,
      'Email': _email,
      'Garage Name': _grage,
      'Latitude':  lat,
      'Longitude': lng,
      'Token':  dtoken,
      'Status':true,
      'Type':'Mechanic',
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginPage()));
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password"  ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ):hintText == "Confirm Password"  ? IconButton(
    onPressed: _toggleVisibility,
    icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility)) : null,

        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _email = input,
      ),

    );
  }

  Widget buildTextField3(String hintText){
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Name" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password"  ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ):hintText == "Confirm Password"  ? IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility)) : null,

        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _name = input,
      ),

    );
  }

  Widget buildTextField8(String hintText){
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Name" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password"  ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ):hintText == "Confirm Password"  ? IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility)) : null,

        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _area = input,
      ),

    );
  }


  Widget buildTextField4(String hintText){
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Address" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password"  ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ):hintText == "Confirm Password"  ? IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility)) : null,

        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _address = input,
      ),

    );
  }

  Widget buildTextField5(String hintText){
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Garage Name" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password"  ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ):hintText == "Confirm Password"  ? IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility)) : null,

        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _grage = input,
      ),

    );
  }

  Widget buildTextField6(String hintText){
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Phone no" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password"  ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ):hintText == "Confirm Password"  ? IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility)) : null,

        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _phone = input,
      ),

    );
  }



  Widget buildTextField7(String hintText){
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Confirm Password" ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ) : null,
        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _cpassword = input,
      ),
    );
  }

  Widget showAlert() {

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
                "Password doesn't match",
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _password = null;
                    _cpassword=null;
                  });
                },
              ),
            )
          ],
        ),
      );

    return SizedBox(
      height: 0,
    );
  }

  Widget showAlert2() {

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
              "Password is less then 6 Char.",
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _password = null;
                  _cpassword=null;
                });
              },
            ),
          )
        ],
      ),
    );

    return SizedBox(
      height: 0,
    );
  }

  Widget showAlert3() {

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
              "The email address is already in use by another account.",
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _password = null;
                  _cpassword=null;
                });
              },
            ),
          )
        ],
      ),
    );

    return SizedBox(
      height: 0,
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