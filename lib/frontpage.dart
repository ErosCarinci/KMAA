import 'package:flutter/material.dart';
import 'package:kalkylanalys/homepage.dart';
import 'package:kalkylanalys/kontakt.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'logout.dart';
import 'frontpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'orderpage.dart';
import 'infopage.dart';
import 'kontakt.dart';

class FrontPage extends StatefulWidget {
  const FrontPage();

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  bool isSubscribed = false;
  bool isLoading = false;
  bool isPromoAvailable = true;
  String promoPackageId =
      "skapren"; // the identifier of the promotional package

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
      final entitlement = customerInfo.entitlements.active['skapren'];
      isSubscribed = entitlement != null;
    });
  }

  // This function handles the subscription action.
  Future<void> handleSubscriptionAction() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    try {
      await Purchases.purchaseProduct('skapren');
    } catch (e) {
      // Handle the error, e.g., subscription window cancellation.
      print('Subscription error: $e');
      setState(() => isLoading = false); // Stop loading on error.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Image.asset('assets/sba-logo (2) (3).png'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu, // This is the icon you want to make bigger
                size: 30.0, // Adjust the size as needed
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(0, 220, 154, 12),
        child: Padding(
          padding: const EdgeInsets.only(top: 40), // Adjust top padding here
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  leading: const Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.white,
                  ),
                  title: const Text('Kalkylera',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderPage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: const Text('Kund Information',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoPage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  leading: const Icon(
                    Icons.contact_mail,
                    color: Colors.white,
                  ),
                  title: const Text('Kontakt',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Kontakt(
                          phoneNumber: '070-7449494',
                          emailAddress: 'esmail@sfaanalys.se',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Untitled-1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 725,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Välkommen, överse kalkyler här',
                    style: TextStyle(
                      fontSize: 21,
                      fontFamily: 'Lato Black',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  isSubscribed
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50),
                            alignment: Alignment.center,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 196, 69),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(220, 50),
                          ),
                          child: const Text(
                            "Kalkylera",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        )
                      : Column(
                          children: <Widget>[
                            const Text(
                              "Kalkylanalys 499kr per månad",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.5,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: handleSubscriptionAction,
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(50),
                                alignment: Alignment.center,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 196, 69),
                                shape: const StadiumBorder(),
                                minimumSize: const Size(220, 50),
                              ),
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text(
                                      "Prenumerera",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                            ),
                          ],
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
