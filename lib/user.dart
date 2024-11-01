class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  final Map<String, dynamic> address;
  final Map<String, dynamic> company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      website: map['website'] ?? '',
      address: Map<String, dynamic>.from(map['address']),
      company: Map<String, dynamic>.from(map['company']),
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
}
