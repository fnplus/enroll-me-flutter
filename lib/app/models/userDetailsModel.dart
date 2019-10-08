class UserDetailsModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String emailID;
  final String gender;
  final num phoneNumber;
  final String birthDate;
  final String city;
  final String state;
  final String address;
  final String githubURL;
  final String linkedinURL;

  UserDetailsModel(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.emailID,
      this.gender,
      this.phoneNumber,
      this.birthDate,
      this.city,
      this.state,
      this.address,
      this.githubURL,
      this.linkedinURL});

  factory UserDetailsModel.fromJSON(Map<String, dynamic> json) {
    return UserDetailsModel(
      firstName: json['fname'],
      middleName: json['mname'] ?? '',
      lastName: json['lname'],
      emailID: json['email'],
      gender: json['gender'],
      phoneNumber: json['phone'],
      birthDate: json['birthday'],
      city: json['city'],
      state: json['state'],
      address: json['address'],
      githubURL: json['github'],
      linkedinURL: json['linkedin'],
    );
  }
}
