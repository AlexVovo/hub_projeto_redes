import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir o link $url';
    }
  }
}
