import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sample_destination_app/models/destination.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({
    required this.destination,
    super.key,
  });

  static const routeName = '/destination-detail';

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.file(
                  File(
                    destination.imagePath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              destination.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              destination.price.toString(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              destination.rating.toString(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              destination.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
