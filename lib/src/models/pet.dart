class Pet{

  String petId;
  String userId;
  String name;
  double size;
  String breed;
  String age;
  String fur;
  bool vaccine;
  bool deworming;
  bool pestProtection;
  bool sociable;
  bool castrated;

  Pet({
    this.petId,
    this.userId,
    this.name,
    this.size,
    this.breed,
    this.age,
    this.fur,
    this.vaccine,
    this.deworming,
    this.pestProtection,
    this.sociable,
    this.castrated
  });

   Pet.fromJson(Map<String, dynamic> json){
    this.petId = json['idPet'];
    this.userId = json['idUser'];
    this.name = json['petName'];
    this.size = json['size'];
    this.breed = json['breed'];
    this.age = json['age'];
    this.fur = json['fur'];
    this.vaccine = json['vaccine'];
    this.deworming = json['deworming'];
    this.pestProtection = json['pestProtection'];
    this.sociable = json['sociable'];
    this.castrated = json['castrated'];
  }

  Map<String, dynamic> toJson(){
    return {
      'idPet': this.petId,
      'idUser': this.userId,
      'petName': this.name,
      'size': this.size,
      'breed': this.breed,
      'age': this.age,
      'fur': this.fur,
      'vaccine': this.vaccine,
      'deworming': this.deworming,
      'pestProtection' : this.pestProtection,
      'sociable': this.sociable,
      'castrated': this.castrated
    };
  }
}