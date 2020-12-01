import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lamanda_petshopcr/src/models/pet.dart';

class PetRepository {

  final CollectionReference _ref = FirebaseFirestore.instance.collection('pet');

  Future<void> addNewPet(Pet pet){
    return _ref.add(pet.toJson())
    .then((value) => print('Pet Added'))
    .catchError((error) => print('Failed to add pet: $error'));
  }

  Future<Pet> getpet(String idPet) async{
    Pet pet;
    DocumentSnapshot snapshot;
    snapshot = await _ref.doc(idPet).get();
    if(snapshot.exists){
      return pet = Pet.fromJson(snapshot.data());
    }else{
      return null;
    }
  }

  Future<void> updatePet(Pet pet){
    return _ref.doc(pet.petId)
    .update(pet.toJson())
    .then((value) => print('Success Update'))
    .catchError((error) => print('Failure Update'));
  }
}