import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class Product {
  String title;
  String description;
  double pricePerUnit;
  int quantity;
  Product({
    required this.title,
    required this.description,
    required this.pricePerUnit,
    required this.quantity,
  });
}

class Betong extends StatefulWidget {
  const Betong({Key? key}) : super(key: key);

  @override
  _BetongState createState() => _BetongState();
}

Future<void> _exportOrderSummary(
  Map<Product, int> selectedProducts,
  double totalCost,
) async {
  final tempDir = await getTemporaryDirectory();
  final filePath = '${tempDir.path}/order_summary.txt';

  final summaryContent = StringBuffer();
  summaryContent.writeln('Order Summary');

  for (final entry in selectedProducts.entries) {
    final product = entry.key;
    final quantity = entry.value;
    final cost = product.pricePerUnit * quantity;
    summaryContent.writeln(
        '${product.title}: $quantity enheter - ${cost.toStringAsFixed(2)}kr');
  }

  summaryContent.writeln('Total Pris: ${totalCost.toStringAsFixed(2)}kr');

  final file = File(filePath);
  await file.writeAsString(summaryContent.toString());

  await Share.shareFiles([filePath], text: 'Order Summary');
}

class _BetongState extends State<Betong> {
  final List<Product> _availableProducts = [
    Product(title: 'EBB.1 Form', description: '', pricePerUnit: 0, quantity: 0),
    Product(
        title: 'EBC.1 Armering', description: '', pricePerUnit: 0, quantity: 0),
    Product(
        title: 'EBC.11 Ospänd armering och dubbning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.111 Ospänd armering i bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.1111 Ospänd armering vid nybyggnad av bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.1112 Ospänd armering och dubbning vid förbättring',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'EBC.11121 Ospänd armering vid förbättring och reparation av bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.112 Ospänd armering i kaj',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.1121 Ospänd armering vid nybyggnad av kaj',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'EBC.1122 Ospänd armering och dubbning vid förbättring och reparation av kaj',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'EBC.11221 Ospänd armering vid förbättring och reparation av kaj',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.113 Ospänd armering i tunnel eller bergrum',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.12 Spännarmering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.121 Spännarmering av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.1211 Spännarmering av stål i bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.13 Fiberarmering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.131 Stålfiberarmering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.1311 Stålfiberarmering i bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.132 Plasbiberarmering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.2 Ingjutningsgods m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.24 Gängstänger, bultgrupper o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.3 Fogband', description: '', pricePerUnit: 0, quantity: 0),
    Product(
        title: 'EBC.32 Fogband av plast',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.321 Fogband av plast i bro, brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.34 Svällande fogband',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBC.341 Svällande fogband i bro, brygga kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'EBC.5 Förbä1ring och reparation med utanpåliggande armering på betongkonstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.1 Sprutbetong i bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.11 Sprutbetong i bro av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'EBF.112 Sprutbetong vid förbättring och reparation av bro av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.12 Sprutbetong i bro av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'EBF.122 Sprutbetong vid förbättring och reparation av rörbro av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.3 Sprutbetong i tunnel eller bergrum',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.31 Bergförstärkning med sprutbetong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBE.111 tillämpas',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.312 Sprutbetong med ospänd armering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.3121 Oförankrad sprutbetong med ospänd armering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.3122 Bergförankrad sprutbetong med ospänd armering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBF.314 Fiberarmerad sprutbetong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBH.2 Undervattensgjuten konstruktion typ 1',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBH.3 Undervattensgjuten konstruktion typ 2',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBJ.1 Injektering vid nybyggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'GBB.5 Konstruktion av naturstenselement i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'GBB.52 Mur av naturstenselement',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'GBB.511 Trappa av naturstenselement',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'GBB.5112 Trappa av blocksteg av natursten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'GBE.1 Konstruktion av aluminiumelement kategori A vid nybyggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'GBE.11 Konstruktion av aluminiumelement kategori A vid nybyggnad av bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'GBE.113 Brobanepla1a av aluminiumelement kategori A vid nybyggnad av bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
  ];

  final Map<Product, int> _selectedProducts = {};

  final List<String> _alphabetList = [
    'E',
    'G',
  ];

  final Map<String, double> _scrollPositions = {
    'E': 0,
    'G': 5000,
  };

  ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;
  Color _startColor = Color(0xFFFF8C00); // Orange
  Color _endColor = Color.fromARGB(255, 246, 48, 48); // Light Pink

  void _scrollToProductStartingWith(String letter) {
    double? scrollPosition = _scrollPositions[letter];
    if (scrollPosition != null) {
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateGradient() {
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    double currentOffset = _scrollController.offset;
    double scrollPercentage = currentOffset / maxScrollExtent;

    setState(() {
      _startColor = Color.lerp(
        Color(0xFFFF8C00), // Orange
        Color.fromRGBO(255, 151, 24, 1), // Light Pink
        scrollPercentage,
      )!;

      _endColor = Color.lerp(
        Color.fromARGB(255, 246, 48, 48), // Light Pink
        Color.fromRGBO(247, 15, 170, 1), // Light Blue
        scrollPercentage,
      )!;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateGradient);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateGradient);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Betong'),
        backgroundColor: Color.fromARGB(
            255, 238, 169, 65), // Set the app bar background color
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_startColor, _endColor],
          ),
        ),
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              setState(() {
                _scrollOffset = _scrollController.offset;
              });
            }
            return false;
          },
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _availableProducts.length,
                      itemBuilder: (context, index) {
                        final product = _availableProducts[index];
                        return CheckboxListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.description,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          subtitle:
                              Text(' ${product.pricePerUnit}kr per enhet'),
                          value: _selectedProducts.containsKey(product),
                          onChanged: (selected) {
                            setState(() {
                              if (selected == true) {
                                _selectedProducts[product] = product.quantity;
                              } else {
                                _selectedProducts.remove(product);
                              }
                            });
                          },
                          secondary: SizedBox(
                            width: 50,
                            child: TextFormField(
                              initialValue: product.quantity.toString(),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  final intValue = int.tryParse(value);
                                  if (intValue != null) {
                                    product.quantity = intValue;
                                    if (intValue == 0) {
                                      _selectedProducts.remove(product);
                                    } else {
                                      _selectedProducts[product] = intValue;
                                    }
                                  }
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 30,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: _alphabetList.length,
                      itemBuilder: (context, index) {
                        final letter = _alphabetList[index];
                        return ListTile(
                          title: Center(child: Text(letter)),
                          onTap: () {
                            _scrollToProductStartingWith(letter);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 30,
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: _alphabetList.length,
                    itemBuilder: (context, index) {
                      final letter = _alphabetList[index];
                      return ListTile(
                        title: Center(child: Text(letter)),
                        onTap: () {
                          _scrollToProductStartingWith(letter);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(
              255, 245, 169, 28), // Set the button background color
          onPressed: () {
            double totalCost = 0;
            for (final entry in _selectedProducts.entries) {
              final quantity = entry.value;
              final cost = entry.key.pricePerUnit * quantity;
              totalCost += cost;
            }
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Order Summary'),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SizedBox(
                      width: 300,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final entry in _selectedProducts.entries)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${entry.key.title}: '),
                                      Text('${entry.value} enheter'),
                                      Text(
                                        '${(entry.key.pricePerUnit * entry.value).toStringAsFixed(2)}kr',
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 8),
                              const Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Total Pris:'),
                                    const Text(''),
                                    Text(
                                      '${totalCost.toStringAsFixed(2)}kr',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Export'),
                      onPressed: () {
                        _exportOrderSummary(_selectedProducts, totalCost);
                      },
                    ),
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.calculate),
        ),
      ),
    );
  }
}
