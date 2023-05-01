class LoginModel {
  String? email;
  String? uid;

  LoginModel({
     this.email,
     this.uid,
  });
LoginModel.fromjson(Map<String , dynamic> json){
  email = json['email'];
  uid = json['uid'];
}
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,

    };
  }
}
