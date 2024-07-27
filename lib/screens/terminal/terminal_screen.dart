import 'package:flutter/material.dart';
import 'package:pos/navbar.dart';

class TerminalScreen extends StatelessWidget {
  const TerminalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),      
      appBar: AppBar(
        title: const Text('Terminal'),
      ),
      body: const Center(
        child: Text(
          'Terminal Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
 