class UserDetailsModel {
  final String name;
  final String address;

  UserDetailsModel({
    required this.name,
    required this.address,
  });

  Map<String, dynamic> getJson() => {
        "name": name,
        "address": address,
      };
  factory UserDetailsModel.getModeFromJson(Map<String, dynamic> json) {
    return UserDetailsModel(name: json['name'], address: json['address']);
  }
}


// UserDetailsModel banku=UserDetailsModel(name: name, address: address)