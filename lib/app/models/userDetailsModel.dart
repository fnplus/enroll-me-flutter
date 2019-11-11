class User {
  String name;
  String email;
  String uid;
  String avatar;
  bool isEmailVerified;

  User({this.name, this.email, this.uid, this.avatar, this.isEmailVerified});

  User.fromMap(Map dataMap) {
    print(dataMap);
    uid = dataMap['uid'];
    // id = dataMap['id'];
    name = dataMap['name'];
    email = dataMap['email'];
    avatar = dataMap['avatar'];
    isEmailVerified = dataMap['isEmailVerified'];
    // privilege = dataMap['privilege'];
  }

  Map<String, dynamic> toMap() {
    var userMap = Map<String, dynamic>();

    userMap['uid'] = uid;
    userMap['name'] = name;
    userMap['email'] = email;
    userMap['avatar'] = avatar;
    userMap['isEmailVerified'] = isEmailVerified;

    return userMap;
  }
}
