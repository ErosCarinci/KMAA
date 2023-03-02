import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kalkylanalys/homepage.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'logout.dart';
import 'frontpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'orderpage.dart';
import 'infopage.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  bool isSubscribed = false;
  bool isLoading = false;

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

  @override
  late CarouselSlider carouselSlider;

  List imageList = [
    'assets/dator-ritningar-byggarbetsplats-1000.jpg',
    'assets/flygbild-arbetsfordon-vag-1000.jpg',
    'assets/ritning-tva-man-1000.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/kma-logo-app.png'),
        backgroundColor: Color.fromARGB(255, 220, 154, 12),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 220, 154, 12),
          child: ListView(
            padding: EdgeInsets.all(40),
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: const Text('Logga ut',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text('Hem',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FrontPage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: ListTile(
                  leading: Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.white,
                  ),
                  title: const Text('Beställ',
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
                padding: EdgeInsets.all(16),
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: const Text('Customer Information',
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
            ],
          )),
      backgroundColor: Color.fromARGB(255, 173, 122, 11),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              autoPlay: true,
              reverse: false,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),

              // pauseAutoPlayOnTouch: Duration(seconds: 10),
              // scrollDirection: Axis.horizontal,
            ),
            items: imageList
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 20.0,
                      ),
                      elevation: 6.0,
                      shadowColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          item,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Välkommen, beställ KMA här',
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: 'Lato Black',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Visibility(
            visible: !isSubscribed,
            child: Column(
              children: <Widget>[
                Text(
                  "KMA Analys 1999kr per månad",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Prenumereraa"),
                  onPressed: () async {
                    if (isLoading) return;
                    setState(() => isLoading = true);

                    await Purchases.purchaseProduct('pren');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(50),
                    alignment: Alignment.center,
                    backgroundColor: Color.fromARGB(255, 250, 187, 51),
                    minimumSize: const Size(220, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
