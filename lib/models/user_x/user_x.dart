import '../../tools/printer.dart';

class UserX {
  String? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? img;
  String? bio;
  List<String>? favorites = [];
  bool? isVerified = false;
  bool isBlocked = false;
  DateTime? registerDate;
  DateTime? birthDate;

  UserX({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.img,
    this.bio,
    this.isVerified,
    this.registerDate,
    this.birthDate,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'img': img,
    'bio': bio,
    'registerDate': registerDate,
    'phoneNumber': phoneNumber,
    'isVerified': isVerified,
    'isBlocked': isBlocked,
    'birthDate': birthDate,
    'favorites': favorites,
  };

  UserX.fromJson(map) {
    try {
      name = map['name'];
      email = map['email'];
      img = map['img'];
      bio = map['bio'];
      phoneNumber = map['phoneNumber'];
      isBlocked = map['isBlocked'] ?? false;
      registerDate = map['registerDate']?.toDate();
      birthDate = map['birthDate']?.toDate();
      favorites = map['favorites']?.cast<String>() ?? [];
    } catch (e, s) {
      Print.err(e,s);
    }
  }

  setId(String id) {
    this.id = id;
  }

  @override
  String toString() {
    return 'UserX{\nid: $id,\nname: $name,\nemail: $email,\ndate: $registerDate\n}';
  }
}
