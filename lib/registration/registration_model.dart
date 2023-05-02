import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationModel {
  String name;
  String uid;
  String idNational;
  String whatsAppNumber;
  String placeOfElectin;
  DateTime dateTime;
  RegistrationModel({
    required this.name,
    required this.uid,
    required this.idNational,
    required this.whatsAppNumber,
    required this.placeOfElectin,
    required this.dateTime,
  });
  factory RegistrationModel.formJson(Map<String, dynamic> json) =>
      RegistrationModel(
        name: json['name'],
        uid: json['uid'],
        idNational: json['idNational'],
        whatsAppNumber: json['whatsAppNumber'],
        placeOfElectin: json['placeOfElectin'],
        dateTime: json['dateTime'] == null
            ? DateTime.now()
            : json['dateTime'].toDate(),
      );
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'idNational': idNational,
      'whatsAppNumber': whatsAppNumber,
      'placeOfElectin': placeOfElectin,
      'dateTime': FieldValue.serverTimestamp(),
    };
  }
}
