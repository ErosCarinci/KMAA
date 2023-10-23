import 'package:flutter/material.dart';
import 'package:kalkylanalys/betong.dart';
import 'package:kalkylanalys/markochoch.dart';
import 'finplanering.dart';
import 'package:kalkylanalys/forarbeten.dart';
import 'package:kalkylanalys/installationimark.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'grundlaggning.dart';
import 'markochoch.dart';

class Category {
  final String title;
  final Widget page;
  final String imageAsset;

  Category({
    required this.title,
    required this.page,
    required this.imageAsset,
  });
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isSubscribed = false;

  @override
  void initState() {
    super.initState();

    Purchases.addCustomerInfoUpdateListener(
      (_) => updateCustomerStatus(),
    );
    updateCustomerStatus();
  }

  Future updateCustomerStatus() async {
    final customerInfo = await Purchases.getCustomerInfo();

    setState(() {
      final entitlement = customerInfo.entitlements.active['pren'];
      isSubscribed = entitlement != null;
    });
  }

  final categoryList = [
    Category(
      title: 'Mark och Grundläggning',
      page: const markochoch(),
      imageAsset: 'assets/pexels-davide-locatelli-2383650.jpg',
    ),
    Category(
      title: 'Förarbeten',
      page: const Forarbeten(),
      imageAsset: 'assets/pexels-pok-rie-1188554.jpg',
    ),
    Category(
      title: 'Betong',
      page: const Betong(),
      imageAsset: 'assets/pexels-rodolfo-quirós-2219024.jpg',
    ),
    Category(
      title: 'Installation i Mark',
      page: const installationimark(),
      imageAsset: 'assets/pexels-jan-zakelj-13628574.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 211, 194, 128),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Untitled-1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Visibility(
          visible: isSubscribed, //change to isSubscribed
          replacement: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: const Text(
              'Var god prenumerera för att få tillgång till alla kalkyler',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          child: ListView.builder(
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              final category = categoryList[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => category.page,
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  height: 175.0, // Adjust the height as needed
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(category.imageAsset),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Color.fromARGB(128, 0, 0, 0), // Add some opacity
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: Text(
                            category.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
