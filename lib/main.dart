import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:upgrader/upgrader.dart';
import 'package:kalkylanalys/orderpage.dart';
import 'authpage.dart';
import 'FrontPage.dart';
import 'loginpage.dart';
import 'package:flutter/material.dart';

final _configuration =
    PurchasesConfiguration('appl_HVpEULQunzdrjPPlIoRYoOFxbTX');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Purchases.configure(_configuration);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: UpgradeAlert(
          upgrader: Upgrader(
            dialogStyle: UpgradeDialogStyle.cupertino,
          ),
          child: const FrontPage(),
        ),
      ),
    );
  }
}


//un-comment code and authpage.dart to restore account loginpage feature 
/*class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int index = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 220, 154, 12),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: Auth().authStatusChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const FrontPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}*/
