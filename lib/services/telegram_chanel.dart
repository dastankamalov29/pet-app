


import 'package:url_launcher/url_launcher.dart';

void launcherTelegramChanel()async{
  dynamic  telegramUrl = Uri.parse('https://t.me/s/findwork?q=%23office');
  

  if(await canLaunchUrl(telegramUrl)){
    await launchUrl(telegramUrl);
  }else {
    throw "Could not launch";
  }
}