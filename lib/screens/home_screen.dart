import 'dart:async';

import 'package:flutter/material.dart';

// Bottom Navigation Bar
import 'package:tourist_app/widgets/bottom_navigation.dart';
import 'package:tourist_app/widgets/routes_bnavigation.dart';
import 'package:tourist_app/widgets/sidebar_menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  BottomNavigation? myBNB;

  //Variables de rur
  //Configuraciones de Goole maps
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-0.8317967690150844, -78.66444726369843),
    zoom: 14.4746,
  );

  //Add marker
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng _center = LatLng(-0.8317967690150844, -78.66444726369843);
  @override
  void initState() {
    myBNB = BottomNavigation(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    return Scaffold(
      drawer: const SidebarMenu(),
      appBar: AppBar(
        title: const Text('Bienvenido'),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      bottomNavigationBar: myBNB,
      body: Stack(
        children: [
          Routes(index: index),
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
            markers: markers.values.toSet(),
            polylines: {
              const Polyline(
                  polylineId: PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 8,
                  points: [
                    LatLng(-0.9200016394712536, -78.63586623820193),
                    LatLng(-0.9203424781754148, -78.63542796051742),
                    LatLng(-0.9205650666993245, -78.63557405307891),
                    LatLng(-0.9211215379483182, -78.63464184340074),
                    LatLng(-0.9219701564357062, -78.63305569559013),
                    LatLng(-0.9220536270956612, -78.63249915249868),
                    LatLng(-0.9243430036091317, -78.63170496194678),
                    LatLng(-0.9241364243946162, -78.63107038612398),
                    LatLng(-0.9238117998904183, -78.62993405267386),
                    LatLng(-0.9233691300579389, -78.6287091735378),
                    LatLng(-0.9230936910271159, -78.62764662797404),
                    LatLng(-0.9230199127116627, -78.62715470873157),
                    LatLng(-0.9249184742355879, -78.62689399139849),
                    LatLng(-0.9271101904959036, -78.62584812513799),
                    LatLng(-0.9270026547540716, -78.62480571925646),
                    LatLng(-0.9284171631303375, -78.62406114355248),
                  ])
            },
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(-0.9258293569308299, -78.60543171999268),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );

    setState(() {
      markers[MarkerId('place_name')] = marker;
    });
  }
}
