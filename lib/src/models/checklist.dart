import 'package:interview_task/src/models/items.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checklist.g.dart';

@JsonSerializable()
class Checklist {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'items')
  Items? items;

  @JsonKey(name: 'checklistCompletionStatus')
  bool? checklistCompletionStatus;

  Checklist({
    this.id,
    this.name,
    this.items,
    this.checklistCompletionStatus,
  });

  factory Checklist.fromJson(Map<String, dynamic> json) =>
      _$ChecklistFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistToJson(this);
}
