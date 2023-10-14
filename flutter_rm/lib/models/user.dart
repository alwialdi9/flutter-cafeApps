part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.houseNumber,
    required this.phoneNumber,
    required this.city,
    required this.picturePath
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
  
}

User mockuser = User(id: 1, name: "Alwi Aldiansyach", email: "alwi@mail.com", address: "Jalan BDN 1 Ujung", houseNumber: "12", phoneNumber: "085692144223", city: "Jakarta", picturePath: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80");