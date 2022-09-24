import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../core/core.dart';
import '../interface_adapters/controllers/controllers.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _controller = GetIt.I.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundFadeImage(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: size.height * 0.27,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
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
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Form(
                          key: _controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFieldWidget(
                                label: 'Usuário',
                                onChanged: _controller.setUser,
                                validator: Validator.validateUser,
                              ),
                              const SizedBox(height: 18),
                              Observer(
                                builder: (context) => TextFieldWidget(
                                    label: 'Senha',
                                    obscureText: !_controller.showPassword,
                                    onChanged: _controller.setPassword,
                                    validator: Validator.validatePassword,
                                    suffix: IconButton(
                                      onPressed: _controller.togglePassword,
                                      icon: Icon(
                                        _controller.showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off
                                      ),
                                    ),
                                  )
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text('Esqueci minha senha')
                                ),
                              ),
                              Observer(
                                builder: (context) => ButtonWidget(
                                    label: 'ENTRAR',
                                    isLoading: _controller.isLoading,
                                    enable: _controller.isValidForm,
                                    backgroundColor: Theme.of(context).colorScheme.primary,
                                    onPressed: () => _controller.login(context),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}