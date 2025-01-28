class UserModel {
  final String? firstNamae;
  final String? lastName;
  final String? uid;
  final String? img;

  UserModel({
    this.firstNamae,
    this.lastName,
    this.uid,
    this.img,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstNamae: json["firstname"],
        lastName: json["lastname"],
        uid: json["uid"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstNamae,
          "lastname": lastName,
        "uid": uid,
        "img": img,
      };
}