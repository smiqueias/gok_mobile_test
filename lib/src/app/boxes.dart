import 'package:hive/hive.dart';

import 'modules/user_repo/data/models/tag_model.dart';

class Boxes {
  static Box<TagModel> getTags() => Hive.box<TagModel>("tags");
}
