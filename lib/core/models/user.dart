class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userRole;
  final int preferredDriveDistance;
  List favoriteCrops = List();

  User({
    this.id,
    this.email,
    this.firstName = "",
    this.lastName = "",
    this.userRole = "",
    this.preferredDriveDistance = 0,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'],
        userRole = data['userRole'],
        preferredDriveDistance = data['prefferedDriveDistance'],
        favoriteCrops = data['favoriteCrops'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userRole': userRole,
      'preferredDriveDistance': preferredDriveDistance,
      'favoriteCrops': favoriteCrops,
    };
  }
}
