import 'package:hive/hive.dart';

part 'user_crud.g.dart';

@HiveType(typeId: 3)
class UserCrud {
  @HiveField(0)
  String username;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;

  UserCrud({
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory UserCrud.fromJson(Map<String, dynamic> json) {
    return UserCrud(
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}
