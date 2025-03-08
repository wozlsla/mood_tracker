class UserProfileModel {
  final String uid;
  final String userName;
  final String avatar;

  UserProfileModel({
    required this.uid,
    required this.userName,
    required this.avatar,
  });

  UserProfileModel.empty() : uid = "", userName = "", avatar = "";

  UserProfileModel.fromJson(Map<String, dynamic> json)
    : uid = json["uid"],
      userName = json["userName"],
      avatar = json["avatar"];

  Map<String, String> toJson() {
    return {"uid": uid, "userName": userName, "avatar": avatar};
  }
}
