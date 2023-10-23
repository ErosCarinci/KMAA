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

class markochoch extends StatefulWidget {
  const markochoch({Key? key}) : super(key: key);

  @override
  _markochochState createState() => _markochochState();
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

class _markochochState extends State<markochoch> {
  final List<Product> _availableProducts = [
    Product(
        title: 'CBB.1 Jordschakt för väg, plan o d samt',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title: 'CBB.11 Jordschakt för väg, plan o d',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title: 'CBB.111 Jordschakt kategori A för väg, plan o d',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title: 'CBB.112 Jordschakt kategori B för väg, plan o d',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
      title: 'CBB.113 Jordschakt kategori C för väg, plan o d samt',
      description: '',
      pricePerUnit: 470,
      quantity: 0,
    ),
    Product(
        title: 'CBB.12 Jordschakt för utskioning, utspetsning och',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title: 'CBB.121 Jordschakt kategori A för utskioning,',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title: 'CBB.122 Jordschakt kategori B för utskioning,',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title: 'CBB.13 Blockrensning i terrass för väg, plan o d 1-3 m3(st)',
        description: '',
        pricePerUnit: 700,
        quantity: 0),
    Product(
        title: 'CBB.13 Blockrensning i terrass för väg, plan o d 3-5 m3(st)',
        description: '',
        pricePerUnit: 2900,
        quantity: 0),
    Product(
        title: 'CBB.14 Jordschakt för vegetationsyta',
        description: '',
        pricePerUnit: 530,
        quantity: 0),
    Product(
        title:
            'CBB.15 Blockrensning i befintlig mark för väg, plan 1-3 m3 o d (st)',
        description: '',
        pricePerUnit: 530,
        quantity: 0),
    Product(
        title:
            'CBB.15 Blockrensning i befintlig mark för väg, plan 3-5 m3 o d (st)',
        description: '',
        pricePerUnit: 2900,
        quantity: 0),
    Product(
        title: 'CBB.2 Jordschakt för byggnad 1-3 m3 (st)',
        description: '',
        pricePerUnit: 530,
        quantity: 0),
    Product(
        title: 'CBB.2 Jordschakt för byggnad 3-5 m3 (st)',
        description: '',
        pricePerUnit: 2900,
        quantity: 0),
    Product(
        title: 'CBB.3 Jordschakt för ledning, kabel 1-3 m3 m m (st)',
        description: '',
        pricePerUnit: 450,
        quantity: 0),
    Product(
        title: 'CBB.3 Jordschakt för ledning, kabel 3-5 m3 m m (st)',
        description: '',
        pricePerUnit: 2900,
        quantity: 0),
    Product(
        title: 'CBB.31 Jordschakt för rörledning 1-3 m3 (st)',
        description: '',
        pricePerUnit: 450,
        quantity: 0),
    Product(
        title: 'CBB.31 Jordschakt för rörledning 3-5 m3 (st)',
        description: '',
        pricePerUnit: 2900,
        quantity: 0),
    Product(
        title: 'CBB.4 Jordschakt för spåranläggning 1-3 m3 (st)',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title: 'CBB.4 Jordschakt för spåranläggning 3-5 m3 (st)',
        description: '',
        pricePerUnit: 2900,
        quantity: 0),
    Product(
        title:
            'CBB.42 Jordschakt för utskioning och utspetsning för järnväg 1-3 m3 (st)',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title:
            'CBB.42 Jordschakt för utskioning och utspetsning för järnväg 3-5 m3 (st)',
        description: '',
        pricePerUnit: 2900,
        quantity: 0),
    Product(
        title: 'CBB.44 Jordschakt för järnväg, zonschakt 1-3 m3 (st)',
        description: '',
        pricePerUnit: 470,
        quantity: 0),
    Product(
        title: 'CBB.44 Jordschakt för järnväg, zonschakt 3-5 m3 (st)',
        description: '',
        pricePerUnit: 2900,
        quantity: 0),
    Product(
        title: 'CBB.45 Jordschakt för järnväg i befintligt spår',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.5 Jordschakt för bro, brygga, kaj, kassun o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.51 Jordschakt för grundläggning av bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.6 Jordschakt för dike, avfallsanläggning,',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.61 Jordschakt för dike',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.63 Jordschakt för magasin, infiltrationsbädd o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.7 Avtäckning av berg, urgrävning för väg,',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.71 Avtäckning av berg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.31 ska avtäckning komple1e-',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.712 Avtäckning av bergyta, befintlig sprängbo1en',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.72 Urgrävning av svag undergrund',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.74 Jordschakt i rör, trumma, brunn o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.8 Diverse jordschakt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBB.84 Förschakt för rivning och demontering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.1 Bergschakt för väg, plan o d samt vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.11 Bergschakt för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.111 Bergschakt kategori A för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.12 Bergschakt för vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.2 Bergschakt för byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.21 Bergschakt för grundläggning av byggnad på sprängbo1en',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.22 Bergschakt för grundläggning av byggnad på fast berg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CBC.222 Bergschakt för grundläggning av byggnad på fast berg, detaljschakt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.3 Bergschakt för ledning, kabel m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.31 Bergschakt för rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.4 Bergschakt för spåranläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.41 Bergschakt för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.5 Bergschakt för bro, brygga, kaj, kassun o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CBC.513 Bergschakt för grundläggning av bro med packad fyllning på fast berg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.52 Bergschakt för grundläggning av brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CBC.521 Bergschakt för grundläggning av brygga, kaj o d på sprängbo1en',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CBC.522 Bergschakt för grundläggning av brygga, kaj o d på fast berg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.54 Bergschakt för mur, trappa o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.541 Bergschakt för mur, trappa o d på sprängbo1en',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.542 Bergschakt för mur, trappa o d på fast berg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.56 Bergschakt för fundament',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CBC.561 Bergschakt för grundläggning av fundament på sprängbo1en',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.562 Bergschakt för grundläggning av fundament på fast berg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.6 Bergschakt för tunnel, bergrum o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.61 Bergschakt för tunnel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.611 Bergschakt för väg- och järnvägstunnel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.612 Bergschakt för va-tunnel, servicetunnel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBC.62 Bergschakt för bergrum',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBF.1 Borrning av tunnel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBF.11 Borrning av tunnel med tunnelborrmaskin (TBM)',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CBF.2 Borrning av borrhål i berg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.1 Slagning av pålar av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.11 Slagning av pålar av betong för byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.12 Slagning av pålar av betong för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.13 Slagning av pålar av betong för väg- och',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.2 Slagning av pålar av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.22 Slagning av pålar av stål för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.3 Slagning av pålar av trä',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.31 Slagning av pålar av trä för väg- ochjärnvägsbank',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCC.2 Tryckning av pålar av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CCC.21 Tryckning av pålar av stål för förstärkning av befintlig grundkonstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCC.3 Tryckning av pålar av trä',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCD.2 Borrning av pålar av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCD.21 Borrning av stålkärnepålar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCD.22 Borrning av stålrörspålar, borrpålar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.3 Slagning av pålar av trä',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCB.31 Slagning av pålar av trä för väg- och',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCC.2 Tryckning av pålar av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCC.21 Tryckning av pålar av stål för förstärkning av',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCC.3 Tryckning av pålar av trä',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCD.2 Borrning av pålar av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCD.21 Borrning av stålkärnepålar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCD.22 Borrning av stålrörspålar, borrpålar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCG.2 Vibrering av pålar av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CCG.3 Vibrering av pålar av trä',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.1 Jordförstärkning genom avva1ning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.11 Vertikaldränering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.2 Jordförstärkning genom stabilisering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.21 Injektering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.211 Jetinjektering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.23 Jordförstärkning med inblandningspelare',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.24 Jordförstärkning genom masstabilisering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.3 Jordförstärkning genom ytstabilisering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.4 Armering av jord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.41 Armering av jord med jordspikar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.5 Lastutbredning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.51 Lastutbredning med rustbädd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.511 Rustbädd för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.512 Rustbädd för ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.52 Lastutbredning med plåt e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.522 Lastutbredning med plåt för ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.6 Djuppackning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDB.61 Djuppackning genom vibrering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.1 Bergförankring med bult, linor och nät',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.11 Bergförankring med förspända bultar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.111 Bergförankring med förspända bultar, ingjutna',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.12 Bergförankring med förspända bultar, ingjutna',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.13 Bergförankring med förspända linor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.14 Bergförankring med ingjutna bultar utan förspänning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.15 Bergförankring med ingjutna linor utan',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.16 Bergförankring med friktionsbultar, firmabunden typ',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.1ti Bergförankring med skyddsnät',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.18 Bergförankring med diverse system',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDC.2 Provning av bergmassans och',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDD.1 Injektering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDD.11 Förinjektering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDD.111 Förinjektering med cementbaserat injekteringsmedel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CDD.112 Förinjektering med icke cementbaserat injekteringsmedel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDD.13 Kontaktinjektering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDD.14 Ridåinjektering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDD.2 Va1eninfiltration',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CDF.2 Rostskyddsmålad permanent spont',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.1 Fyllning för väg, plan o d samt vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.11 Fyllning för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.111 Fyllning med sprängsten för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.1111 Fyllning kategori A med sprängsten för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.11111 Fyllning kategori A med osorterad sprängsten för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.11112 Fyllning kategori A med sorterad sprängsten för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.11113 Fyllning kategori A med grovkrossad sprängsten för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.1112 Fyllning kategori B med sprängsten för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.1113 Fyllning kategori C med sprängsten för väg, plan o d samt sammansatt yta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.112 Fyllning med jord- och krossmaterial för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.1121 Fyllning kategori A med jord- och krossmaterial för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.11211 Fyllning kategori A med grovkornig jord och krossmaterial för väg, plan od',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.11212 Fyllning kategori A med bland- och finkornig krossmaterial jord för väg,plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.1122 Fyllning kategori B med jord- och krossmaterial för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.11221 Fyllning kategori B med grovkornig jord och krossmaterial för väg, plan od',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.11222 Fyllning kategori B med bland- och finkornig jord för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.1123 Fyllning kategori C med jord- och krossmaterial för väg, plan o d samtsammansatt yta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.113 Fyllning med sprängsten, grovkornig jord och krossmaterial efter schakt för utskioning, utspetsning och utjämning för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.1131 Fyllning kategori A efter schakt för utskioning, utspetsning och utjämning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.1132 Fyllning kategori B efter schakt för utskioning, utspetsning och utjämning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.1133 Fyllning kategori C efter schakt för utskioning, utspetsning och utjämning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.114 Fyllning med restprodukter för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.115 Fyllning med återvunna material för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.12 Fyllning för vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.121 Fyllning med sprängsten för vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.122 Fyllning med jordmaterial för vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.2 Fyllning för byggnad, golv o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.21 Fyllning för grundläggning av byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.211 Fyllning med sprängsten för grundläggning av byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.212 Fyllning med krossmaterial för grundläggning av byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.213 Fyllning med krossad sprängsten för grundläggning av byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.214 Fyllning med bland- eller finkornig jord för grundläggning av byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.215 Fyllning med grovkornig jord för grundläggning av byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.22 Fyllning under fribärande golv',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.3 Fyllning för spåranläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.31 Fyllning med sprängsten för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.32 Fyllning med jord- och krossmaterial för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.321 Fyllning med grov- och blandkornig jord och krossmaterial för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.322 Fyllning med bland- och finkornig jord för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.33 Fyllning med jord- och krossmaterial för breddning av befintlig järnvägsbank',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.34 Fyllning med grovkornig jord och krossmaterial efter schakt för utskioning ochutspetsning för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.4 Fyllning för grundläggning av bro, mur, brygga, kaj, kassun m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.41 Fyllning för grundläggning av bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.411 Fyllning med sprängsten för grundläggning av',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.412 Fyllning med sorterad sprängsten för grundläggning av bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.413 Fyllning med krossad sprängsten för grundläggning av bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.415 Fyllning med förstärkningslagermaterial för',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.42 Fyllning för grundläggning av mur, trappa m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.421 Fyllning med sprängsten för grundläggning av mur, trappa m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.422 Fyllning med grus eller krossmaterial av grus för grundläggning av mur, trappa m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.423 Fyllning med krossad sprängsten för grundläggning av mur, trappa m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.46 Fyllning för fundament för kontaktledningsstolpe e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.5 Fyllning mot byggnad, bro, mur o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.51 Fyllning mot byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.52 Fyllning mot bro, mur o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.524 Fyllning med grovkrossad sprängsten mot bro, mur o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.525 Fyllning med förstärkningslagermaterial mot bro, mur o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.526 Fyllning med bärlagermaterial mot bro, mur o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.53 Fyllning mot fundament',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.6 Fyllning på pålar och påldäck för väg, plan, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.61 Fyllning på pålar för väg, plan, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.611 Fyllning för lasbördelande lager på pålar för väg, plan, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.6111 Fyllning för lasbördelande lager av grus på pålar för väg, plan, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.6112 Fyllning för lasbördelande lager av krossmaterial på pålar för väg, plan, järnväg, o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.612 Fyllning för bankfyllning på pålar för väg, plan,järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.6121 Fyllning för bankfyllning av grovkornig jord eller krossmaterial på pålar för väg, plan, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.6122 Fyllning för bankfyllning av sprängsten på pålar för väg, plan järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.11112 eller CEB',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.62 Fyllning på påldäck för väg, plan, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.7 Fyllning efter urgrävning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.71 Fyllning efter urgrävning för väg, plan, byggnad, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEB.72 Fyllning genom nedpressning för väg, plan, byggnad, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.4 Fyllning för tryckbank för väg, plan, järnväg o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.8 Diverse fyllning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEB.82 Fyllning som stödfyllning mot lä1a material',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEC.1 Fyllning för förstärkning av ledningsbädd, utspetning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.11 Fyllning för förstärkning av ledningsbädd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.12 Fyllning för utspetsning för ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.13 Fyllning efter urgrävning till viss nivå för ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEC.14 Fyllning för tjälskydd av trumma med tjock trumbädd under ledningsbädd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEC.15 Fyllning under och kring isolering i isolerad trumbädd, under ledningsbädd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.2 Fyllning för ledningsbädd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.21 Ledningsbädd för rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.211 Ledningsbädd för va-ledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.2111 Ledningsbädd för va-ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.2112 Ledningsbädd för dränledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.2113 Ledningsbädd för gasledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEC.2114 Ledningsbädd för ledning i väg, plan o d kategori A samt järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.212 Ledningsbädd för trumma',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.213 Ledningsbädd för värmeledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.22 Ledningsbädd för el- och telekabel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.3 Kringfyllning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.31 Kringfyllning för rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.311 Kringfyllning för va-ledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.3111 Kringfyllning för va-ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.3112 Kringfyllning för dränledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.3113 Kringfyllning för gasledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEC.3114 Kringfyllning för ledning i väg, plan o d kategori A samt järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.312 Kringfyllning för trumma',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.313 Kringfyllning för värmeledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.3131 Kringfyllning för värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.32 Kringfyllning för el- och telekabel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEC.33 Kringfyllning för avstängningsanordning, nedstigningsbrunn m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.34 Kringfyllning för perkolationsbrunn',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.4 Resterande fyllning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.41 Resterande fyllning för rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.411 Resterande fyllning för va-ledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.4111 Resterande fyllning för va-ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.4112 Resterande fyllning för dränledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.4113 Resterande fyllning för gasledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEC.4114 Resterande fyllning för ledning i väg, plan o d kategori A samt järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.412 Resterande fyllning för trumma',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.413 Resterande fyllning för värmeledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.42 Resterande fyllning för el- och telekabel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.5 Fyllning för ledningsbank',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.51 Fyllning för ledningsbank, packning till färdig överyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEC.52 Fyllning för ledningsbank, utan packning till färdig överyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.6 Fyllning för dike, magasin, infiltrationsbädd m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.61 Fyllning för perkolationsmagasin m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.63 Fyllning för dike',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.7 Strömningsavskärande fyllning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.71 Strömningsavskärande fyllning med tätjord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.72 Strömningsavskärande fyllning med bentonitblandad sand',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CED.1 Fyllning för väg, plan o d, byggnad, bro, järnväg samt vegetationsyta m m med lätta material',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.11 Fyllning med lä1klinker för väg, plan o d,',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.111 Fyllning med lä1klinker för väg, plan o d samt järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.112 Fyllning med lä1klinker för byggnad, bro, mur m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.1122 Fyllning med lä1klinker mot byggnad, bro, mur m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.113 Fyllning med lä1klinker för vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.114 Fyllning med lä1klinker i ledningsgrav',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CED.12 Fyllning med skumbetong för väg, plan o d, byggnad, bro, järnväg samt vegetationsyta m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CED.13 Fyllning med skumglas för väg, plan o d, byggnad, bro, järnväg samt vegetationsyta m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.131 Fyllning med skumglas för väg, plan o d samt järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.132 Fyllning med skumglas för byggnad, bro, mur m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CED.1322 Fyllning med skumglas mot byggnad, bro, mur m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEE.1 Tätning och avjämning av bergterrass för väg, byggnad, järnväg, bro m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEE.11 Tätning och avjämning av bergterrass för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEE.111 Tätning och avjämning kategori A av bergterrass för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEE.1112 Tätning och avjämning kategori A av bergterrass för väg, plan o d med krav på lagertjocklek',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEE.112 Tätning och avjämning kategori B och C av bergterrass för väg, plan o d samt sammansatt yta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEE.12 Tätning och avjämning av bergterrass för byggnad, mur, järnväg, bro m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEE.121 Tätning och avjämning av bergterrass för byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEE.122 Tätning och avjämning av bergterrass för mur, trappa, fundament m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEE.123 Tätning och avjämning av bergterrass för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEE.124 Tätning och avjämning av bergterrass för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEE.125 Tätning och avjämning av bergterrass I ledningsgrav',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEE.3 Tätning och avjämning av jordterrass',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.1 Dränerande lager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.11 Dränerande lager för väg, plan o d samt vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.111 Dränerande lager av sand, grus eller krossmaterial för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.1111 Dränerande lager av sand, grus eller krossmaterial under underbyggnad för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.1112 Dränerande lager av sand, grus eller krossmaterial i underbyggnad för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.112 Dränerande lager av grus eller krossmaterial för vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.12 Dränerande lager för byggnad, bro, mur m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.121 Dränerande lager av grus eller krossmaterial för byggnad, bro, mur m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.1211 Dränerande lager av grus eller krossmaterial under fyllning för byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.1213 Dränerande lager av grus och krossmaterial under byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.1214 Dränerande lager av grus och krossmaterial mot byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.121ti Dränerande lager av grus eller krossmaterial för terrängmur, terrängtrappa o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.122 Dränerande lager av lä1klinker för byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.1221 Dränerande lager av lä1klinker under byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.13 Dränerande lager på byggnadskonstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.131 Dränerande lager av singel eller makadam på byggnadskonstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.132 Dränerande lager av cementbunden makadam på byggnadskonstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.14 Dränerande lager för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.141 Dränerande lager av grus eller krossmaterial under underbyggnad för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.142 Dränerande lager av grus eller krossmaterial i krossmaterial under underbyggnad för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.15 Dränerande lager för avfallsanläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.16 Dränerande lager för vertikaldränering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.2 Dränerande och kapillärbrytande lager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEF.21 Dränerande och kapillärbrytande lager för byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.211 Dränerande och kapillärbrytande lager av singel eller makadam för byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.2111 Dränerande och kapillärbrytande lager av singel eller makadam under byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEF.2112 Dränerande och kapillärbrytande lager av singel eller makadam mot byggnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.1 Materialskiljande lager under fyllning för väg, byggnad, bro, järnväg m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.11 Materialskiljande lager under fyllning för väg, plan o d samt järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.111 Materialskiljande lager kategori A under fyllning för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.12 Materialskiljande lager under fyllning för byggnad, bro o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEG.122 Materialskiljande lager under fyllning för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.2 Materialskiljande lager under eller kring fyllning för ledningsbädd, dränering o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.3 Materialskiljande lager under överbyggnad för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.31 Materialskiljande lager kategori A under överbyggnad för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.311 Materialskiljande lager kategori A under överbyggnad, på terrass av materialtyp 4',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.312 Materialskiljande lager kategori A under överbyggnad, på terrass av materialtyp 5',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.32 Materialskiljande lager kategori B och C under överbyggnad för väg, plan o d samt sammansatt yta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.321 Materialskiljande lager kategori B och C under överbyggnad, på terrass av materialtyp 4',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'CEG.322 Materialskiljande lager kategori B och C under överbyggnad, på terrass av materialtyp 5',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CFC.3 Avlämnande av avfall till avfallsanläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CFC.4 Avlämnande av massor på upplag',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CLB.2 Tätande lager av bentonitblandad sand',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.3 Materialskiljande lager av geosyntet',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.31 Materialskiljande lager av geotextil',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.311 Materialskiljande lager av geotextil under fyllning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.3111 Materialskiljande lager av geotextil under fyllning för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.3112 Materialskiljande lager av geotextil under fyllning för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.3113 Materialskiljande lager av geotextil under fyllning för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.312 Materialskiljande lager av geotextil i ledningsgrav, för perkolationsmagasin m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.3121 Materialskiljande lager av geotextil I ledningsgrav',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.31212 Materialskiljande lager av geotextil under ledningsbädd i ledningsgrav i jord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.31213 Materialskiljande lager av geotextil kring ledningsbädd och kringfyllning i ledningsgrav i jord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.31214 Materialskiljande lager av geotextil på ledningsbädd i jord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.31215 Materialskiljande lager av geotextil under och kring fyllning för isolering med isolerskiva',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.31216 Materialskiljande lager av geotextil i ledningsgrav i sprängstensfyllning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.3121ti Materialskiljande lager av geotextil i ledningsgrav i berg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.3122 Materialskiljande lager av geotextil kring perkolationsbrunn, perkolationsmagasin o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.31223 Materialskiljande lager av geotextil kring perkolationsmagasin',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBB.31224 Materialskiljande lager av geotextil kring dränerande fyllning för dränledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'CEC.2112 och runt kringfyll-',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.4 Armerande lager av geosyntet',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.41 Armerande lager av geonät',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.412 Armerande lager av geonät i fyllning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.4121 Armerande lager av geonät över bankpålning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.42 Armerande lager av geotextil',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.422 Armerande lager av geotextil i fyllning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.4221 Armerande lager av geotextil över bankpålning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBB.5 Tätande lager av geosyntet',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBG.1 Termoisolerande lager av skivor av cellplast',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.11 Termoisolerande lager av skivor av cellplast för väg, ledning, bro m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBG.111 Termisk isolering med isolerskivor av väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.112 Termisk isolering med isolerskivor av rörledning och trumma i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.1121 Termisk isolering med isolerskivor av rörledning i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.11211 Horisontal termisk isolering med isolerskivor av rörledning i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.11212 Hästskoformad termisk isolering med isolerskivor av rörledning i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.11213 Lådformad termisk isolering med isolerskivor av rörledning i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBG.1122 Termisk isolering med isolerskivor av trumma',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBG.11222 Termisk isolering med isolerskivor över trumma',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBG.113 Termisk isolering med isolerskivor av bro, stödmur m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.1132 Termisk isolering med isolerskivor av grundläggningsyta under bro, stödmur, terrängtrappa m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBG.12 Termisk isolering med isolerskivor för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.13 Termoisolerande lager av skivor av cellplast för tunnel och bergrum',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DBG.3 Lastreducerande lager av skivor eller block av cellplast',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.31 Lastreducerande lager av skivor eller block av cellplast för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DBG.35 Lastreducerande lager av skivor eller block av cellplast för rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.1 Undre förstärkningslager för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.11 Undre förstärkningslager kategori A',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.12 Undre förstärkningslager kategori B',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.2 Förstärkningslager för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.21 Förstärkningslager till överbyggnad med flexibel konstruktion och medbitumenbundet slitlager, betongmarkpla1or m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.211 Förstärkningslager kategori A till överbyggnad med flexibel konstruktion och med bitumenbundet slitlager, betongmarkpla1or m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.212 Förstärkningslager kategori B till överbyggnad med flexibel konstruktion och med bitumenbundet slitlager, betongmarkpla1or m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.213 Förstärkningslager kategori C till överbyggnad med flexibel konstruktion och med bitumenbundet slitlager, betongmarkpla1or m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.22 Förstärkningslager till överbyggnad med styv konstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.221 Förstärkningslager kategori A till överbyggnad med styv konstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.222 Förstärkningslager kategori B till överbyggnad med styv konstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.23 Förstärkningslager till överbyggnad med flexibel konstruktion och med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.231 Förstärkningslager kategori A till överbyggnad med flexibel konstruktion ochmed obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.232 Förstärkningslager kategori B till överbyggnad med flexibel konstruktion och med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.233 Förstärkningslager kategori C till överbyggnad med flexibel konstruktion och med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.25 Förstärkningslager över termisk isolering med isolerskivor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.3 Obundet bärlager för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.31 Obundet bärlager till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.311 Obundet bärlager kategori A till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.312 Obundet bärlager kategori B till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.313 Obundet bärlager kategori C till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.32 Obundet bärlager till ytor med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.321 Obundet bärlager kategori A till ytor med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.322 Obundet bärlager kategori B till ytor med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.323 Obundet bärlager kategori C till ytor med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.4 Slitlager av grus, stenmjöl m m för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.41 Slitlager av grus',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.411 Slitlager av grus kategori A',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.412 Slitlager av grus kategori B och C',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.42 Slitlager av stenmjöl',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.48 Slitlager av diverse material',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.482 Slitlager av bark, träspån o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.5 Justeringslager av obundet material för väg,',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.51 Justeringslager av undre förstärkningslagermaterial',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.511 Justeringslager av undre förstärkningslagermaterial kategori A',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.512 Justeringslager av undre förstärkningslagermaterial kategori B',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.52 Justeringslager av förstärkningslagermaterial till överbyggnad med flexibel konstruktion och med bitumenbundet slitlager, betongmarkpla1or m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.521 Justeringslager av förstärkningslagermaterial kategori A till överbyggnad med flexibel konstruktion och med bitumenbundet slitlager, betongmarkpla1or m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.522 Justeringslager av förstärkningslagermaterial kategori B till överbyggnad med flexibel konstruktion och med bitumenbundet slitlager, betongmarkpla1or m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.53 Justeringslager av förstärkningslagermaterial till överbyggnad med styv konstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.531 Justeringslager av förstärkningslagermaterial kategori A till överbyggnad med styv konstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.532 Justeringslager av förstärkningslagermaterial kategori B till överbyggnad med styv konstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.54 Justeringslager av förstärkningslagermaterial till överbyggnad med flexibel konstruktion och med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.541 Justeringslager av förstärkningslagermaterial kategori A till överbyggnad med flexibel konstruktion och med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.542 Justeringslager av förstärkningslagermaterial kategori B till överbyggnad med flexibel konstruktion och med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.55 Justeringslager av obundet bärlagermaterial till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.551 Justeringslager av obundet bärlagermaterial kategori A till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.552 Justeringslager av obundet bärlagermaterial kategori B till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.56 Justeringslager av obundet bärlagermaterial till ytor med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.561 Justeringslager av obundet bärlagermaterial kategori A till ytor med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.562 Justeringslager av obundet bärlagermaterial kategori B till ytor med obundet slitlager',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.5ti Justeringslager av slitlagermaterial av grus',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.5ti1 Justeringslager av slitlagermaterial av grus kategori A',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.5ti2 Justeringslager av slitlagermaterial av grus kategori B och C',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.58 Justeringslager av slitlagermaterial av stenmjöl',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.582 Justeringslager av slitlagermaterial av stenmjöl kategori B och C',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.6 Stödremsa för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.61 Stödremsa av obundet bärlagermaterial till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.611 Stödremsa av obundet bärlagermaterial kategori A till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.62 Stödremsa av obundet slitlagermaterial till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCB.621 Stödremsa av obundet slitlagermaterial kategori A till belagda ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.ti Inblandade obundna överbyggnadslager för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCB.ti1 Infrästa obundna överbyggnadslager för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCC.1 Bitumenbundna överbyggnadslager kategori A för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCC.2 Bitumenbundna överbyggnadslager kategori B för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCC.3 Bitumenbundna överbyggnadslager kategori C för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCC.-ti Stabilisering',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCC.-ti1 Stabilisering med skumbitumeng',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCC.-ti2 Stabilisering med bitumenemulsion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCC.-ti3 Stabilisering med remixing',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCD.1 Försegling med bitumenemulsion eller bitumenlösning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCD.2 Försegling med emulsionsslam',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.1 Cementbundna överbyggnadslager för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.11 Bärlager av cementbundet grus',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.12 Slitlager av cementbetong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.121 Slitlager av cementbetong för väg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.122 Slitlager av cementbetong för plan',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.13 Slitlager av vältbetong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.2 Fogar och anslutningskonstruktioner för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.21 Fogar', description: '', pricePerUnit: 0, quantity: 0),
    Product(
        title: 'DCE.211 Sammanhållningsfog, längsgående fog',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.212 Kontraktionsfog, tvärgående fog',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.213 Expansionsfog',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.212 Kontraktionsfog, tvärgående fog',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCE.214 Vägrensfog',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.1 Bitumenbundet skyddslager på tätskikt för bro, brygga, kaj, tunnel, kammare o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.11 Skyddslager på tätskikt av asfaltmastix för bro, brygga, kaj, tunnel, kammare o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.111 Skyddslager på tätskikt av asfaltmastix på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.12 Skyddslager på tätskikt av tätskiktsma1a för bro, brygga, kaj, tunnel, kammare o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.121 Skyddslager på tätskikt av tätskiktsma1a på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.2 Bitumenbundet bind- och slitlager på bro, brygga, kaj, tunnel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.21 Bind- och slitlager av asfaltbetong på bro, brygga, kaj, tunnel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.211 Bind- och slitlager av asfaltbetong på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.2111 Bindlager av asfaltbetong på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.21111 Bindlager av asfaltbetong på brobanepla1a av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.2112 Slitlager av asfaltbetong på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.21122 Slitlager av asfaltbetong på brobanepla1a av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.22 Bind- och slitlager av gjutasfalt för bro, brygga, kaj, tunnel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.221 Bind- och slitlager av gjutasfalt på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.2211 Bind- och slitlager av gjutasfalt på brobanepla1a av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.22111 Bindlager av gjutasfalt på brobanepla1a av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.22112 Slitlager av gjutasfalt på brobanepla1a av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.2212 Bind- och slitlager av gjutasfalt på brobanepla1a av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.22121 Bindlager av gjutasfalt på brobanepla1a av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.22122 Slitlager av gjutasfalt på brobanepla1a av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.2213 Slitlager av gjutasfalt på brobanepla1a av aluminium',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.2214 Slitlager av gjutasfalt på brobanepla1a av trä',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.3 Cementbundet slitlager på bro, brygga, kaj, tunnel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.31 Cementbundet slitlager på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.311 Slitlager av betong på tätskikt på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.312 Direktgjutet slitlager av betong på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.3122 Direktgjutet slitlager av betong på bro vid förbättring eller reparation',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.4 Slitlager av akrylat på bro, brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.41 Slitlager av akrylat på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.411 Slitlager av akrylat på brobanepla1a av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.412 Slitlager av akrylat på brobanepla1a av aluminium',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.6 Fog med fogmassa',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCF.ti Obundna överbyggnadslager för bro, brygga, kaj, tunnel o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.ti1 Obundna överbyggnadslager på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCF.ti11 Obundna skyddslager på tätskikt på bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.1 Beläggning av gatsten, naturstenspla1or o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.11 Beläggning av gatsten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.111 Beläggning av smågatsten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.112 Beläggning av storgatsten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.113 Beläggning av storgatsten med gräsfog',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.12 Beläggning av naturstenspla1or',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.13 Beläggning av kullersten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.2 Beläggning av betongmarkpla1or, betongmarksten o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.21 Beläggning av betongmarkpla1or',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.22 Beläggning av betongmarksten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.23 Beläggning av gräsarmeringspla1or av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.3 Beläggning av marktegel och trä',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.32 Beläggning av marktegel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.33 Beläggning av trä m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCG.331 Beläggning av träkubb',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCH.1 Underballastlager för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCH.15 Underballastlager för förstärkning av järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCH.16 Underballastlager för frostisolering av järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCH.2 Lager av krossad sprängsten på underballastlager av sprängsten för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCH.3 Ballastlager för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCH.31 Ballastlager av makadam',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCH.32 Ballastlager av grus',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCH.33 Komple1ering av ballastlager av makadam i befintligt spår',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCH.34 Komple1ering av finmakadam i växlingsgator',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCJ.1 Sandyta av strid sand',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCJ.11 Strid sand för stötdämpande ytor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCJ.12 Strid sand för idrottsytor o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCJ.2 Sandyta av formbar leksand',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.1 Släntbeklädnader',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.11 Släntbeklädnad av gatsten, naturstenspla1or o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.12 Släntbeklädnad av betongmarkpla1or, betongmarksten o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.13 Släntbeklädnad av marktegel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.15 Släntbeklädnad av jord- och krossmaterial',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCK.16 Släntbeklädnad av material från tillvaratagen markvegetation och jordmån',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.2 Erosionsskydd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.22 Erosionsskydd av betongmadrasser',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.23 Erosionsskydd av växter',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.25 Erosionsskydd av jord- och krossmaterial',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.251 Erosionsskydd av jord- och krossmaterial på jordslänt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.2511 Erosionsskydd av grovkornigt material på jordslänt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCK.2518 Erosionsskydd av diverse jord- och krossmaterial på jordslänt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCK.252 Erosionsskydd av jord- och krossmaterial i vatten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCK.26 Erosionsskydd av tillvaratagen markvegetation och jordmån',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.1 Växtbädd', description: '', pricePerUnit: 0, quantity: 0),
    Product(
        title: 'DCL.11 Växtbädd typ 1 och 2, påförd jord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.111 Växtbädd typ 1',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.12 Växtbädd typ 3 och 4, befintlig jord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.13 Växtbädd typ skele1jord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.131 Växtbädd typ skele1jord, nedspolning av jordmaterial',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DCL.132 Växtbädd typ skele1jord, utläggning av färdigblandad jord',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.14 Speciella växtbäddar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.141 Växtbädd på bjälklag',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.2 Förberedelser för sådd, plantering m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.21 Jordförbättring av växtbädd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.22 Kalkning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.23 Gödsling',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCL.25 Avjämning m m av växtbädd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.1 Sådd, torvläggning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.11 Sådd', description: '', pricePerUnit: 0, quantity: 0),
    Product(
        title: 'DDB.111 Sådd av gräs',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.12 Torvläggning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.121 Torvläggning med odlad grästorv',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.122 Torvläggning med tillvaratagen markvegetation',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DDB.123 Torvläggning med ma1a av odlad moss-, sedum-, ört- och gräsvegetation',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.2 Plantering av plantskoleväxter m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.21 Plantering av buskar m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.211 Plantering av rosor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.216 Plantering av klä1erväxter',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.22 Plantering av träd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDB.5 Påförande av tillvarataget markskikt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDC.1 Stöd för växter',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDC.11 Stöd för stamträd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDC.2 Skydd för växter',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDC.24 Skydd av vegetationsyta mot u1orkning, ogräs m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDD.1 Färdigställandeskötsel av träd, buskar m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDD.11 Luckring, mekanisk ogräsbekämpning kring',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDD.14 Va1ning av träd, buskar m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDD.15 Bekämpning av skadegörare och sjukdomar på',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDD.2 Färdigställandeskötsel av gräsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDD.24 Va1ning av gräsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DDD.25 Kanthuggning av gräsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.1 Kantstöd av granit',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.11 Kantstöd av granit, sa1a i grus med motstöd av grus',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DEC.12 Kantstöd av granit, sa1a i grus med motstöd avasfaltmassa',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.13 Kantstöd av granit, sa1a i grus med motstöd avbetong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.14 Kantstöd av granit, sa1a i betong med motstöd av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.2 Kantstöd av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.21 Kantstöd av betong, sa1a i grus med motstöd av grus',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DEC.22 Kantstöd av betong, sa1a i grus med motstöd av asfaltmassa',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.23 Kantstöd av betong, sa1a i grus med motstöd av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.24 Kantstöd av betong, sa1a i betong med motstöd av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.25 Kantstöd av betong, limmade',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.26 Kantstöd av betong, spikade',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.3 Kantstöd av trä',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEC.32 Kantstöd av trä för lek- och idrottsanläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DED.1 Ränndalar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DED.11 Ränndal av gatsten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DED.111 Ränndal av smågatsten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DED.112 Ränndal av storgatsten',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DED.12 Ränndal av betongmarkpla1or',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.1 Väg- och ytmarkeringar med markeringsmassa',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.11 Extruderad markeringsmassa',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.111 Extruderad markeringsmassa på trafikyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.12 Sprejad markeringsmassa',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.121 Sprejad markeringsmassa på trafikyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.2 Väg- och ytmarkeringar med färg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.21 Målning på trafikyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.3 Väg- och ytmarkeringar med vägbanereflektorer',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.4 Väg- och ytmarkeringar med tejp',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.5 Reflektorer på räcken, stolpar e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEE.6 Frästa räfflor',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DCD.1 Försegling av',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DEF.0 Förtillverkade enheter sammansatta av fundament, stolpe, skylt e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DEF.01 Förtillverkade enheter bestående av fundament,stolpe och skylt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.1 Anordningar för vägmärken, gatunamnskyltar m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.10 Fundament och stolpe för vägmärke, gatunamnskylt m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.11 Fundament för stolpe för vägmärke, gatunamnskylt m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.12 Stolpe för vägmärke, gatunamnskylt m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.123 Stolpe och överliggare för vägmärkesportal',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.13 Skylt för vägmärke, gatunamn m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.14 Skylt eller tavla för spåranläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.2 Anordningar för skyltar för röranläggning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.23 Skylt för röranläggning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.231 Skylt för va-anläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.2311 Skylt för brunn, avstängningsanordning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.2312 Skylt för brandpostanordning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.234 Skylt för gasanläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.3 Fundament för elstolpe m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEF.32 Fundament för kontaktledningsstolpe e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.1 Räcken för väg, plan o d samt bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.11 Räcken för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.111 Sidoräcken',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.112 Mi1räcken',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.113 Räckesavslutningar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.1131 Energiupptagande räckesavslutningar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.1132 Ej energiupptagande räckesavslutningar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.115 Räckesförankringar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.116 Krockdämpare',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.118 Diverse räcken för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.12 Räcken för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'EBE.1 eller igjutningsbruk enligt EBE',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.12133 Stänkskydd till räcken på vägbro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.122 Räcken för järnvägsbroar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DEG.111 Förtillverkade fundament för räcke för väg, plan o d samt bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.1111 Förtillverkade fundament för räcke för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.1112 Förtillverkade fundament av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.1112 Förtillverkade fundament för räcke för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.31 Viltstängsel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.4 Parkeringsräcken för fordon',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEG.41 Parkeringsräcken av plankor och stolpar för fordon',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEH.1 Kantstolpar för väg och plan',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEH.11 Kantstolpar, markförankrade',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEH.12 Kantstolpar, monterade på konstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEN.1 Skydd för kablar i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEN.11 Kabelskydd av plastprofiler',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEN.12 Kabelskydd av plaströr, plastrännor o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEN.13 Kabelskydd av tegelstenar eller betongpla1or',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DEN.14 Kabelskydd av bräder',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DEN.15 Kabelskydd av rör, rännor, hålblock o d av betong eller tegel',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'DEQ.1 Tak- och väggdränering i tunnel, bergrum och övrig bergschakt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.1 Återställande av väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.2 Återställande av överbyggnad för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.3 Återställande av vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.31 Återställande av planteringsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.32 Återställande av gräsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.33 Återställande av naturmarksyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.4 Återställande av släntbeklädnad, sandyta o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.41 Återställande av släntbeklädnad',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.42 Återställande av sandyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.5 Återställande av terrängtrappor, murar m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.6 Återställande av anläggningskomple1eringar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.61 Återställande av kantstöd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.62 Återställande av ränndalar av gatsten,',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.63 Återställande av väg- och ytmarkeringar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DGB.64 Återställande av fundament, stolpar, skyltar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DHB.1 Skötsel av markbeläggningar m m under garantitiden',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DHB.3 Skötsel av vegetationsytor m m under garantitiden',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DHB.31 Skötsel av träd, buskar m m under garantitiden',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DHB.312 Skötsel av träd under garantitiden',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DHB.313 Skötsel av buskar m m under garantitiden',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DHB.314 Skötsel av häck under garantitiden',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DHB.316 Skötsel av klä1erväxter under garantitiden',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'DHB.32 Skötsel av gräsyta under garantitiden',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.1 Ledning av gjutjärnsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.11 Ledning av gråjärnsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.112 Ledning av gråjärnsrör, avloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.1121 Ledning av gråjärnsrör, mufflösa avloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.12 Ledning av segjärnsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.121 Ledning av segjärnsrör, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.1211 Ledning av ytbehandlade segjärnsrör, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.122 Ledning av segjärnsrör, avloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.2 Ledning av stålrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.21 Ledning av stålrör av olegerat stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.211 Ledning av gängade stålrör av handelskvalitet',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.2111 Ledning av skyddsmålade stålrör med medelgodstjocklek',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.2112 Ledning av förzinkade stålrör med medelgodstjocklek',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.2113 Ledning av skyddsmålade stålrör med stor godstjocklek',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.212 Ledning av ståltuber av handelskvalitet',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.2122 Ledning av ytbehandlade ståltuber',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.213 Ledning av rör av olegerat tryckkärlsstål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PB-.2131 Ledning av icke fabriksisolerade rör av olegerat tryckkärlsstål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PB-.2132 Ledning av fabriksisolerade rör av olegerat tryckkärlsstål med mantelrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.2111 Trumma av rör av vågprofilerad, förzinkad stålplåt',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.22 Ledning av rör av legerat stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.221 Ledning av rör av rosbri1 stål, ej tryckkärlsstål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.3 Ledning av kopparrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.31 Ledning av raka kopparrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.313 Ledning av raka kopparrör, isolerade och med',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.4 Ledning av betongrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.41 Ledning av betongrör, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.411 Ledning av betongrör, högtrycksrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.412 Ledning av betongrör, lågtrycksrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.42 Ledning av betongrör, avloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.421 Ledning av betongrör, normalavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.422 Ledning av betongrör, genomtryckningsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.423 Ledning av betongrör, dränrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.43 Trumma av rör av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5 Ledning av plaströr',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.51 Ledning av plaströr, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.511 Ledning av PVC-rör, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5111 Ledning av PVC-rör, standardiserade tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.512 Ledning av PE-rör, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5121 Ledning av PE-rör, standardiserade tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.513 Ledning av GRP-rör, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5131 Ledning av GRP-rör, standardiserade tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.514 Ledning av PEX-rör, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5143 Ledning av isolerade PEX-rör med mantelrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.52 Ledning av plaströr, avloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.521 Ledning av plaströr, markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5211 Ledning av PVC-rör, standardiserade markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5212 Ledning av PVC-rör, fabrikatspecifika markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5213 Ledning av PE-rör, standardiserade markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5214 Ledning av PE-rör, fabrikatspecifika markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5215 Ledning av PP-rör, standardiserade markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.5216 Ledning av PP-rör, fabrikatspecifika markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.52111 Ledning av GRP-rör, markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.521111 Ledning av GRP-rör, standardiserade markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PB-.521112 Ledning av GRP-rör, fabrikatspecifika markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PB-.5218 Ledning av rör av modifierade plastmaterial, markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.53 Ledning av plaströr, dränrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.531 Ledning av plaströr, standardiserade dränrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.55 Trumma av plaströr',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.551 Trumma av plaströr, standardiserade markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.552 Trumma av plaströr, fabrikatspecifika markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.553 Trumma av plaströr, övriga markavloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.8 Ledning av rör av diverse material',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.81 Ledning av trärör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.811 Ledning av trärör, tryckrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.812 Ledning av trärör, avloppsrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PB-.83 Ledning av polymerbetongrör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCB.1 Anslutningar av va-ledningar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCB.11 Axiell anslutning av va-ledningar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCB.112 Axiell anslutning av självfallsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCB.12 Anslutning med anborrning, grenrör e d av va-ledningar',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PCB.123 Anslutning med uppfräsning, anslutningsfoder e d av självfallsledning inifrån ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCB.13 Anslutning av va-ledning till brunn, kammare e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PCB.131 Anslutning av självfallsledning till brunn, kammare e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCB.132 Anslutning av tryckledning till brunn, kammare e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCB.4 Anslutning av värmeledningar, kylledningar e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCD.1 Korrosionsskyddsbehandling av markförlagd rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PCD.2 Korrosionsskyddsbehandling av rörfogar m m på markförlagd rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCD.21 Korrosionsskyddsbehandling av fogar, utvändigt skydd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PCD.211 Korrosionsskyddsbehandling av fogar, utvändigt skydd med bitumenbinda',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PCD.212 Korrosionsskyddsbehandling av fogar, utvändigt skydd med krympslang, krympfilm eller tejp',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCD.22 Korrosionsskyddsbehandling av fogar, invändigt skydd',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PCD.222 Korrosionsskyddsbehandling av fogar, invändigt skydd med cementbruk',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCD.23 Korrosionsskyddsbehandling av påsvetsade rördetaljer',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCD.3 Reparation av utvändigt korrosionsskydd på rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PCD.32 Reparation av utvändigt korrosionsskydd med bitumenbinda',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PCD.33 Reparation av utvändigt korrosionsskydd med krympslang, krympfilm ellertejp',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCD.4 Reparation av korrosionsskydd för armatur och tillbehör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCD.5 Reparation av invändigt korrosionsskydd på rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCD.52 Reparation av invändigt korrosionsskydd med cementbruk',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCE.1 Inre inspektion av ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCE.11 Inre inspektion av tryckledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCE.12 Inre inspektion av självfallsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCE.2 Y1re inspektion av ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCE.21 Y1re inspektion av ledning i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.1 Rengöring av tryckledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.11 Rengöring av va-ledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.111 Rengöring av vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.1111 Spolning och desinfektion av vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.1112 Mekanisk rengöring av vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.11121 Rengöring av vattenledning med rensplugg e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.1113 Rengöring av vattenledning genom spolning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.112 Rengöring av tryckavloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.1121 Rengöring av tryckavloppsledning genom spolning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.1122 Mekanisk rengöring av tryckavloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.12 Rengöring av värmeledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.121 Rengöring av värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.13 Rengöring av gasledning o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PCF.131 Rengöring av gasledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PDB.1 Nedstigningsbrunn på avloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PDB.11 Nedstigningsbrunn av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PDB.114 Nedstigningsbrunn av betong för rörtryckning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PDB.5 Dagvattenbrunn på avloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PDB.51 Dagvattenbrunn av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PDB.6 Dränbrunn på dränledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PDB.61 Dränbrunn av betong',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PDC.1 Nedstigningsbrunn på skyddsledning för va-ledning m m, tömningsledning e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PDC.11 Nedstigningsbrunn av betong på skyddsledning för va-ledning m m, tömningsledning e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PDY.5 Infiltrationsbrunn',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEB.1 Avstängningsanordning på tryckrörsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEB.11 Avstängningsanordning på va-ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEB.111 Avstängningsanordning på vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PEB.1111 Avstängningsanordning med kilslidsventil på vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEB.12 Avstängningsanordning på värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEB.3 Spolpost i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEB.4 Brandpost i mark',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEB.ti Bakåtströmningshindrande anordning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.1 Avstängningsanordning på tryckrörsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.11 Avstängningsanordning på va-ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.111 Avstängningsanordning på vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PEC.1111 Avstängningsanordning med kilslidsventil på vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.12 Avstängningsanordning på värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.3 Avtappningsanordning på rörledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.31 Avtappningsanordning på värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.4 Luoningsanordning på tryckrörsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.41 Luoningsanordning på va-ledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.411 Luoningsanordning på vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PEC.42 Luoningsanordning på värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PEC.ti Bakåtströmningshindrande och flödesreglerande anordning e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGB.1 Renovering av rörledning med formpassat rör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PGB.11 Renovering av ledning med formpassat rör för tryckledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PGB.12 Renovering av ledning med formpassat rör för självfallsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGB.3 Renovering av självfallsledning med rörsegment',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGB.4 Renovering av rörledning med flexibelt foder',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PGB.41 Renovering av ledning med flexibelt foder för tryckledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PGB.42 Renovering av ledning med flexibelt foder för självfallsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGB.6 Renovering av rörledning med fogtätning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGB.61 Renovering av självfallsledning med fogtätning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGB.ti Renovering av rörledning med skyddsbeläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGB.ti1 Renovering av rörledning med cementbruk',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PGB.ti11 Renovering av tryckledning av gjutjärn eller stål med cementbruk',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGC.1 Renovering av brunn',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'PGC.11 Renovering av brunn på avloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'PGC.111 Renovering av brunn genom installation av flexibelt foder',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.3 Kontroll av rörledning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.31 Kontroll av vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.311 Tryck- och täthetskontroll av vattenledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YBC.3111 Tryck- och täthetskontroll av vattenledning av segjärnsrör, stålrör m fl',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YBC.3112 Tryck- och täthetskontroll av vattenledning av PVC-rör, GRP-rör m fl',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YBC.3113 Tryck- och täthetskontroll av vattenledning avrör av PE, PP och PB',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.32 Kontroll av värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.321 Kontroll av medierör i värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YBC.3211 Tryck- och täthetskontroll av medierör på värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.322 Kontroll av fogar på mantelrör i värmeledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.33 Kontroll av svetsfogar på rör',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.331 Kontroll av svetsfogar på rör av stål',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.332 Kontroll av svetsfogar på rör av PE',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.34 Kontroll av avloppsledning e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.341 Täthetskontroll av avloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.3411 Tryck- och täthetskontroll av tryckavloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.3412 Täthetskontroll av självfallsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.342 Deformationskontroll av avloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.343 Kontroll av riktningsavvikelse hos avloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.35 Kontroll av brunn på avloppsledning e d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.351 Täthetskontroll av brunn på avloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.352 Kontroll, avvägning av brunn på avloppsledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.36 Kontroll av trumma',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.361 Kontroll, avvägning av trumma',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.3ti Kontroll av gasledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YBC.3ti1 Tryck- och täthetskontroll av gasledning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YCD.1 Relationshandlingar för väg, plan, vegetationsyta, rörledning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YCD.11 Relationshandlingar för väg, plan o d samt vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCD.111 Relationshandlingar för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCD.12 Relationshandlingar för rörledningssystem',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCD.2 Relationshandlingar för bro, brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCD.21 Relationshandlingar för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCD.22 Relationshandlingar för kaj',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCD.3 Relationshandlingar för tunnel, bergrum o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCD.5 Relationshandlingar för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YCD.6 Relationshandlingar för markförstärkningar och geokonstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YCE.1 Underlag för relationshandlingar för väg, plan, vegetationsyta, rörledning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YCE.11 Underlag för relationshandlingar för väg, plan o d samt vegetationsyta',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCE.111 Underlag för relationshandlingar för väg, plan o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCE.12 Underlag för relationshandlingar för rörledningssystem',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YCE.2 Underlag för relationshandlingar för bro, brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCE.21 Underlag för relationshandlingar för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCE.22 Underlag för relationshandlingar för kaj',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCE.3 Underlag för relationshandlingar för tunnel, bergrum o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCE.5 Underlag för relationshandlingar för järnväg',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YCE.6 Underlag för relationshandlingar för markförstärkningar och geokonstruktion',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCH.2 Drioinstruktioner för bro, brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCJ.2 Underlag för drioinstruktioner för bro, brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCK.2 Underhållsinstruktioner för bro, brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCK.21 Underhållsinstruktioner för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCQ.1 Kontrollplaner för byggande av anläggning',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title:
            'YCQ.11 Kontrollplaner för väg, plan, vegetationsyta, rörledning m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCQ.112 Kontrollplaner för rörledningar m m',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCQ.12 Kontrollplaner för bro, brygga, kaj o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCQ.121 Kontrollplaner för bro',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCQ.122 Kontrollplaner för kaj',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
    Product(
        title: 'YCQ.13 Kontrollplaner för tunnel, bergrum o d',
        description: '',
        pricePerUnit: 0,
        quantity: 0),
  ];

  final Map<Product, int> _selectedProducts = {};

  final List<String> _alphabetList = [
    'C',
    'D',
    'P',
    'Y',
  ];

  final Map<String, double> _scrollPositions = {
    'C': 0,
    'D': 24700,
    'P': 51300,
    'Y': 62850,
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
        title: const Text('Mark och Grundläggning'),
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
