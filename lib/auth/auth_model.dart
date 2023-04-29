class LoginModel {
  String email;
  String uid;

  LoginModel({
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,

    };
  }
}
