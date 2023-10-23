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

class Forarbeten extends StatefulWidget {
  const Forarbeten({Key? key}) : super(key: key);

  @override
  _ForarbetenState createState() => _ForarbetenState();
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

class _ForarbetenState extends State<Forarbeten> {
  final List<Product> _availableProducts = [
    Product(
        title: 'BBC.13 Geoteknisk undersökning (st)',
        description: '',
        pricePerUnit: 3500,
        quantity: 0),
    Product(
        title: 'BBC.131 Geoteknisk undersökning i jord (st)',
        description: '',
        pricePerUnit: 3500,
        quantity: 0),
    Product(
        title: 'BCB.13 Tillfällig grundvattensänkning eller portryckssänkning',
        description:
            'Grundvattensänkning eller portryckssänkning bör uböras utan vattengrumling eller förlust av finmaterial.(st)',
        pricePerUnit: 9600,
        quantity: 0),
    Product(
        title: 'BCB.131 Tillfällig grundvattensänkning med dränerande lager',
        description:
            'Dränerande lager ska uböras med minst 0,2 m tjockt lager av grus- eller krossmaterial.(st)',
        pricePerUnit: 13900,
        quantity: 0),
    Product(
        title:
            'BCB.3 Tillfälliga åtgärder för skydd m m av ledning och kabel - ',
        description:
            'Tillfälliga åtgärder för att skydda ledningar och anordningar bör vidtas för att förhindra skador. Behovet av extra åtgärder bör rapporteras snabbt till ledningsägaren och beställaren för godkännande. Återfyllning och packning av befintliga ledningar bör uböras i samband med liknande arbete. Återfyllningen bör göras med lämpliga material enligt gällande kod och packas enligt kraven.(m)',
        pricePerUnit: 150,
        quantity: 0),
    Product(
        title:
            'BCB.3 Tillfälliga åtgärder för skydd m m av ledning och kabel(st)',
        description: '',
        pricePerUnit: 1700,
        quantity: 0),
    Product(
        title:
            'BCB.31 Åtgärd för rörledning i mark. GASLEDNING. Fjärrvärme- och närrkyleledning',
        description:
            'Brandposter och avstängningsanordningar måste vara tillgängliga och får inte blockeras.Gasledning: Arbete vid gasledningar ska följa Energigas Sveriges Energigas-normer, EGN. Fjärrvärme- och närrkyleledning: Arbete vid närrvärme- och närrkyleledningar ska följa Svensk Fjärrvärmes tekniska bestämmelse D:211 Läggningsanvisningar för närrvärme- och närrkyleledningar. (m)',
        pricePerUnit: 150,
        quantity: 0),
    Product(
        title:
            'BCB.31 Åtgärd för rörledning i mark. GASLEDNING. Fjärrvärme- och närrkyleledning',
        description:
            'Brandposter och avstängningsanordningar måste vara tillgängliga och får inte blockeras.Gasledning: Arbete vid gasledningar ska följa Energigas Sveriges Energigas-normer,EGN. Fjärrvärme- och närrkyleledning: Arbete vid närrvärme- och närrkyleledningar ska följaSvensk Fjärrvärmes tekniska bestämmelse D:211 Läggningsanvisningar för närrvärme- ochnärrkyleledningar. (st)',
        pricePerUnit: 1700,
        quantity: 0),
    Product(
        title: 'BCB.33 Åtgärd för luftledning',
        description:
            'Följ elsäkerhetsanvisningar och erhåll tillstånd vid arbete intill friledning. För frånkoppling av kontaktledning vid järnvägsanläggningar, följ Elsäkerhetsföreskrioerna TDOK 2015:0223.(m)',
        pricePerUnit: 100,
        quantity: 0),
    Product(
        title: 'BCB.41 Skyddsplank, skyddsinhägnad o d (m)',
        description: '',
        pricePerUnit: 210,
        quantity: 0),
    Product(
        title: 'BCB.412 Skyddsinhägnad av träd',
        description:
            'Träd som ska bevaras ska skyddas från skador. Träd ska skyddas med en stabil inhägnad som ger en frizon runt trädet.(st)',
        pricePerUnit: 1100,
        quantity: 0),
    Product(
        title: 'BCB.42 Avspärrning av markyta',
        description:
            'Avspärrning ska uböras så a1 markområde som ska bevaras tydligt markeras.(m)',
        pricePerUnit: 210,
        quantity: 0),
    Product(
        title: 'BCB.43 Inbrädning av träd, påkörningsskydd(st)',
        description: '',
        pricePerUnit: 1800,
        quantity: 0),
    Product(
        title: 'BCB.44 Skydd av markyta i träds och buskars rotzon(m2)',
        description: '',
        pricePerUnit: 200,
        quantity: 0),
    Product(
        title: 'BCB.52 Åtgärd i trädkrona(m2)',
        description: '',
        pricePerUnit: 1000,
        quantity: 0),
    Product(
        title: 'BCB.712 Tillfällig bro, gångbrygga, körbrygga o d(st)',
        description: '',
        pricePerUnit: 500,
        quantity: 0),
    Product(
        title: 'BCB.717 Tillfällig skyddsanordning, byggstängsel(m)',
        description: '',
        pricePerUnit: 210,
        quantity: 0),
    Product(
        title: 'BED.11 Rivning av Elledning(m)',
        description: '',
        pricePerUnit: 110,
        quantity: 0),
    Product(
        title: 'BED.11 RRivning avSjälvfallsledning(m)',
        description: '',
        pricePerUnit: 135,
        quantity: 0),
    Product(
        title: 'BED.11 Rivning av Fjärrvärmeledning(m)',
        description: '',
        pricePerUnit: 195,
        quantity: 0),
    Product(
        title: 'BED.11 Rivning av Gasledning(m)',
        description: '',
        pricePerUnit: 225,
        quantity: 0),
    Product(
        title:
            'BED.1111 Rivning av hel rörledning plast dimensioner 100-315mm(m)',
        description: '',
        pricePerUnit: 88,
        quantity: 0),
    Product(
        title:
            'BED.111 Rivning av rörledning plast betong dimensioner 225-500mm(m)',
        description: '',
        pricePerUnit: 275,
        quantity: 0),
    Product(
        title: 'BED.111 Rivning av rörledning plast järn dimensioner 90-300(m)',
        description: '',
        pricePerUnit: 95,
        quantity: 0),
    Product(
        title:
            'BED.14111 Rivning av bituminös brobeläggning med tätsikt tj 20-50mm (m2)',
        description: '',
        pricePerUnit: 127,
        quantity: 0),
    Product(
        title: 'BFD.1 Stubbrytning(st)',
        description: '',
        pricePerUnit: 600,
        quantity: 0),
    Product(
        title: 'BFD.11 Stubbrytning inom område för grundläggning(st)',
        description: '',
        pricePerUnit: 600,
        quantity: 0),
    Product(
        title: 'BFD.12 Stubbrytning inom område för väg, plan o d(st)',
        description: '',
        pricePerUnit: 600,
        quantity: 0),
    Product(
        title:
            'BFE.1 Borttagning av markvegetation och jordmån inom område för grundläggning och för järnväg max tjocklek 200m(m3)',
        description: '',
        pricePerUnit: 500,
        quantity: 0),
    Product(
        title:
            'BFE.2 Borttagning av markvegetation och jordmån inom område för väg, plan o d(m3)',
        description: '',
        pricePerUnit: 500,
        quantity: 0),
    Product(
        title:
            'BFE.3 Borttagning av markvegetation och jordmån inom område för sammansatt markyta och vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'BFF.3 Uppläggning och lagring av tillvaratagen markvegetation',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'BJB.1 Stomnät', description: '', pricePerUnit: 0, quantity: 0),
    Product(
        title: 'BJB.12 Stomnät i höjd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'BJB.122 Bruksnät i höjd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'BJB.1222 Nät i höjd för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'BJB.12221 Fixpunkt för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'BJB.2 Inmätning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
  ];

  final Map<Product, int> _selectedProducts = {};

  final List<String> _alphabetList = [
    'B',
  ];

  final Map<String, double> _scrollPositions = {
    'B': 0,
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
        title: const Text('Förarbeten'),
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
