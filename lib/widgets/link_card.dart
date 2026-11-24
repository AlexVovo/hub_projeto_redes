import 'package:flutter/material.dart';
import '../models/link_model.dart';
import '../utils/url_launcher_helper.dart';

class LinkCard extends StatelessWidget {
  final LinkModel link;
  const LinkCard({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFDCE2EF)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () async {
          try {
            await UrlLauncherHelper.openLink(link.url);
          } catch (_) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Não foi possível abrir o recurso. Tente novamente.',
                  ),
                ),
              );
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1FF),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Icon(
                      link.icon,
                      color: const Color(0xFF3458DB),
                      size: 25,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.open_in_new_rounded,
                    size: 18,
                    color: Color(0xFF718091),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                link.category,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF3458DB),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                link.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF182544),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                link.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Color(0xFF536170),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
