import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/link_model.dart';
import '../widgets/link_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<LinkModel> links = [
    LinkModel(
      title: 'PainelOncoped',
      url: 'https://paineloncoped.ici.ong/',
      description: 'Painel de dados oncológicos pediátricos',
      category: 'Dashboard',
      icon: Icons.dashboard,
      color: Colors.blue,
    ),
    LinkModel(
      title: 'Teleoncoped',
      url: 'https://teleoncoped.ici.ong/',
      description: 'Plataforma de teleoncologia pediátrica',
      category: 'Plataforma',
      icon: Icons.video_call,
      color: Colors.green,
    ),
    LinkModel(
      title: 'Registro Teleoncoped',
      url: 'https://registroteleoncoped.web.app/',
      description: 'Registro de pacientes para teleoncoped',
      category: 'Registro',
      icon: Icons.note_add,
      color: Colors.orange,
    ),
    LinkModel(
      title: 'APP Registro RHC',
      url: 'https://sisop-rs.web.app/',
      description: 'Aplicativo de registro RHC',
      category: 'Registro',
      icon: Icons.app_registration,
      color: Colors.purple,
    ),
    LinkModel(
      title: 'Triagemoncoped',
      url: 'https://triagemoncopediatrica.ici.ong/',
      description: 'Plataforma de triagem oncológica pediátrica',
      category: 'Triagem',
      icon: Icons.health_and_safety,
      color: Colors.red,
    ),
    LinkModel(
      title: 'Moodle ICI',
      url: 'https://telemedicina.ici.ong/ead/',
      description: 'Ambiente virtual de aprendizagem',
      category: 'Educação',
      icon: Icons.school,
      color: Colors.teal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final categories = links.map((e) => e.category).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projeto Redes'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Confirma antes de sair
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Sair'),
                  content: const Text('Deseja realmente sair do aplicativo?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => SystemNavigator.pop(),
                      child: const Text('Sair'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: categories.map((category) {
          final categoryLinks = links
              .where((link) => link.category == category)
              .toList();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: categoryLinks
                      .map((link) => LinkCard(link: link))
                      .toList(),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
