class Users {
  List<User>? users;
  int? total;
  int? skip;
  int? limit;

  Users.fromJson(Map<String, dynamic> json) {
    users = (json['users'] as List).map((e) => User.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  int? age;
  String? gender;
  String? email;
  String? username;
  String? password;
  String? image;
  Address? address;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    image = json['image'];
    address = Address.fromJson(json['address']);
  }
}

class Address {
  String? address;
  String? city;
  Coordinate? coordinates;
  String? postalCode;
  String? state;

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    coordinates = Coordinate.fromJson(json['coordinates']);
    postalCode = json['postalCode'];
    state = json['state'];
  }
}

class Coordinate {
  double? lat;
  double? lng;

  Coordinate.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}
