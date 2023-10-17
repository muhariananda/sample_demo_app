import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_destination_app/controller/destination_controller.dart';
import 'package:sample_destination_app/view/pages/destination_insert_page.dart';
import 'package:sample_destination_app/view/widgets/destination_list_view.dart';

class DestinationListPage extends StatelessWidget {
  DestinationListPage({super.key});

  static const routeName = '/';

  final controller = Get.put(DestinationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder(
          init: DestinationController(),
          builder: (controller) {
            return DestinationListView(
              destinations: controller.destinations,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add_rounded,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            DestinationInsertPage.routeName,
          ).then(
            (_) => controller.getDestinations(),
          );
        },
      ),
    );
  }
}
