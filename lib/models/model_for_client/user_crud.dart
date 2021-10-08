class UserCrud {
  String username;
  String firstName;
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