import 'package:lamanda_petshopcr/src/models/pet.dart';
import 'package:lamanda_petshopcr/src/models/pet_list.dart';
import 'package:lamanda_petshopcr/src/models/userProfile.dart';

class StheticAppointment {
  String appointmentId;
  DateTime entrytDate;
  UserProfile client;
  List<Pet> petList;
  bool isConfirmed;

  StheticAppointment(
      {this.appointmentId,
      this.entrytDate,
      this.client,
      this.petList,
      this.isConfirmed});

  StheticAppointment.fromJson(Map<String, dynamic> json) {
    PetList getPetList = new PetList.fromJsonList(json['petList']);
    this.entrytDate = json['entrytDate'].toDate();
    this.petList = getPetList.getPetList();
    this.isConfirmed = json['isConfirmed'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.appointmentId,
      'entrytDate': this.entrytDate,
      'user': this.client,
      'petList': this.petList,
      'isConfirmed': this.isConfirmed,
    };
  }
}

// class EstheticAppt {
//   EstheticAppt(
//       String id,
//       Timestamp entryDate,
//       DocumentReference entryUser,
//       bool isConfirmed,
//       bool transfer,
//       bool declined,
//       String direction) {
//     this.id = id;
//     this.entryDate = entryDate;
//     this.entryUser = entryUser;
//     this.isConfirmed = isConfirmed;
//     this.transfer = transfer;
//     this.declined = declined;
//     this.direction = direction;
//   }

//   EstheticAppt.fromJson(Map<String, dynamic> json) {
//     this.id = json['id'];
//     this.entryDate = json['entryDate'];
//     this.entryUser = json['entryUser'];
//     this.isConfirmed = json['isConfirmed'];
//     this.transfer = json['transfer'];
//     this.declined = json["declined"];
//     this.direction = json["direction"];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': this.id,
//       'entryDate': this.entryDate,
//       'entryUser': this.entryUser,
//       'isConfirmed': this.isConfirmed,
//       'transfer': this.transfer,
//       'declined': this.declined,
//       'direction': this.direction
//     };
//   }
// }
