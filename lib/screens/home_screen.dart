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
    LinkModel(
      title: 'Profissionais Externos',
      url: 'https://md-externos.web.app',
      description: 'Acesso destinado a profissionais externos',
      category: 'Profissionais',
      icon: Icons.groups,
      color: Colors.brown,
    ),
    LinkModel(
      title: 'Indicadores Painel Oncoped',
      url: 'https://indicadorespaineloncoped.web.app/',
      description: 'Painel de indicadores oncológicos pediátricos',
      category: 'Dashboard',
      icon: Icons.analytics,
      color: Colors.cyan,
    ),
    LinkModel(
      title: 'Link Artigos Projeto Redes',
      url:
          'https://drive.google.com/drive/folders/1vfgCS06849M3i-7LM8WeDGHqlMUprhaA?usp=sharing',
      description: 'Pasta com artigos do Projeto Redes',
      category: 'Documentos',
      icon: Icons.article,
      color: Colors.deepOrange,
    ),
    LinkModel(
      title: 'Projeto Redes',
      url:
          'https://drive.google.com/drive/folders/1lbHNWlCcbA5QIqzQgsKcxRL4ceGh3fDJ?usp=sharing',
      description: 'Pasta de documentos do Projeto Redes',
      category: 'Documentos',
      icon: Icons.folder_shared,
      color: Colors.amber,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final categories = links.map((e) => e.category).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF001840), Color(0xFF006C8F)],
            ),
          ),
        ),
        title: const Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0x26FFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.all(9),
                child: Icon(Icons.hub_outlined, size: 26),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hub Redes',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Projetos e recursos integrados',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xCCFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton.filledTonal(
              tooltip: 'Sair do aplicativo',
              style: IconButton.styleFrom(
                backgroundColor: const Color(0x26FFFFFF),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.logout_rounded),
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
