// import 'package:restapiproject/model/username_model.dart';

class User {
  final String username;
  final String email;
  final String phone;
  final String name;

  User({
    required this.username,
    required this.email,
    required this.phone,
    required this.name,
  });

  // String get fullname {
  //   return '${name.title} ' '${name.firstname} ' '${name.lastname}';
  // }
}
