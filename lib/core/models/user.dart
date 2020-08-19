class User {
  final String id;
  final String full_name;
  final String email;
  final String userRole;
  final int preferredDriveDistance;

  User({
    this.id,
    this.full_name,
    this.email,
    this.userRole,
    this.preferredDriveDistance = 0,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        full_name = data['fullName'],
        email = data['email'],
        userRole = data['userRole'],
        preferredDriveDistance = data['prefferedDriveDistance'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': full_name,
      'email': email,
      'userRole': userRole,
      'preferredDriveDistance': preferredDriveDistance,
    };
  }
}
