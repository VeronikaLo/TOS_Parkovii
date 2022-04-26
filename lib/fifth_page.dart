// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "Map Page",
//         theme: ThemeData(
//           primarySwatch: Colors.lightGreen,
//         ),
//         home: const MapPage());
//   }
// }

// class MapPage extends StatefulWidget {
//   const MapPage({Key? key}) : super(key: key);

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   Set<Marker> markers = {};
//   Completer<GoogleMapController> _controller = Completer();
//   double zoomValue = 17.0;
//   final _mainTarget = LatLng(54.10128, 37.57868); //add main target of screen

//   @override
//   void initState() {
//     super.initState();
//     _addMarkerMainTarget();
//   }

//   Widget _zoomMinusButton() {
//     // widget - button - minus
//     return FloatingActionButton(
//         materialTapTargetSize: MaterialTapTargetSize.padded,
//         backgroundColor: Colors.lightGreen,
//         child: const Text("-"),
//         onPressed: () {
//           zoomValue--;
//           _minus(zoomValue);
//         });
//   }

//   Widget _zoomPlusButton() {
//     //widget - button - plus
//     return FloatingActionButton(
//         materialTapTargetSize: MaterialTapTargetSize.padded,
//         backgroundColor: Colors.lightGreen,
//         child: const Text("+"),
//         onPressed: () {
//           zoomValue++;
//           _plus(zoomValue);
//         });
//   }

//   Future<void> _minus(double zoomVal) async {
//     //function of animate camera '-'
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(target: _mainTarget, zoom: zoomVal)));
//   }

//   Future<void> _plus(double zoomVal) async {
//     //function of animate camera '+'
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(target: _mainTarget, zoom: zoomVal)));
//   }

//   void _addMarkerMainTarget() {
//     markers.add(Marker(
//       markerId: MarkerId('main target'),
//       position: _mainTarget,
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ));

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Местоположение",
//             style: TextStyle(fontSize: 20, fontFamily: 'Lato')),
//         centerTitle: false,
//       ),
//       body: Stack(
//         alignment: AlignmentDirectional.bottomCenter,
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: _mainTarget,
//               zoom: 17,
//             ),
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//             },
//             zoomControlsEnabled: false,
//             myLocationButtonEnabled: false,
//             zoomGesturesEnabled: false,
//             markers: markers,
//           ),
//           Container(
//             height: 140,
//             width: double.infinity,
//             color: const Color.fromRGBO(255, 255, 255, 0.9),
//             child: const Text(
//               'Некие подробности',
//               style: TextStyle(fontSize: 25, fontFamily: 'Lato'),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Column(
//                 children: <Widget>[
//                   _zoomPlusButton(),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   _zoomMinusButton()
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
