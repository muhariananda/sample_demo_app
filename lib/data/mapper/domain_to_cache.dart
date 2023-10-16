import 'package:sample_destination_app/db/models/destination_cm.dart';
import 'package:sample_destination_app/models/destination.dart';

extension DestinationToCM on Destination {
  DestinationCM toCacheModel() => DestinationCM(
        name: name,
        description: description,
        price: price,
        rating: rating,
        imagePath: imagePath,
      );
}
