import 'package:json_annotation/json_annotation.dart';

part 'items.g.dart';

@JsonSerializable()
class Items {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  Items({
    this.id,
    this.name,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
