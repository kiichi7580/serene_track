// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      hashedPassword: json['hashed_password'] as String? ?? '',
      photoUrl: json['photo_url'] as String? ?? '',
      shortTermGoal: json['short_term_goal'] as String? ?? '',
      longTermGoal: json['long_term_goal'] as String? ?? '',
      role: json['role'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? true,
      healthdataIntegrationStatus:
          json['healthdata_integration_status'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'hashed_password': instance.hashedPassword,
      'photo_url': instance.photoUrl,
      'short_term_goal': instance.shortTermGoal,
      'long_term_goal': instance.longTermGoal,
      'role': instance.role,
      'is_active': instance.isActive,
      'healthdata_integration_status': instance.healthdataIntegrationStatus,
      'created_at': instance.createdAt?.toIso8601String(),
    };
