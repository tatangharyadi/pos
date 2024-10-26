import 'package:flutter/material.dart';
import 'package:pos/navbar.dart';
import 'package:pos/screens/home/home_dashboard/home_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: HomePanel(),
      ),
    );
  }
}
