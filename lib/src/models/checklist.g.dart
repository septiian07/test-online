// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checklist _$ChecklistFromJson(Map<String, dynamic> json) => Checklist(
      id: json['id'] as int?,
      name: json['name'] as String?,
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
      checklistCompletionStatus: json['checklistCompletionStatus'] as bool?,
    );

Map<String, dynamic> _$ChecklistToJson(Checklist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
      'checklistCompletionStatus': instance.checklistCompletionStatus,
    };
