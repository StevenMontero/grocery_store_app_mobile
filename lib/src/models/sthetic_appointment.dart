import 'package:lamanda_petshopcr/src/models/pet.dart';
import 'package:lamanda_petshopcr/src/models/pet_list.dart';
import 'package:lamanda_petshopcr/src/models/userProfile.dart';

class StheticAppointment{

  String appointmentId;
  String date;
  UserProfile client; 
  List<Pet> petList;
  bool isConfirmed;

    StheticAppointment({
    this.appointmentId,
    this.date,
    this.client,
    this.petList,
    this.isConfirmed
  });

  StheticAppointment.fromJson(Map<String, dynamic> json){
    
      PetList getPetList = new PetList.fromJsonList(json['petList']);
      this.date = json['entrytDate'];
      this.petList = getPetList.getPetList();
      this.isConfirmed = json['isConfirmed'];
  }
  
  Map<String, dynamic> toJson(){
    return {
      'id': this.appointmentId,
      'entrytDate': this.date,
      'user': this.client,
      'petList': this.petList,
      'isConfirmed': this.isConfirmed,
    };
  }

}