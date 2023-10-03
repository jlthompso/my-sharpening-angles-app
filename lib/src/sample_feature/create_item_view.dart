import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class CreateItemView extends StatelessWidget {
  const CreateItemView({super.key});

  static const routeName = '/new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
