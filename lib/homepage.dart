//library flutter_google_places_autocomplete.src;
import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'main.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as prefix2;
import 'package:mechanic_koi_mechanic/signUp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mechanic_koi_mechanic/signin.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart' ;
import 'package:google_maps_webservice/directions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:gms_path/gms_path.dart';
import 'package:mechanic_koi_mechanic/google_maps_requests.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mechanic_koi_mechanic/drawPoly.dart';
import 'package:poly/poly.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:mechanic_koi_mechanic/realtime.dart';
import 'profile.dart';
import 'signin.dart';
import 'test.dart';
var client,token2;
var name='';
var user;
double  curlng,curlat, deslng,deslat;
var ltln =List(2),ab,noti="shaikh";
LatLng  cur,des;
const oneSecond = const Duration(seconds:5);
var pnt1,pnt2,pnt3,pnt4,pnt5,pnt6,pntln;
var __center;
var mLAt,mLng,mLoc,mStatus;
Map<dynamic,dynamic> data;
Map<dynamic, dynamic> map2;
String notid;
final databaseReference = FirebaseDatabase.instance.reference();
class homepage extends StatefulWidget {

 homepage(this.user3);
 FirebaseUser user3;

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
  Set<Marker> _markers = new Set();
  TextEditingController locationController = TextEditingController();
  static const LatLng _mainLocation = LatLng(23.8103, 90.4125);
  Completer<GoogleMapController> _controller1 = Completer();
  final LatLng _center = const LatLng(23.8103, 90.4125);
  final databaseReference = Firestore.instance;
  String searchAddr;
  var location = new Location2();
  static const kGoogleApiKey = "AIzaSyBhrISC6WhEbIItMqafeBPPx3xqI3ru-n0";
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();

  GoogleMapsServices get googleMapsServices => _googleMapsServices;
  GoogleMapController mapController;
  Map<String, double> userLocation;
  final Set<prefix2.Polyline>_polyLines = {};

  LatLng get initialPosition => _initialPosition;

  LatLng get lastPosition => _lastPosition;

  //GooglePlaces googlePlaces;
  bool isSwitched = true;
  Map<PolygonId, Polygon> polygons = <PolygonId, Polygon>{};
  bool pressed = true;
  final FirebaseMessaging _messaging = FirebaseMessaging();

  final Firestore _fireStore = Firestore.instance;

  String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  new FlutterLocalNotificationsPlugin();


  showExitPopup() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirm"),
            content: Text("Do you want to exit"),
            actions: <Widget>[
              RaisedButton(
                  child: Text("No"),
                  color: Colors.white,

                  onPressed: () {
                    Navigator.of(context).pop();
                  }),

              RaisedButton(
                  child: Text("Yes"),
                  color: Colors.white,

                  onPressed: () {
                    SystemNavigator.pop();
                  })
            ],
          );
        });
  }

  @override
  initState() {

//getData();
    // TODO: implement initState
    super.initState();
    _offLocation();
    _messaging.getToken().then((token) {
      //print(token);
      print("okokokokokokokokok");


      var android = new AndroidInitializationSettings('mipmap/ic_launcher');
      var ios = new IOSInitializationSettings();
      var platform = new InitializationSettings(android, ios);
      var initSetttings = new InitializationSettings(android, ios);
      flutterLocalNotificationsPlugin.initialize(platform);
      flutterLocalNotificationsPlugin.initialize(initSetttings,
          onSelectNotification: onSelectNotification2);

      firebaseMessaging.configure(
        onLaunch: (Map<String, dynamic> msg) {
          print(" onLaunch called ${(msg)}");
        },
        onResume: (Map<String, dynamic> msg) {

          print(" onResume called ${(msg)}");
        },
        onMessage: (Map<String, dynamic> msg) {
          showNotification(msg);
          print(" onMessage called ${(msg)}");
        },
      );

      firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(sound: true, alert: true, badge: true));
      firebaseMessaging.onIosSettingsRegistered
          .listen((IosNotificationSettings setting) {
        print('IOS Setting Registed');
      });

        firebaseMessaging.getToken().then((token) {
       update(token);
       token2=token;
        print(token);
          });

      print("okok");
    });
    //markers = _markers(widget.markers);


  }

  Future onSelectNotification2(String payload) async {

    var result = (await FirebaseDatabase.instance.reference().child("pushToken/$token2/uid").once()).value;

    Firestore.instance
        .collection('User Data')
        .document(result)
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot

      map2 = ds.data;
      print(map2['Name']);
      noti=map2['Name'];
      print(map2);
      // propage(map2);
      notid=map2['Name']+' is calling for a service from '+ map2['Address'];
      debugPrint("payload : $payload");
      showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text('Notification'),
          content: new Text(notid),
actions: <Widget>[
   RaisedButton(
      color: Colors.lightBlue,
      textColor: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          //Icon(Icons.phone),
          Text("Confirm")
        ],

      ),

      onPressed:
      ()=> deleteData()
     //()=> _currentLocation()
        //  Navigator.push(context,
        //  MaterialPageRoute(builder: (context) => LoginPage()
      //))
   ),
],
        ),
      );

    });


  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () {
        showExitPopup();
      },
      child: Scaffold(


        appBar: AppBar(

          // Icon(Icons.notifications),
          title: Text("Mechanic koi?"),
          actions: <Widget>[

            IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  PopupMenuItem(
                    value: 1,
                    child: Text("First"),
                  );
                  PopupMenuItem(
                    value: 2,
                    child: Text("Second"),
                  );
                }
            )
          ],

        ),

        drawer: Drawer(
            child: ListView(

              children: <Widget>[

                DrawerHeader(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          Colors.indigo,
                          Colors.blueAccent
                        ])
                    ),
                    child: Container(
                      child: Column(
                        children: <Widget>[

                          Material(
                            borderRadius: BorderRadius.all(
                                Radius.circular(50.0)),
                            elevation: 10,

                            child: Padding(padding: EdgeInsets.all(8.0),
                              child: Image.asset('images/splashicon.png',
                                width: 80, height: 80,),),
                          ),
                          Text(  map10['Name'],

                            style: TextStyle(
                              color: Colors.white, fontSize: 20.0),),
                          Text(   map10['Email'],

                            style: TextStyle(
                              color: Colors.white, fontSize: 15.0),)
                        ],
                      ),
                    )),
                CustomListTile(Icons.person, "Profile", (){
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>propage2(map10)));
                    }),
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>propage(widget.user3)))),
                //CustomListTile(Icons.notifications,"Notification",()=>{}),
               // CustomListTile(FontAwesomeIcons.medal, "Meadls", () => {}),
                //CustomListTile(Icons.library_books, "History", () => {}),
               // CustomListTile(Icons.credit_card, "Payment", () => {}),
               // CustomListTile(Icons.settings, "Settings", () => {}),
                CustomListTile(Icons.exit_to_app, "LogOut", () => logOut()),

                //footer section
                Material(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                    child: Center(
                      child: Text("Connect With Us",
                        style: TextStyle(fontSize: 18.0, color: Colors.blue),),
                    ),
                  ),
                ),

                Material(
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 80.0),
                    margin: EdgeInsets.fromLTRB(80.0, 0.0, 85.0, 0.0),


                    child: Row(


                      children: <Widget>[
                        //Text("Connect With Us"),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:
                            //Icon(FontAwesomeIcons.facebook,size: 40,),
                            IconButton(
                                icon: Icon(FontAwesomeIcons.facebook,
                                  size: 40,),

                                onPressed: _launchURL1

                            )


                        ),
                        //Icon(FontAwesomeIcons.mailBulk,size: 40,)
                        IconButton(
                            icon: Icon(FontAwesomeIcons.googlePlus, size: 40,),

                            onPressed: _launchURL2

                        )
                      ],
                    ),
                  ),
                ),
// rate us portion start  here

                Material(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: RaisedButton(
                        child: Text("Rate Us", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                        onPressed: () {
                          LaunchReview.launch(
                              androidAppId: "com.mechanickoi.mechanic_test",
                              iOSAppId: ""
                          );
                        }),
                  ),
                )

              ],

            )
        ),
        //body start

        body: Stack(

          children: <Widget>[


            GoogleMap(

              //onMapCreated: _onMapCreated,
              onMapCreated: (controller) {
                _controller1.complete(controller);
                mapController = controller;
                //mapController.clearMarkers();
              },
              markers: _markers,
              polylines: _polyLines,
              myLocationEnabled: true,
              polygons: Set<Polygon>.of(polygons.values),
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),

              myLocationButtonEnabled: false,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              rotateGesturesEnabled: true,
              compassEnabled: true,
              //  markers:  this.myMarker(),
            ),


            Positioned(

              bottom: 80,
              right: 10,
              child: FloatingActionButton(

                  heroTag: "btn1",
                  child: Icon(Icons.directions),
                  onPressed: () {
                    _offLocation();
                    _setroute();
                  }
              ),
            ),

            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                  heroTag: "btn2",
                  child: Icon(Icons.my_location),
                  onPressed: () {
                   // update();
                    _currentLocation();
                  }
              ),
            ),



 /*           Positioned(
              bottom: 80,
              left: 10,
              child: RaisedButton(

                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.phone),
                      Text("CaLL Client")
                    ],

                  ),

                  onPressed: () {

                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen2()),
                        );
                    //getData();
                    //_offLocation2();
                  }
              ),
            ),*/



            Positioned(
              bottom: 10,
              left: 10,
              child: RaisedButton(

                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.phone),
                      Text("CaLL Client")
                    ],

                  ),

                  onPressed: () {
                    launch("tel://$client");
                    /** Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => screen()),
                        );**/
                    //getData();
                    //_offLocation2();
                  }
              ),
            ),


            Positioned(
              top: 17.0,
              right: 15.0,
              left: 15.0,
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                ),
                child: TextField(
                  //controller: appState.locationController,
                    decoration: InputDecoration(
                      hintText: 'Enter Address',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15.0, left: 15.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _markers.remove('1st');
                          searchandNavigate();
                        },

                        iconSize: 30.0,
                        color: Colors.blueAccent,
                      ),

                    ),
                    onChanged: (val) {
                      setState(() {
                        searchAddr = val;
                      });
                    }
                ),

              ),

            ),

            SizedBox(height: 100.0,),
          ],
        ),

      ),

    );
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginPage()));
  }


  getData() {

      databaseReference
      .collection("Mechanic Data")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
      Map <dynamic, dynamic> _userdata ;
      DocumentSnapshot d;
      snapshot.documents.forEach((f) =>     Firestore.instance
          .collection('Mechanic Data')
          .document(f.documentID)
          .get()
          .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        _userdata = ds.data;
        print(_userdata['Latitude']);
        //noti=map2['Name'];
       // print(map2);

        // propage(map2);
        //clPro();
      }
      )
      );
     // print(d.documentID);

    // snapshot.documents.forEach((f1) =>print('${f1.documentID}}'));
//print(snapshot.documents);
//while(snapshot.documents!=null){
 // snapshot.documents.forEach((f) =>_userdata=f.data);
 // print(_userdata['Name']);
//}


      //print();
     // getData();
      });

      }

  /**getData() {

      databaseReference
      .collection("Profile")
      .getDocuments()

      .then((QuerySnapshot snapshot) {
      Map <dynamic, dynamic> _userdata ;

      snapshot.documents.forEach((f) =>_userdata=f.data);

      //  print(_userdata['Name']);
      name = _userdata['Name'];
      });

      }**/

/*  void createRecord() async {
    await databaseReference.collection("Location")
        .document(widget.user3.uid)
        .setData({
      'Latitude': curlat,
      'Longitude': curlng
    });

    //print(ref.documentID);
  }*/


  _recordLocation() async {
 /*   await databaseReference.collection("Mechanic Data")
        .document(widget.user3.uid)
        .setData({
      'Latitude': curlat,
      'Longitude': curlng
    });*/
var ud=widget.user3.uid;
    Firestore.instance.collection('Mechanic Data')
        .document(ud)
        .updateData(
        {
      'Latitude': curlat,
      'Longitude': curlng
        }
      );
    //DocumentReference ref = await databaseReference.collection("books")
    /**.add({
        'title': 'Flutter in Action',
        'description': 'Complete Programming Guide to learn Flutter'
        });**/
    //print(ref.documentID);
  }


  _setroute() async {
   // _offLocation();
    //String route = await _googleMap
    print(curlat);
    print(deslat);
    String route = await _googleMapsServices.getRouteCoordinates(
        _initialPosition, des
    );
    print('hfhgjjhjkhkjkhkjhjhgfhfhgj    $route');
    createRoute(route);
  }

  void createRoute(String encondedPoly) {
    prefix2.LatLng _lastPosition = LatLng(23.7418, 90.4573);
    _polyLines.add(prefix2.Polyline(
        polylineId: PolylineId(_lastPosition.toString()),
        width: 7,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: Colors.blue));
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

// !DECODE POLY
  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
// repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

/*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++)
      lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }


  searchandNavigate() {
    Geolocator().placemarkFromAddress(searchAddr).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
          LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 14.0)));
      ltln[0] = result[0].position.latitude;
      ltln[1] = result[0].position.longitude;
      des = LatLng(result[0].position.latitude, result[0].position.longitude);
      deslng = result[0].position.latitude;
      deslat = result[0].position.longitude;
      _handleTap();
    });
  }

  _handleTap() {
    LatLng pos = LatLng(ltln[0], ltln[1]);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('1st'),
        position: pos,
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),

      ),
      );
    });

    return _markers;
  }

//body end
//for icon
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


  _offLocation() async {
    final GoogleMapController controller = await _controller1.future;
    LocationData currentLocation;

    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }
    cur = LatLng(currentLocation.latitude, currentLocation.longitude);
    _initialPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);
    curlat = currentLocation.latitude;
    curlng = currentLocation.longitude;
    _recordLocation();
  }

  _offLocation3() async {
    final GoogleMapController controller = await _controller1.future;
    LocationData currentLocation;

    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }
    cur = LatLng(currentLocation.latitude, currentLocation.longitude);
    _initialPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);
    curlat = currentLocation.latitude;
    curlng = currentLocation.longitude;
    _recordLocation();
  }

  _currentLocation() async {
    final GoogleMapController controller = await _controller1.future;
    LocationData currentLocation;

    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 18.0,

      ),

    ));
    curlat = currentLocation.latitude;
    curlng = currentLocation.longitude;
    _initialPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);

    print("asfdsf");

    print(widget.user3.uid);
    _recordLocation();
    __center = Point(currentLocation.latitude, currentLocation.longitude);
    pntln = 111.320 * cos(currentLocation.longitude);
  }

  _offLocation2() async {
    final GoogleMapController controller = await _controller1.future;
    LocationData currentLocation;

    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 18.0,

      ),

    ));
    curlat = currentLocation.latitude;
    curlng = currentLocation.longitude;
    _initialPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);

    print("asfdsf");

    print(widget.user3.uid);
    _recordLocation();
    __center = Point(currentLocation.latitude, currentLocation.longitude);
    pntln = 111.320 * cos(currentLocation.longitude);

    checkPoint();
  }


  checkPoint() {
    pnt5 = 1 / pntln;
    pnt6 = pnt5 * 2;
    pnt1 = radianPoint(__center, 0.018087, 6.28319);
    pnt2 = radianPoint(__center, 0.018087, 3.14159);
    pnt3 = radianPoint(__center, pnt6, 1.5708);
    pnt4 = radianPoint(__center, pnt6, 4.71239);
    print(pnt1);
    print(pnt2);
    print(pnt3);
    print(pnt4);

    databaseReference
        .collection("Garage")
        .getDocuments()

        .then((QuerySnapshot snapshot) {
      Map <dynamic, dynamic> _mechdata;

      snapshot.documents.forEach((f) => _mechdata = f.data);



      print(_mechdata);
      print(_mechdata['Phone No']);
      print(_mechdata['Lng']);
      print(_mechdata['Lat']);
      mStatus = _mechdata['Status'];
      mLAt = _mechdata['Lat'];
      mLng = _mechdata['Lng'];
    });


    //meckCheck();
    getMdata();
  }


  Point radianPoint(Point center, double r, double radian) {
    return Point(center.x + r * cos(radian), center.y + r * sin(radian));
  }

  meckCheck() {
    Point in1 = Point(mLAt, mLng);

    Polygon2 copyOfFirstPolygon2 = Polygon2([
      pnt1, pnt3, pnt2, pnt4
    ]);

    // print( "${++example_count}. in1=(23.807247,90.415828) is inside testWyse - ${copyOfFirstPolygon.isPointInside(in1)}");
    //print( "${++example_count}. in1=(23.771644,90.408468) is inside testWyse - ${copyOfFirstPolygon2.isPointInside(in1)}");
    mLoc = copyOfFirstPolygon2.isPointInside(in1);
    // print(mLoc);
    sendNotification();
  }

  getMdata() async {
    Firestore.instance
        .collection('Location')
        .document()
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
      Map<dynamic, dynamic> map;

      map = ds.data;
      print(map['Name']);
      print(map);
    });
    //meckCheck();
  }

  getMechdata() async {
    user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Mechanic Data')
        .document(user.uid)
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
      map2 = ds.data;
      print(map2['Name']);
      noti=map2['Name'];

      print(map2['Name']);
      print(map2);

      // propage(map2);
    //  clPro();
    });

    // meckCheck();
    //propage(map2);
  }

  clPro() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => propage2(map2)));
  }

  sendNotification() {
    // print("Condition Working");
    if (mLoc && mStatus == true) {
      print("Condition Working");
// Navigator.push(context,
      //   MaterialPageRoute(builder: (context)=>MyApp5()));

    }
    else {
      print("Condition not Working");
    }
  }

   deleteData(){
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child('notification').remove();

getUid();
  }

  getUid(){
    firebaseMessaging.getToken().then((token) async{
      //update(token);
      print(token);
      print(token);
      String result = (await FirebaseDatabase.instance.reference().child("pushToken/$token/uid").once()).value;
      print(result);


      Firestore.instance
          .collection('User Data')
          .document(result)
          .get()
          .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        Map <dynamic, dynamic> map5;
        map5 = ds.data;
        print(map5['Phone no']);
      // noti=map2['Name'];
        client=map5['Phone no'];
        print(client);
        deslng= map5['Latitude'];
        deslat=map5['Longitude'];
        des=LatLng(deslng,deslat);
        _offLocation3();
         _setroute();
        // propage(map2);
      //  clPro();
      });

    });

   // print(result);
  }


  showNotification(Map<String, dynamic> msg) async {
    var android = new AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, "Calling For a Service", "Tap to see details" , platform);
  }




  update(String token) {
    var ud= widget.user3.uid;
    print("fgfdgfdgdfgdfdfgfdgfdg");
    print(token);
    DatabaseReference databaseReference = new FirebaseDatabase().reference();
    databaseReference.child('fcm-token/${token}').set({"token": token});
    textValue = token;
    setState(() {});

    Firestore.instance.collection('Mechanic Data')
        .document(ud)
        .updateData({'Token':token});


    print(ud);
  }
}
/**StreamBuilder(
stream: Firestore.instance.collection('mountains').snapshots,
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
if (!snapshot.hasData) return new Text('Loading...');
return new ListView(
children: snapshot.data.documents.map((document) {
return new ListTile(
title: new Text(document['title']),
subtitle: new Text(document['type']),
);
}).toList(),
);
},
);**/
//icon end
//coustom code for sidebar widget
class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          splashColor: Colors.indigo,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(icon),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(text,style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


