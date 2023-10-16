import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sample_destination_app/db/models/destination_cm.dart';

class KeyValueStorage {
  KeyValueStorage({
    HiveInterface? hive,
  }) : _hive = hive ?? Hive {
    try {
      _hive.registerAdapter(DestinationCMAdapter());
    } catch (_) {
      throw Exception(
        "You shouldn't have more than one [KeyValueStorage] instance in your "
        'project.',
      );
    }
  }

  static const _destinationsBoxKey = 'destinations';

  final HiveInterface _hive;

  Future<Box<DestinationCM>> get destinations => _openHiveBox<DestinationCM>(
        _destinationsBoxKey,
      );

  Future<Box<T>> _openHiveBox<T>(String boxKey) async {
    if (_hive.isBoxOpen(boxKey)) {
      return _hive.openBox(boxKey);
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return _hive.openBox<T>(
        boxKey,
        path: directory.path,
      );
    }
  }
}
