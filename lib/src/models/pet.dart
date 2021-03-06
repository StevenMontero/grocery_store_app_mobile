class Pet{

  String petId;
  String userId;
  String name;
  String breed;
  int age;
  String fur;
  bool isVaccinationUpDate;
  bool castrated;
  bool sociable;
  String photoUrl;

  Pet({
    this.petId,
    this.userId,
    this.name,
    this.breed,
    this.age,
    this.fur,
    this.isVaccinationUpDate,
    this.castrated,
    this.sociable,
    this.photoUrl
  });

   Pet.fromJson(Map<String, dynamic> json){
    this.petId = json['petID'];
    this.userId = json['userID'];
    this.name = json['petName'];
    this.breed = json['breed'];
    this.age = json['age'];
    this.fur = json['fur'];
    this.isVaccinationUpDate = json['isVaccinationUpDate'];
    this.castrated = json['castrated'];
    this.sociable = json['sociable'];
    this.photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson(){
    return {
      'petID': this.petId,
      'userID': this.userId,
      'petName': this.name,
      'breed': this.breed,
      'age': this.age,
      'fur': this.fur,
      'isVaccinationUpDate': this.isVaccinationUpDate,
      'castrated': this.castrated,
      'sociable': this.sociable,
      'photoUrl': this.photoUrl
    };
  }
}