import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:programming_test/data/models/user.dart';

class MapProvider extends ChangeNotifier {
  final List<User> userList;

  MapProvider({required this.userList});

  late Set<Marker> singleMarker = {};
  final Set<Marker> allMarkers = {};

  void onAllMapCreated(GoogleMapController controller) {
    for (int i = 0; i < userList.length; i++) {
      allMarkers.add(Marker(
        markerId: MarkerId(userList[i].id),
        position: LatLng(
            userList[i].location.latitude, userList[i].location.longitude),
        infoWindow: InfoWindow(
            title: userList[i].name.first + " " + userList[i].name.last),
      ));
    }
    notifyListeners();
  }

  String? id, firstName, lastName, image, email;
  double? latitude, longitude;

  void setUserDetails(
      {required String id,
      required String firstName,
      required String lastName,
      required double latitude,
      required double longitude,
      required String email,
      required String image}) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.latitude = latitude;
    this.longitude = longitude;
    this.email = email;
    this.image = image;
  }

  void onSingleMapCreated(GoogleMapController controller) {
    singleMarker.add(
      Marker(
        markerId: MarkerId(id!),
        position: LatLng(latitude!, longitude!),
        infoWindow: InfoWindow(title: firstName! + " " + lastName!),
      ),
    );
    notifyListeners();
  }

  void removeUserData() {
    singleMarker = {};
    notifyListeners();
  }
}
