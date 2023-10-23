import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
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

class Grundlaggning extends StatefulWidget {
  const Grundlaggning({Key? key}) : super(key: key);

  @override
  _GrundlaggningState createState() => _GrundlaggningState();
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


class _GrundlaggningState extends State<Grundlaggning> {
  final List<Product> _availableProducts = [];

  final Map<Product, int> _selectedProducts = {};

  final List<String> _alphabetList = [
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'J',
    'L',
    'N',
    'P',
    'Y',
    'Z',
  ];

  final Map<String, double> _scrollPositions = {
    'B': 0,
    'C': 8150,
    'D': 34150,
    'E': 3000,
    'F': 4000,
    'G': 5000,
    'H': 6000,
    'J': 7000,
    'L': 0,
    'N': 9000,
    'P': 10000,
    'Y': 11000,
    'Z': 12000,
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
        title: const Text('Grundläggning'),
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
                return CupertinoAlertDialog(
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
