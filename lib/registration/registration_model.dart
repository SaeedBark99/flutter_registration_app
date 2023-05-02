import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationModel {
  String? name;
  String? uid;
  String? idNational;
  String? whatsAppNumber;
  String? placeOfElectin;
  String? dateTime;
  RegistrationModel({
    this.name,
    this.uid,
    this.idNational,
    this.whatsAppNumber,
    this.placeOfElectin,
    this.dateTime,
  });
  RegistrationModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    idNational = json['idNational'];
    whatsAppNumber = json['whatsAppNumber'];
    placeOfElectin = json['placeOfElectin'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'idNational': idNational,
      'whatsAppNumber': whatsAppNumber,
      'placeOfElectin': placeOfElectin,
      'dateTime': dateTime,
    };
  }
}
