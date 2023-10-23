import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // Wrap the text in a Container
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 255, 204, 102), // Brighter orange color
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'Kalkylanalys is an auto-renewable subscription. The user will be charged 499kr every month. Your subscription will be charged to your Apple account at confirmation of purchase and will automatically renew every month unless auto-renew is turned off. You are free to cancel the subscription at any given time.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Privacy policy',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 254, 254, 254),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final url =
                              'https://www.freeprivacypolicy.com/live/7d2d6856-8843-4e3a-a28d-d06809071bbf';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                    ),
                    const TextSpan(text: ' | '),
                    TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final url =
                              'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
