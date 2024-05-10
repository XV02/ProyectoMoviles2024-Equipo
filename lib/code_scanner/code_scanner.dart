import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:proyecto_final/code_scanner/code_scanner_appbar.dart';
import 'package:proyecto_final/pages/individual_item/manga.dart';

class CodeScanner extends StatelessWidget {
  const CodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CodeScannerAppBar(),
      body: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 40.0),
                width: 500,
                height: 140,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(
                    'Scan the QR code',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                        decorationColor: Colors.white),
                  ),
                )),

            Center(
                child: Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.only(top: 100),
              child: const Icon(Icons.qr_code_2_outlined, size: 200),
              color: Colors.white,
            )),

            //   Center(

            //      child: Container(

            //       margin: const EdgeInsets.only(top:100),
            //       width: 100,
            //       height: 100,

            //       child: const Text('Open your camera ',  style: TextStyle(fontSize: 25, color:Color.fromARGB(186, 255, 255, 255),
            //     decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed, decorationColor: Colors.red)
            //   )

            //   )),
            Container(
              child: QR(),
              width: 1000,
              height: 250,
            )
          ],
        ),
      ),
    );
  }
}

class QR extends StatefulWidget {
  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() async {
      _scanBarcode = barcodeScanRes;
      // MangaModel toAdd  = MangaModel();
      // print("Debug Stuff $barcodeScanRes");
      // MangaModel curr = await toAdd.getDataById(barcodeScanRes);
      // Navigator.push(context,  MaterialPageRoute(builder: (context) => manga_item(desc:"Placeholder",title: "Placeholder")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.all(10),
        width: 400,
        height: 800,
        color: Colors.red,
        alignment: Alignment.center,
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () async {
                    // MangaModel toAdd  = MangaModel();

                    await scanQR();
                    // MangaModel curr = await toAdd.getDataById(_scanBarcode);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushNamedAndRemoveUntil(context, "/MangaItem",
                          (Route<dynamic> route) => false,
                          arguments: MangaItemArguments(id: _scanBarcode));
                    });
                  },
                  child: Text('Start QR scan')),
            ]));
  }
}
