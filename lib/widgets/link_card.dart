import 'package:flutter/material.dart';
import '../models/link_model.dart';
import '../utils/url_launcher_helper.dart';

class LinkCard extends StatelessWidget {
  final LinkModel link;
  const LinkCard({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: link.color.withOpacity(0.1),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(link.icon, color: link.color, size: 32),
        title: Text(
          link.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(link.description),
        trailing: const Icon(Icons.open_in_new),
        onTap: () => UrlLauncherHelper.openLink(link.url),
      ),
    );
  }
}
