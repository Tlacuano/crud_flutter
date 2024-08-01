import 'package:flutter/material.dart';

class BarcaPage extends StatelessWidget {
  const BarcaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barca Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Barca Page',
            ),
          ],
        ),
      ),
    );
  }
}
