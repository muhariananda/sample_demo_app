import 'package:sample_destination_app/db/key_value_storage.dart';
import 'package:sample_destination_app/db/models/destination_cm.dart';

class DestinationLocalStorage {
  DestinationLocalStorage({
    required this.keyValueStorage,
  });

  final KeyValueStorage keyValueStorage;

  Future<void> insertDestination(DestinationCM destination) async {
    final box = await keyValueStorage.destinations;
    return box.put(destination.name, destination);
  }

  Stream<List<DestinationCM>> watchDestinations() async* {
    final box = await keyValueStorage.destinations;
    yield* box.watch().map((_) => box.values.toList());
  }
}
