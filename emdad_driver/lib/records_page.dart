// records_page.dart
import 'package:flutter/material.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class RecordsListPage extends StatelessWidget {
  final OdooClient client;

  RecordsListPage({required this.client});

  // Implement fetch records function and UI here

  @override
  Widget build(BuildContext context) {
    // Implement records list UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Records List'),
      ),
      body: Center(
        child: Text('Records will be displayed here'),
      ),
    );
  }
}
