import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  final Map<String, dynamic> address;
  final Map<String, dynamic> company;

  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  UserEntity copyWith({
    final int? id,
    final String? name,
    final String? username,
    final String? email,
    final String? phone,
    final String? website,

    final Map<String, dynamic>? address,
    final Map<String, dynamic>? company,
  }){
    return UserEntity(
      id: id ?? this.id, 
      name: name ?? this.name, 
      username: username ?? this.username, 
      email: email ?? this.email, 
      phone: phone ?? this.phone, 
      website: website ?? this.website, 
      address: address ?? this.address, 
      company: company ?? this.company,
    );
  }

  String getFormattedAddress() {
    final street = address['street'] ?? '';
    final suite = address['suite'] ?? '';
    final city = address['city'] ?? '';
    final postalCode = address['zipcode'] ?? '';
    final geo = address['geo'] ?? '';

    return '$street\n$suite\n$city, $postalCode, $geo';
  }

  String getFormattedGeo() {
    final geo = address['geo'] ?? {};
    final lat = geo['lat'] ?? '';
    final lng = geo['lng'] ?? '';
    return 'Latitude: $lat, Longitude: $lng';
  }
  
  @override
  List<Object?> get props {
    return[
      id,
      name,
      username,
      email,
      phone,
      website,
      address,
      company,
    ];
  }
}
