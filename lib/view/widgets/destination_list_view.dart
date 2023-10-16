import 'package:flutter/material.dart';
import 'package:sample_destination_app/models/destination.dart';
import 'package:sample_destination_app/view/widgets/destination_item.dart';

class DestinationListView extends StatelessWidget {
  const DestinationListView({
    required this.destinations,
    super.key,
  });

  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListView.separated(
        itemCount: destinations.length,
        separatorBuilder: (_, __) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (_, index) {
          final destination = destinations[index];
          return DestinationItem(
            destination: destination,
          );
        },
      ),
    );
  }
}
