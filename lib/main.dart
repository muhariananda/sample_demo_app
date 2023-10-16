import 'package:flutter/material.dart';
import 'package:sample_destination_app/models/destination.dart';
import 'package:sample_destination_app/view/pages/destination_detail_page.dart';
import 'package:sample_destination_app/view/pages/destination_insert_page.dart';
import 'package:sample_destination_app/view/pages/destination_list_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Destination Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: DestinationListPage.routeName,
      routes: {
        DestinationListPage.routeName: (_) => const DestinationListPage(),
        DestinationInsertPage.routeName: (_) => const DestinationInsertPage(),
        DestinationDetailPage.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return DestinationDetailPage(destination: args! as Destination);
        }
      },
    );
  }
}
