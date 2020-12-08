import 'package:lamanda_petshopcr/src/models/userProfile.dart';

class VeterinaryAppointment{

  String appointmentId;
  String date;
  UserProfile client; 
  String symptoms;
  bool isConfirmed;

    VeterinaryAppointment({
    this.appointmentId,
    this.date,
    this.client,
    this.symptoms,
    this.isConfirmed
  });

  VeterinaryAppointment.fromJson(Map<String, dynamic> json){
      this.date = json['entryDate'];
      this.symptoms = json['symptoms'];
      this.isConfirmed = json['isConfirmed'];
  }
  
  Map<String, dynamic> toJson(){
    return {
      'id': this.appointmentId,
      'entryDate': this.date,
      'entryUser': this.client,
      'symptoms': this.symptoms,
      'isConfirmed': this.isConfirmed,
    };
  }

}