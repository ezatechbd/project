import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cityLondon = LatLng(51.5073509, -0.1277583);
  final cityParis = LatLng(48.856614, 2.3522219);
  var distance = 0.0;
  var currentLat = 0.0;
  var currentLong = 0.0;

  bool isOnPolygon = false;

  Future getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      currentLat = _locationData.latitude;
      currentLong = _locationData.longitude;
    });
    log('Current LatLng: $currentLat, $currentLong');
    // return currentLong;
  }

  isInBoundary() {
    LatLng point = LatLng(currentLat, currentLong);
    List<LatLng> polygon = [
      LatLng(23.876599830699234, 90.39061613022604),
      LatLng(23.87660044386518, 90.39064161121154),
      LatLng(23.876601057031106, 90.39068385600328),
      LatLng(23.876605962358486, 90.39072475969054),
      LatLng(23.8766035096949, 90.39075292288503),
      LatLng(23.876600443865254, 90.39078175663178),
      LatLng(23.876562427571606, 90.39078242718404),
      LatLng(23.876513374273, 90.39078309773629),
      LatLng(23.876469226288346, 90.39078376828853),
      LatLng(23.876466160455525, 90.39072543024278),
      LatLng(23.876466160455525, 90.39068318545102),
      LatLng(23.876469226288346, 90.39066373943578),
      LatLng(23.876471678954566, 90.39064362286828),
      LatLng(23.87648394228491, 90.39061478912154),
      LatLng(23.876532995594676, 90.39060741304678),
      LatLng(23.87656058807324, 90.3906127774648),
      LatLng(23.876599830699234, 90.39061613022604),
    ];
    setState(() {
      isOnPolygon = PolygonUtil.containsLocation(point, polygon, true);
    });
    log(isOnPolygon.toString());
  }

  // @override
  // void initState() {
  //   distance =
  //       SphericalUtil.computeDistanceBetween(cityLondon, cityParis) / 1000.0;
  //   // isOnPolygon = PolygonUtil.containsLocation(point, polygon, true);
  //   // log(isOnPolygon.toString());
  //   // print('Distance between London and Paris is $distance km.');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
              child: Text(
                'Your Current Latitude is: $currentLat \nYour Current Longitude is: $currentLong',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.purple,
                ),
              ),
            ),
            isOnPolygon == true
                ? Text(
                    'You are inside in your workplace',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    'You are outside of your workplace',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getCurrentLocation().then((value) {
            isInBoundary();
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.location_on),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
