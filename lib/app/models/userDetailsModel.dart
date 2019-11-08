class User {
  String name;
  String email;
  String uid;
  String avatar;

  User({this.name, this.email, this.uid, this.avatar});

  User.fromMap(Map dataMap) {
    print(dataMap);
    uid = dataMap['uid'];
    // id = dataMap['id'];
    name = dataMap['name'];
    email = dataMap['email'];
    avatar = dataMap['avatar'];
    // privilege = dataMap['privilege'];
  }

  Map<String, dynamic> toMap() {
    var userMap = Map<String, dynamic>();

    userMap['uid'] = uid;
    userMap['name'] = name;
    userMap['email'] = email;
    userMap['avatar'] = avatar;

    return userMap;
  }
}
