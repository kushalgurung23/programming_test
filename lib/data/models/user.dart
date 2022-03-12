import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.location,
  });

  String id;
  Name name;
  String email;
  String picture;
  Location location;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: Name.fromJson(json["name"]),
    email: json["email"],
    picture: json["picture"],
    location: Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name.toJson(),
    "email": email,
    "picture": picture,
    "location": location.toJson(),
  };
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  double latitude;
  double longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Name {
  Name({
    required this.last,
    required this.first,
  });

  String last;
  String first;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    last: json["last"],
    first: json["first"],
  );

  Map<String, dynamic> toJson() => {
    "last": last,
    "first": first,
  };
}
