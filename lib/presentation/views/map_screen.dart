import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:programming_test/logic/controllers/map_provider.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  static const String id = '/map_screen';

  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Consumer<MapProvider>(
        builder: (context, data, child) {
          return GoogleMap(
            onMapCreated: data.onAllMapCreated,
            markers: data.allMarkers,
            initialCameraPosition: CameraPosition(
                target: LatLng(data.userList[0].location.latitude,
                    data.userList[0].location.longitude),
                zoom: 10),
          );
        },
      ),
    );
  }
}
