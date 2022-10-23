import 'package:flutter/material.dart';

import '../../../../di/di.dart';
import '../controllers/controllers.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _controller = ServiceLocatorImp.I.get<HomeController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Editar Perfil'),
            )
          ],
        ),
        body: const Center(
          child: Text('home'),
        ),
      );
}
