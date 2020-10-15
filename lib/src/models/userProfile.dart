
import 'pet.dart';

class UserProfile {

  String id;
  String userName;
  String email;
  String password;
  String photoUri;
  String lastName;
  String address;
  List<Pet> petList;
  String phone; 

  UserProfile({
    this.userName,
    this.email,
    this.password,
    this.phone
  });

  UserProfile.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.userName = json['userName'];
    this.email = json['email'];
    this.password = json['password'];
    this.photoUri = json['photoUri'];
    this.lastName = json['lastName'];
    this.address = json['address'];
    //this.petList = json['id'];
    this.phone = json['phone'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id': this.id,
      'userName': this.userName,
      'email': this.email,
      'password': this.password,
      'photoUri': this.photoUri,
      'lastName': this.lastName,
      'address': this.address,
      //'petList' : this.petList,
      'phone': this.photoUri
    };
  }

}