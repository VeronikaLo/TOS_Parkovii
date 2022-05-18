import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  State<FifthScreen> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthScreen> {
  Set<Marker> markersHouse = {};
  Set<Marker> markersArea = {};
  Set<Marker> markersEvent = {};
  Set<Marker> markersInstitute = {};
  Set<Marker> markers = {}; //Set of all Sets<Markers>
  final Completer<GoogleMapController> _controller = Completer();

  double zoomValue = 14.0;
  final _mainTarget =
      const LatLng(54.183307, 37.592364); //add main target of screen
  final _isSelectedHouse = <bool>[false];
  final _isSelectedEvent = <bool>[false];
  final _isSelectedInstitute = <bool>[false];
  final _isSelectedArea = <bool>[false];

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
    LatLng pointerLocation = await _getCenter();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: pointerLocation, zoom: zoomVal)));
  }

  //function for animating camera '+'
  Future<void> _plus(double zoomVal) async {
    LatLng pointerLocation = await _getCenter();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: pointerLocation, zoom: zoomVal)));
  }

//function get center for buttons +/-
  Future<LatLng> _getCenter() async {
    final GoogleMapController controller = await _controller.future;
    LatLngBounds visibleRegion = await controller.getVisibleRegion();
    LatLng centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );
    return centerLatLng;
  }

  //decode json and insert in the Set of Markers (Area)
  Future loadMarkersArea() async {
    var jsonData =
        await rootBundle.loadString('assets/test_json_for_map/areas.json');
    var data = json.decode(jsonData);

    BitmapDescriptor markerArea = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/pin_area.png",
    );

    data["area"].forEach((item) {
      markersArea.add(Marker(
          markerId: MarkerId(item["ID"]),
          position: LatLng(
              double.parse(item["latitude"]), double.parse(item["longitude"])),
          infoWindow: InfoWindow(
            title: item["description"],
          ),
          icon: markerArea));
    });
    setState(() {});
  }

//decode json and insert in the Set of Markers (House)
  Future loadMarkersHouse() async {
    var jsonData =
        await rootBundle.loadString('assets/test_json_for_map/houses.json');
    var data = json.decode(jsonData);

    BitmapDescriptor markerHouse = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/pin_house.png",
    );

    data["coords"].forEach((item) {
      markersHouse.add(Marker(
          markerId: MarkerId(item["ID"]),
          position: LatLng(
              double.parse(item["latitude"]), double.parse(item["longitude"])),
          infoWindow: InfoWindow(
            title: item["description"],
          ),
          icon: markerHouse));
    });
    setState(() {});
  }

//decode json and insert in the Set of Markers (Institute)
  Future loadMarkersInstitute() async {
    var jsonData =
        await rootBundle.loadString('assets/test_json_for_map/institutes.json');
    var data = json.decode(jsonData);

    BitmapDescriptor markerInstitute = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/pin_institute.png",
    );

    data["coords"].forEach((item) {
      markersInstitute.add(Marker(
          markerId: MarkerId(item["ID"]),
          position: LatLng(
              double.parse(item["latitude"]), double.parse(item["longitude"])),
          infoWindow: InfoWindow(
            title: item["description"],
          ),
          icon: markerInstitute));
    });
    setState(() {});
  }

//decode json and insert in the Set of Markers (Event)
  Future loadMarkersEvent() async {
    var jsonData =
        await rootBundle.loadString('assets/test_json_for_map/events.json');
    var data = json.decode(jsonData);

    BitmapDescriptor markerEvent = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/pin_event.png",
    );

    data["coords"].forEach((item) {
      markersEvent.add(Marker(
          markerId: MarkerId(item["ID"]),
          position: LatLng(
              double.parse(item["latitude"]), double.parse(item["longitude"])),
          infoWindow: InfoWindow(
            title: item["description"],
          ),
          icon: markerEvent));
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              color: const Color.fromRGBO(35, 33, 34, 1),
              splashRadius: 50,
              splashColor: Colors.grey,
              onPressed: () {
                Navigator.of(context).pushNamed('/Home');
              },
              tooltip: "Назад"),
          title: const Text("Карта ТОС",
              style: TextStyle(
                  fontSize: 24, fontFamily: 'Lato', color: Colors.white)),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(247, 222, 28, 1)),
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: Stack(
              children: [
                GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _mainTarget,
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    zoomGesturesEnabled: false,
                    //union sets of different markers in one (markers)
                    markers: markers
                        .union(markersArea)
                        .union(markersEvent)
                        .union(markersHouse)
                        .union(markersInstitute)),

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
          // implement bottom buttons
          Flexible(
            flex: 1,
            child: Column(
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      isSelected: _isSelectedHouse,
                      selectedColor: const Color.fromRGBO(255, 255, 255, 1),
                      borderWidth: 2,
                      color: const Color.fromARGB(255, 23, 134, 34),
                      fillColor: const Color.fromARGB(255, 23, 134, 34),
                      borderRadius: BorderRadius.circular(4.0),
                      borderColor: const Color.fromARGB(255, 23, 134, 34),
                      constraints: const BoxConstraints(
                          maxHeight: 53.0, minWidth: 170.0),
                      onPressed: (index) {
                        setState(() {
                          (_isSelectedHouse[index] = !_isSelectedHouse[index])
                              ? loadMarkersHouse()
                              : (markersHouse.clear());
                        });
                      },
                      children: const [
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Дома',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Lato'))),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ToggleButtons(
                      isSelected: _isSelectedEvent,
                      selectedColor: const Color.fromRGBO(255, 255, 255, 1),
                      borderWidth: 2,
                      color: const Color.fromRGBO(241, 136, 37, 1),
                      fillColor: const Color.fromRGBO(241, 136, 37, 1),
                      borderRadius: BorderRadius.circular(4.0),
                      borderColor: const Color.fromRGBO(241, 136, 37, 1),
                      constraints: const BoxConstraints(
                          maxHeight: 53.0, minWidth: 170.0),
                      onPressed: (index) {
                        setState(() {
                          (_isSelectedEvent[index] = !_isSelectedEvent[index])
                              ? loadMarkersEvent()
                              : (markersEvent.clear());
                        });
                      },
                      children: const [
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Мероприятия',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Lato'))),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      isSelected: _isSelectedArea,
                      selectedColor: const Color.fromRGBO(255, 255, 255, 1),
                      borderWidth: 2,
                      color: const Color.fromRGBO(0, 58, 90, 1),
                      fillColor: const Color.fromRGBO(0, 58, 90, 1),
                      borderRadius: BorderRadius.circular(4.0),
                      borderColor: const Color.fromRGBO(0, 58, 90, 1),
                      constraints: const BoxConstraints(
                          maxHeight: 53.0, minWidth: 170.0),
                      onPressed: (index) {
                        setState(() {
                          (_isSelectedArea[index] = !_isSelectedArea[index])
                              ? loadMarkersArea()
                              : (markersArea.clear());
                        });
                      },
                      children: const [
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Пространства',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Lato'))),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ToggleButtons(
                      isSelected: _isSelectedInstitute,
                      selectedColor: const Color.fromRGBO(255, 255, 255, 1),
                      borderWidth: 2,
                      color: const Color.fromRGBO(214, 0, 0, 1),
                      fillColor: const Color.fromRGBO(214, 0, 0, 1),
                      borderRadius: BorderRadius.circular(4.0),
                      borderColor: const Color.fromRGBO(214, 0, 0, 1),
                      constraints: const BoxConstraints(
                          maxHeight: 53.0, minWidth: 170.0),
                      onPressed: (index) {
                        setState(() {
                          (_isSelectedInstitute[index] =
                                  !_isSelectedInstitute[index])
                              ? loadMarkersInstitute()
                              : (markersInstitute.clear());
                        });
                      },
                      children: const [
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Организации',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Lato'))),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
