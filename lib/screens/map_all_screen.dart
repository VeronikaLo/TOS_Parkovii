import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  State<FifthScreen> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthScreen> {
  Set<Marker> markers = {};
  final Completer<GoogleMapController> _controller = Completer();
  double zoomValue = 17.0;
  final _mainTarget =
      const LatLng(54.10128, 37.57868); //add main target of screen

  @override
  void initState() {
    super.initState();
    _addMarkerMainTarget();
  }

  // create widget-button-minus
  Widget _zoomMinusButton() {
    return FloatingActionButton(
        heroTag: "btn1",
        mini: true,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: const Color.fromRGBO(241, 136, 37, 1),
        child: const Text("-", style: TextStyle(fontSize: 25)),
        onPressed: () {
          zoomValue--;
          _minus(zoomValue);
        });
  }

  //create widget-button-plus
  Widget _zoomPlusButton() {
    return FloatingActionButton(
        heroTag: "btn2",
        mini: true,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: const Color.fromRGBO(241, 136, 37, 1),
        child: const Text(
          "+",
          style: TextStyle(fontSize: 25),
        ),
        onPressed: () {
          zoomValue++;
          _plus(zoomValue);
        });
  }

  //function for animating camera '-'
  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _mainTarget, zoom: zoomVal)));
  }

  //function for animating camera '+'
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _mainTarget, zoom: zoomVal)));
  }

  //function for adding marker in the main target
  void _addMarkerMainTarget() {
    markers.add(Marker(
      markerId: const MarkerId('main target'),
      position: _mainTarget,
      infoWindow: const InfoWindow(
          title: 'Я название объекта',
          snippet: 'А я краткое описание, если нужно'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromRGBO(35, 33, 34, 1),
            splashRadius: 50,
            splashColor: Colors.grey,
            onPressed: () {
              Navigator.of(context).pushNamed('/Home');
            },
            tooltip: "Назад"),
        title: const Text("Карта ТОС",
            style: TextStyle(
                fontSize: 20, fontFamily: 'Lato', color: Colors.black)),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(166, 197, 0, 1),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _mainTarget,
              zoom: 17,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            zoomGesturesEnabled: false,
            markers: markers,
          ),

          //implementation of the buttons column
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _zoomPlusButton(),
                  const SizedBox(
                    height: 1,
                  ),
                  _zoomMinusButton()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
