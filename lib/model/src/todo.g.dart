// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categoryId: const CategoryEnumConverter()
          .fromJson(json['category_id'] as String?),
      ownerId: (json['owner_id'] as num?)?.toInt() ?? 0,
      completed: json['completed'] as bool? ?? false,
      notificationTime: json['notification_time'] == null
          ? null
          : DateTime.parse(json['notification_time'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category_id': const CategoryEnumConverter().toJson(instance.categoryId),
      'owner_id': instance.ownerId,
      'completed': instance.completed,
      'notification_time': instance.notificationTime?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
