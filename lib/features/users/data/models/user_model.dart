import 'dart:convert';
import 'package:rest_api_with_provider/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phone,
    required super.website,
    required super.address,
    required super.company,
  });

  UserModel copyWith({
    final int? id,
    final String? name,
    final String? username,
    final String? email,
    final String? phone,
    final String? website,
    final Map<String, dynamic>? address,
    final Map<String, dynamic>? company,
  }) {
    return UserModel(
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      website: map['website'] ?? '',
      address: Map<String, dynamic>.from(map['address'] ?? {}),
      company: Map<String, dynamic>.from(map['company'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
      'address': address,
      'company': company,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
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

  static UserModel fromJson(String jsonStr) {
    return UserModel.fromMap(json.decode(jsonStr));
  }
}