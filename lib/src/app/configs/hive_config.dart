import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/tag_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  static start() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TagModelAdapter());
    await Hive.openBox<TagModel>("tags");
  }
}
