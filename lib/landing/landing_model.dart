class UserModel {
  String? name;
  String? email;
  String? phone;
  String? idNational;
  String? whatsAppNumber;
  String? placeOfElectin;
  UserModel(
      {this.name,
      this.email,
      this.phone,
      this.idNational,
      this.whatsAppNumber,
      this.placeOfElectin});
  UserModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    idNational = json['idNational'];
    whatsAppNumber = json['whatsAppNumber'];
    placeOfElectin = json['placeOfElectin'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'idNational': idNational,
      'whatsAppNumber': whatsAppNumber,
      'placeOfElectin': placeOfElectin,
    };
  }
}
