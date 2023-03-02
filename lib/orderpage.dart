import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

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
      body: Visibility(
        visible: isSubscribed,
        replacement: Container(
          alignment: Alignment.center,
          child: const Text(
            "Var god prenumerera för att få tillgång till KMA beställningar",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        child: const WebView(
          initialUrl: 'https://ewt6x54kih9.typeform.com/to/L6Ii26EK',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
