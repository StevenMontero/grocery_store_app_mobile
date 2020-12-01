import 'package:lamanda_petshopcr/src/models/pet.dart';
import 'package:lamanda_petshopcr/src/models/pet_list.dart';
import 'package:lamanda_petshopcr/src/models/userProfile.dart';

class HotelAppointment{

  String appointmentId;
  String startDate;
  String endDate;
  UserProfile client; 
  String personPicksUp;
  List<Pet> petList;
  bool transfer;
  bool isConfirmed;

    HotelAppointment({
    this.appointmentId,
    this.startDate,
    this.endDate,
    this.client,
    this.personPicksUp,
    this.petList,
    this.transfer,
    this.isConfirmed
  });

  HotelAppointment.fromJson(Map<String, dynamic> json){
    
      PetList getPetList = new PetList.fromJsonList(json['petList']);
      this.startDate = json['entrytDate'];
      this.endDate = json['departureDate'];
      this.personPicksUp = json['departureUser'];
      this.petList = getPetList.getPetList();
      this.transfer = json['transfer'];
      this.isConfirmed = json['isConfirmed'];
  }
  
  Map<String, dynamic> toJson(){
    return {
      'id': this.appointmentId,
      'entrytDate': this.startDate,
      'departureDate': this.endDate,
      'entryUser': this.client,
      'departureUser': this.personPicksUp,
      'petList': this.petList,
      'transfer': this.transfer,
      'isConfirmed': this.isConfirmed,
    };
  }

}