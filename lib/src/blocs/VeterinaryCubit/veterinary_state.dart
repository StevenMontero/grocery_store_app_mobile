part of 'veterinary_cubit.dart';

class VeterinaryFormState extends Equatable {
  const VeterinaryFormState({
    this.transporte = false,
    this.direccion = '',
    this.hourRerservation,
    this.race = 'Labrador',
    this.description = '',
    this.schedule,
    this.status,
    this.age,
  });
  final DateTime hourRerservation;
  final List<DateTime> schedule;
  final String race;
  final String description;
  final FormzStatus status;
  final bool transporte;
  final String direccion;
  final int age;

  VeterinaryFormState copyWith(
      {DateTime hourRerservation,
      String race,
      String description,
      List<DateTime> schedule,
      bool transporte,
      String direccion,
      FormzStatus status,
      int age}) {
    return VeterinaryFormState(
        hourRerservation: hourRerservation ?? this.hourRerservation,
        race: race ?? this.race,
        description: description ?? this.description,
        schedule: schedule ?? this.schedule,
        direccion: direccion ?? this.direccion,
        transporte: transporte ?? this.transporte,
        age: age ?? this.age,
        status: status ?? this.status);
  }

  @override
  List<Object> get props =>
      [hourRerservation, race, description, description, schedule, status];
}
