import 'package:flutter/material.dart';

import '../../../../di/di.dart';
import '../controllers/controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = ServiceLocatorImp.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.getSessionUser();
  }

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
        body: Center(
          child: Text(_controller.sessionUser!.name),
        ),
      );
}
