import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';

import 'direcciones_page.dart';

import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR() async {
    //https://www.qrcode.es/es/generador-qr-code/
    //geo:40.73255860802501,-73.89333143671077

    dynamic futureString = '';

    //try {
    //futureString = await BarcodeScanner.scan();
    //} catch (e) {
    // futureString = e.toString();
    //}

    //print('Future String: ${futureString.rawContent}');
    //}
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.map), title: Text('Direcciones')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Direcciones')),
      ],
    );
  }
}
