part of 'grooming_cubit.dart';

class GroomingFormState extends Equatable {
  const GroomingFormState(
      {this.transporte = false,
      this.direccion = '',
      this.hourRerservation,
      this.typeFur = 'Liso',
      this.description = '',
      this.schedule,
      this.status});
  final DateTime hourRerservation;
  final List<DateTime> schedule;
  final String typeFur;
  final String description;
  final FormzStatus status;
  final bool transporte;
  final String direccion;

  GroomingFormState copyWith({
    DateTime hourRerservation,
    String typeFur,
    String description,
    List<DateTime> schedule,
    bool transporte,
    String direccion,
    FormzStatus status,
  }) {
    return GroomingFormState(
        hourRerservation: hourRerservation ?? this.hourRerservation,
        typeFur: typeFur ?? this.typeFur,
        description: description ?? this.description,
        schedule: schedule ?? this.schedule,
        direccion: direccion ?? this.direccion,
        transporte: transporte ?? this.transporte,
        status: status ?? this.status);
  }

  @override
  List<Object> get props =>
      [hourRerservation, typeFur, description, description, schedule, status];
}
