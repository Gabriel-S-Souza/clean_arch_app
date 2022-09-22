import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundFadeImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: size.height * 0.27,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem Vindo! \u{1F604}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              offset: const Offset(0, 0),
                              color: Theme.of(context).colorScheme.outline.withOpacity(0.7)
                            ),
                            Shadow(
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                              color: Theme.of(context).colorScheme.primary
                            )
                          ]
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'POC Clean Arch! \u{1F4BB}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              offset: const Offset(0, 0),
                              color: Theme.of(context).colorScheme.outline.withOpacity(0.7)
                            ),
                            Shadow(
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                              color: Theme.of(context).colorScheme.primary
                            )
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const TextFieldWidget(
                            label: 'Usuário',
                          ),
                          const SizedBox(height: 18),
                          const TextFieldWidget(
                            label: 'Senha',
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {}, 
                              child: const Text('Esqueci minha senha')
                            ),
                          ),
                          ButtonWidget(
                            label: 'ENTRAR',
                            enable: true,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}