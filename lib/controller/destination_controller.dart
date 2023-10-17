import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sample_destination_app/models/destination.dart';

class DestinationController extends GetxController {
  static const _destinationBox = 'destinations';

  List<Destination> _destinations = [];
  List<Destination> get destinations => _destinations;

  @override
  void onInit() {
    try {
      Hive.registerAdapter(DestinationAdapter());
    } catch (e) {
      log(e.toString());
    }
    getDestinations();
    super.onInit();
  }

  Future<void> addDestination(Destination destination) async {
    final box = Hive.box<Destination>(_destinationBox);
    await box.add(destination);
  }

  Future<void> getDestinations() async {
    late Box<Destination> box;

    if (Hive.isBoxOpen(_destinationBox)) {
      box = Hive.box(_destinationBox);
    } else {
      box = await Hive.openBox(_destinationBox);
    }

    final collection = box.values.toList();

    _destinations = collection;
    update();
  }
}
