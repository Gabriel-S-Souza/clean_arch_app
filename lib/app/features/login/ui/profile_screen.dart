import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../features.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserEntity user = ModalRoute.of(context)?.settings.arguments as UserEntity;

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: constraints.maxHeight,
            maxWidth: constraints.maxWidth
          ),
          child: Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.28,
                width: constraints.maxWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      user.avatarUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: SafeArea(
                        child: IconButton(
                          onPressed: () => Navigator.pop(context), 
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -52,
                      child: SizedBox(
                        width: constraints.maxWidth,
                        child: CircleAvatar(
                          radius: 54,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Image.network(
                            user.avatarUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              const SizedBox(height: 64),
              Text(
                user.usename?.toUpperCase() ?? '',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user.emails.first.email,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(160)
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    _ItemListWidget(
                      title: 'Celular:',
                      content: user.phones.first.phone,
                      icon: Icons.phone,
                    ),
                    _ItemListWidget(
                      title: 'Endereço:',
                      content: user.addresses.first.address1,
                      icon: Icons.location_on,
                    ),
                    _ItemListWidget(
                      title: 'Estado:',
                      content: user.addresses.first.state,
                      icon: Icons.public,
                    ),
                    _ItemListWidget(
                      title: 'Cidade:',
                      content: user.addresses.first.locality,
                      icon: Icons.location_city,
                    ),
                    _ItemListWidget(
                      title: 'Bairro:',
                      content: user.addresses.first.neighborhood,
                      icon: Icons.my_location_outlined,
                    ),
                    _ItemListWidget(
                      title: 'CEP:',
                      content: user.addresses.first.postalCode,
                      icon: Icons.location_on,
                    ),
                    _ItemListWidget(
                      title: 'Criado em:',
                      content: user.createdAt,
                      icon: Icons.login,
                    ),
                    _ItemListWidget(
                      title: 'Atualizado em:',
                      content: user.updatedAt,
                      icon: Icons.update,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

class _ItemListWidget extends StatelessWidget {
  const _ItemListWidget({
    required this.title, 
    required this.content, 
    required this.icon
  });
  final String title;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),
          ),
        ),
        subtitle: AutoSizeText(
          content,
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
          maxLines: 1,
        ),
        trailing: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary.withAlpha(180),
        ),
        contentPadding: const EdgeInsets.all(8),
      ),
      const Divider(thickness: 1, endIndent: 8, indent: 8, height: 1)
    ],
  );
}