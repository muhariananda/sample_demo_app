import 'package:sample_destination_app/data/destination_local_storage.dart';
import 'package:sample_destination_app/data/mapper/cache_to_domain.dart';
import 'package:sample_destination_app/data/mapper/domain_to_cache.dart';
import 'package:sample_destination_app/db/key_value_storage.dart';
import 'package:sample_destination_app/models/destination.dart';

class DestinationRepository {
  DestinationRepository({
    required KeyValueStorage keyValueStorage,
    DestinationLocalStorage? localStorage,
  }) : _localStorage = localStorage ??
            DestinationLocalStorage(keyValueStorage: keyValueStorage);

  final DestinationLocalStorage _localStorage;

  Future<void> addDestination(Destination destination) async {
    final cacheModel = destination.toCacheModel();
    await _localStorage.insertDestination(cacheModel);
  }

  Stream<List<Destination>> getDestinations() async* {
    yield* _localStorage.watchDestinations().map(
          (destinations) => destinations.toDomain(),
        );
  }
}
