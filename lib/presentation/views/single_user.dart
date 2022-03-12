import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:programming_test/logic/controllers/map_provider.dart';
import 'package:provider/provider.dart';

class SingleUser extends StatelessWidget {
  static const String id = '/single_user';

  const SingleUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MapProvider>(builder: (context, data, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              data.removeUserData();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: GoogleMap(
                onMapCreated: data.onSingleMapCreated,
                markers: data.singleMarker,
                initialCameraPosition: CameraPosition(
                    target: LatLng(data.latitude!, data.longitude!), zoom: 10),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: CachedNetworkImage(
                      imageUrl: data.image!,
                      imageBuilder: (context, image) => CircleAvatar(
                        backgroundImage: image,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                letterSpacing: 0.5, color: Colors.black),
                            children: <TextSpan>[
                              const TextSpan(
                                  text: "Name: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: data.firstName! + " " + data.lastName!)
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                letterSpacing: 0.5, color: Colors.black),
                            children: <TextSpan>[
                              const TextSpan(
                                  text: "Email: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: data.email!)
                            ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
