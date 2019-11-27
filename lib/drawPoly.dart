import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mechanic_koi_mechanic/homepage.dart';
import 'package:mechanic_koi_mechanic/homepage.dart';

class screen extends StatefulWidget {
  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {

  final LatLng _center = const LatLng(23.8103, 90.4125);

  var __center = Point(23.8103, 90.4125);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
          bottom: 10,
            right: 10,
            child:  FloatingActionButton(
                heroTag: "btn2",
                child: Icon(Icons.my_location),
                onPressed:(){
var pntln= 111.320*cos(90.4125);
var pnt5= 1/pntln;
var pnt6= pnt5*2;

                 var pnt1= radianPoint(__center, 0.018087 ,6.28319);
                 var pnt2= radianPoint(__center, 0.018087 ,3.14159);
                 var pnt3= radianPoint(__center, pnt6 ,1.5708);
                  var pnt4= radianPoint(__center, pnt6 ,4.71239);
                 print(pnt1);
                 print(pnt2);
print(pnt3);
print(pnt4);
                }
            ),
          ),


        ],


      )

    );


  }
  Point radianPoint(Point center, double r, double radian) {
    return Point(center.x + r * cos(radian), center.y + r * sin(radian));
  }

}