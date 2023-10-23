import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class Kontakt extends StatelessWidget {
  final String phoneNumber;
  final String emailAddress;

  Kontakt({required this.phoneNumber, required this.emailAddress});

  void _launchPhoneCall() async {
    final phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  void _launchEmail() async {
    final emailUrl = 'mailto:$emailAddress';
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw 'Could not launch $emailUrl';
    }
  }

  void _copyText(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Copied to clipboard: $text'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 182, 57),
      appBar: AppBar(
        title: Image.asset('assets/sba-logo (2) (3).png'),
        backgroundColor: Color.fromARGB(255, 220, 154, 12),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // Wrap the contact details in a Container
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:
                    Color.fromARGB(255, 255, 204, 102), // Brighter orange color
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Telefon Nummer:'),
                    subtitle: GestureDetector(
                      onTap: _launchPhoneCall,
                      onLongPress: () => _copyText(context, phoneNumber),
                      child: Text(
                        phoneNumber,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Email:'),
                    subtitle: GestureDetector(
                      onTap: _launchEmail,
                      onLongPress: () => _copyText(context, emailAddress),
                      child: Text(
                        emailAddress,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
