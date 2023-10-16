import 'package:sample_destination_app/db/models/destination_cm.dart';
import 'package:sample_destination_app/models/destination.dart';

extension DestinationCMtoDomain on DestinationCM {
  Destination toDomainModel() => Destination(
        name: name,
        description: description,
        price: price,
        rating: rating,
        imagePath: imagePath,
      );
}

extension DestinationsListCMtoDomain on List<DestinationCM> {
  List<Destination> toDomain() => map(
        (destination) => destination.toDomainModel(),
      ).toList();
}
