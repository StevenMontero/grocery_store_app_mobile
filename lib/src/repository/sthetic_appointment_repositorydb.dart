import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lamanda_petshopcr/src/models/sthetic_appointment.dart';

class StheticAppointmentRepository{
  final CollectionReference _ref = FirebaseFirestore.instance.collection('stheticAppointment');

  Future<void> addNewAppointment(StheticAppointment appointment){
    return _ref.add(appointment.toJson())
    .then((value) => print('Appointment Added'))
    .catchError((error) => print('Failed to add Appointment: $error'));
  }

  Future<StheticAppointment> getUserAppointment(String appointmentId) async{
    StheticAppointment appointment;
    DocumentSnapshot snapshot;
    snapshot = await _ref.doc(appointmentId).get();
    if(snapshot.exists){
      return appointment = StheticAppointment.fromJson(snapshot.data());
    }else{
      return null;
    }
  }

  Future<List<StheticAppointment>> getListAppointmets(String userID) async {
    List<StheticAppointment> stheticAppointmentList = new List();
    QuerySnapshot snapshot = await _ref.get();
    final result = snapshot.docs.where((DocumentSnapshot document) => 
          document.data()['user']['id'].contains(userID));
    result.forEach((element) {
      stheticAppointmentList.add(StheticAppointment.fromJson(element.data()));
    });
  
    return stheticAppointmentList;
  }

  //Future<void> updateUser(DayCareAppointment user, ){
  //  return _ref.doc(user.id)
  //  .update(user.toJson())
  //  .then((value) => print('Success Update'))
  //  .catchError((error) => print('Failure Update'));
  //}
}