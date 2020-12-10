import 'package:lamanda_petshopcr/src/models/pet.dart';
import 'package:lamanda_petshopcr/src/models/pet_list.dart';

class UserProfile {

  String id;
  String userName;
  String email;
  String photoUri;
  String lastName;
  String address;
  List<Pet> petList;
  String phone; 

  UserProfile({
    this.id,
    this.userName,
    this.email,
    this.photoUri,
    this.lastName,
    this.address,
    this.petList,
    this.phone
  });

  UserProfile.fromJson(Map<String, dynamic> json){
    
      PetList getPetList = new PetList.fromJsonList(json['petList']);
      this.id = json['id'];
      this.userName = json['userName'];
      this.email = json['email'];
      this.photoUri = json['photoUri'];
      this.lastName = json['lastName'];
      this.address = json['address'];
      this.petList = getPetList.getPetList(); 
      this.phone = json['phone'];
  }
  
  Map<String, dynamic> toJson(){
    return {
      'id': this.id,
      'userName': this.userName,
      'email': this.email,
      'photoUri': this.photoUri,
      'lastName': this.lastName,
      'address': this.address,
      'petList': this.petList,
      'phone': this.phone
    };
  }

}