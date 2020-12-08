part of 'grooming_cubit.dart';

class GroomingFormState extends Equatable {
  const GroomingFormState(
      {this.transfer = false,
      this.address = '',
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
  final bool transfer;
  final String address;

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
        address: direccion ?? this.address,
        transfer: transporte ?? this.transfer,
        status: status ?? this.status);
  }

  @override
  List<Object> get props =>
      [hourRerservation, typeFur, description, description, schedule, status];
}
