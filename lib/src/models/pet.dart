class Pet{

  String petName;
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
    this.petName,
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
    this.petName = json['petName'];
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
      'petName': this.petName,
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