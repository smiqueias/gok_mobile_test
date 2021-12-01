import 'package:hive/hive.dart';
part 'tag_model.g.dart';

@HiveType(typeId: 0)
class TagModel extends HiveObject {
  @HiveField(0)
  String? name;

  TagModel({this.name});
}
