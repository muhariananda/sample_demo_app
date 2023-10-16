import 'package:flutter/material.dart';
import 'package:sample_destination_app/view/pages/destination_insert_page.dart';
import 'package:sample_destination_app/view/widgets/destination_list_view.dart';

class DestinationListPage extends StatelessWidget {
  const DestinationListPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: DestinationListView(
          destinations: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            DestinationInsertPage.routeName,
          );
        },
      ),
    );
  }
}
