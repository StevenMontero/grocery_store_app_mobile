part of 'hotel_cubit.dart';

class HotelState extends Equatable {
  const HotelState({
    this.quotas,
    this.race = 'Labrador',
    this.age = 1,
    this.userDeliver,
    this.userPickup = '',
    this.lastDeworming,
    this.lastProtectionFleas,
    this.transporte = false,
    this.direccion = '',
    this.isVaccinationUpDate = false,
    this.isCastrated = false,
    this.isSociable = false,
    this.entryDate,
    this.departureDate,
  });
  final DateTime entryDate;
  final DateTime departureDate;
  final int quotas;
  final String race;
  final int age;
  final UserProfile userDeliver;
  final String userPickup;
  final DateTime lastDeworming;
  final DateTime lastProtectionFleas;
  final bool transporte;
  final String direccion;
  final bool isVaccinationUpDate;
  final bool isCastrated;
  final bool isSociable;

  HotelState copyWith({
    DateTime entryDate,
    DateTime departureDate,
    int quotas,
    String race,
    int age,
    UserProfile userDeliver,
    String userPickup,
    DateTime lastDeworming,
    DateTime lastProtectionFleas,
    bool transporte,
    String direccion,
    bool isVaccinationUpDate,
    bool isCastrated,
    bool isSociable,
  }) {
    return HotelState(
        entryDate: entryDate ?? this.entryDate,
        departureDate: departureDate ?? this.departureDate,
        quotas: quotas ?? this.quotas,
        race: race ?? this.race,
        age: age ?? this.age,
        userDeliver: userDeliver ?? this.userDeliver,
        userPickup: userPickup ?? this.userPickup,
        lastDeworming: lastDeworming ?? this.lastDeworming,
        lastProtectionFleas: lastProtectionFleas ?? this.lastProtectionFleas,
        transporte: transporte ?? this.transporte,
        direccion: direccion ?? this.direccion,
        isCastrated: isCastrated ?? this.isCastrated,
        isSociable: isSociable ?? this.isSociable,
        isVaccinationUpDate: isVaccinationUpDate ?? this.isVaccinationUpDate);
  }

  @override
  List<Object> get props => [
        entryDate,
        departureDate,
        quotas,
        race,
        age,
        userDeliver,
        userPickup,
        lastDeworming,
        lastProtectionFleas,
        transporte,
        direccion,
        isCastrated,
        isSociable,
        isVaccinationUpDate
      ];
}
