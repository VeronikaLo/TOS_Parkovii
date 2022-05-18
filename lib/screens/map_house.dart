import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tos_parkovii/helper.dart';

class FifthPageHouse extends StatefulWidget {
  const FifthPageHouse({Key? key}) : super(key: key);

  @override
  State<FifthPageHouse> createState() => _FifthPageHouseState();
}

class _FifthPageHouseState extends State<FifthPageHouse> {
  Set<Marker> markers = {};
  final Completer<GoogleMapController> _controller = Completer();
  double zoomValue = 14.0;
  late House house;

  //add main target of screen
  @override
  void initState() {
    super.initState();
  }

  // create widget-button-minus
  Widget _zoomMinusButton() {
    return FloatingActionButton(
        heroTag: "btn1",
        mini: true,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: const Color.fromRGBO(247, 222, 28, 0.8),
        child: const Text(
          "-",
          style: TextStyle(fontSize: 25),
        ),
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
        backgroundColor: const Color.fromRGBO(247, 222, 28, 0.8),
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
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(house.latitude, house.longitude),
        zoom: zoomVal)));
  }

  //function for animating camera '+'
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(house.latitude, house.longitude),
        zoom: zoomVal)));
  }

  //function for adding marker in the main target
  void _addMarkerMainTarget() {
    markers.add(Marker(
      markerId: const MarkerId('main target'),
      infoWindow: InfoWindow(title: house.street),
      position:
          LatLng(house.latitude, house.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    house = settings.arguments as House;
    _addMarkerMainTarget();

    return Scaffold(
      appBar: AppBar(
          title: const Text("Местоположение",
              style: TextStyle(
                  fontSize: 24, fontFamily: 'Lato', color: Colors.white)),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(247, 222, 28, 1)),
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: Stack(
              children: [
                GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(house.latitude, house.longitude),
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    zoomGesturesEnabled: false,
                    markers: markers),

                // implement column of the buttons +/-
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
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
                ),
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Адрес:',
                                style: TextStyle(fontFamily: 'Lato')),
                            const SizedBox(height: 15),
                            Text(house.street,
                                style: const TextStyle(
                                    fontSize: 18, fontFamily: 'Lato')),
                            Text(house.number,
                                style: const TextStyle(
                                    fontSize: 18, fontFamily: 'Lato')),
                          ],
                        )),
                    const VerticalDivider(
                      color: Colors.black,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Компания:',
                              style: TextStyle(fontFamily: 'Lato')),
                          const SizedBox(height: 15),
                          Text(house.company,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
