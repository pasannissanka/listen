import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'author.g.dart';

@JsonSerializable()
class Author extends Equatable{

  final String id;

  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;

  final String dob;
  final String dod;

  Author(
    this.id,
    this.firstName,
    this.lastName,
    this.dob,
    this.dod
  );

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  @override
  List<Object> get props => [
    id,
    firstName,
    lastName,
    dob,
    dod
  ];
}
