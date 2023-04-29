class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? numberWhatsApp;
  String? placeOfElectin;
  UserModel(
      {this.name,
        this.email,
        this.phone,
        this.uid,
        this.numberWhatsApp,
        this.placeOfElectin
        });
  UserModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    numberWhatsApp = json['numberWhatsApp'];
    placeOfElectin = json['placeOfElectin'];

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'numberWhatsApp': numberWhatsApp,
      'placeOfElectin': placeOfElectin,
    };
  }
}