class RegistrationModel {
  String? name;
  String? uid;
  String? idNational;
  String? whatsAppNumber;
  String? placeOfElectin;
  RegistrationModel(
      {this.name,
      this.uid,
      this.idNational,
      this.whatsAppNumber,
      this.placeOfElectin});
  RegistrationModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    idNational = json['idNational'];
    whatsAppNumber = json['whatsAppNumber'];
    placeOfElectin = json['placeOfElectin'];
    uid = json['uid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'idNational': idNational,
      'whatsAppNumber': whatsAppNumber,
      'placeOfElectin': placeOfElectin,
    };
  }
}
