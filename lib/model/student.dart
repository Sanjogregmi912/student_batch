import 'package:batch_student_objbox_api/model/batch.dart';
import 'package:batch_student_objbox_api/model/course.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part "student.g.dart";

@Entity()
@JsonSerializable()
class Student {
  @Id(assignable: true)
  int stdId;

  @Unique()
  @Index()
  @JsonKey(name: 'id')
  String? studentId;

  String? fname;
  String? lname;
  String? image;
  String? username;
  String? password;

  final batch = ToOne<Batch>();
  final course = ToMany<Course>();

  Student({
    this.studentId,
    this.fname,
    this.lname,
    this.image,
    this.username,
    this.password,
    this.stdId = 0,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> tojson() => _$StudentToJson(this);
}
