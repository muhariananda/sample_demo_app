import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample_destination_app/models/destination.dart';
import 'package:sample_destination_app/view/pages/destination_detail_page.dart';

class DestinationItem extends StatelessWidget {
  const DestinationItem({
    required this.destination,
    super.key,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DestinationDetailPage.routeName,
          arguments: destination,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              _destinationImage(),
              const SizedBox(width: 16),
              _destinationContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _destinationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          destination.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          destination.rating.toString(),
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          destination.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _destinationImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.file(
        File(
          destination.imagePath,
        ),
        fit: BoxFit.cover,
        height: 100,
        width: 100,
      ),
    );
  }
}
