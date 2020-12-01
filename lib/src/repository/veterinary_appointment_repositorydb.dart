import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lamanda_petshopcr/src/models/veterinary_appointment.dart';

class VeterinaryAppointmentRepository{
  final CollectionReference _ref = FirebaseFirestore.instance.collection('veterinaryAppointment');

  Future<void> addNewAppointment(VeterinaryAppointment appointment){
    return _ref.add(appointment.toJson())
    .then((value) => print('Appointment Added'))
    .catchError((error) => print('Failed to add Appointment: $error'));
  }

  Future<VeterinaryAppointment> getUserAppointment(String appointmentId) async{
    VeterinaryAppointment appointment;
    DocumentSnapshot snapshot;
    snapshot = await _ref.doc(appointmentId).get();
    if(snapshot.exists){
      return appointment = VeterinaryAppointment.fromJson(snapshot.data());
    }else{
      return null;
    }
  }

  Future<List<VeterinaryAppointment>> getListAppointmets(String userID) async {
    List<VeterinaryAppointment> veterinaryAppointmentList = new List();
    QuerySnapshot snapshot = await _ref.get();
    final result = snapshot.docs.where((DocumentSnapshot document) => 
          document.data()['user']['id'].contains(userID));
    result.forEach((element) {
      veterinaryAppointmentList.add(VeterinaryAppointment.fromJson(element.data()));
    });
  
    return veterinaryAppointmentList;
  }

  //Future<void> updateUser(DayCareAppointment user, ){
  //  return _ref.doc(user.id)
  //  .update(user.toJson())
  //  .then((value) => print('Success Update'))
  //  .catchError((error) => print('Failure Update'));
  //}
}