// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categoryId: json['categoryId'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      completed: json['completed'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'uid': instance.uid,
      'completed': instance.completed,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
