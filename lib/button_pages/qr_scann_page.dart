// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QrScannPage extends StatefulWidget {
//   const QrScannPage({Key? key}) : super(key: key);
//
//   @override
//   State<QrScannPage> createState() => _QrScannPageState();
// }
//
// class _QrScannPageState extends State<QrScannPage> {
//   final GlobalKey qrKey =GlobalKey(debugLabel: "QR");
//   Barcode? result;
//   QRViewController? controller;
//   bool _flashOn = false;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   void reassemble(){
//     super.reassemble();
//     if(Platform.isAndroid) {
//       controller!.pauseCamera();
//     }else if (Platform.isIOS){
//       controller!.resumeCamera();
//     }
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           buildQrView(context),
//           Expanded(
//             flex: 5,
//             child: QRView(key: qrKey, onQRViewCreated: onQRViewCreated),)
//         ],
//       ),
//     );
//   }
//
//   Widget buildQrView(BuildContext context) => QRView(
//     key: qrKey,
//     onQRViewCreated: onQRViewCreated);
//
//
//
//   void onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }
// }
//
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannPage extends StatefulWidget {
  const QrScannPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScannPageState();
}

class _QrScannPageState extends State<QrScannPage> {
  Barcode? result;
  QRViewController? controller;
  bool _flashOn = false;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 4, child: buildQrView(context)),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent.withOpacity(1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(
                          child: IconButton(
                              onPressed: () async {
                                await controller!.toggleFlash();
                                setState(() {
                                  _flashOn = !_flashOn;
                                });
                              },
                              icon: Icon(
                                _flashOn
                                    ? Icons.flash_on_outlined
                                    : Icons.flash_off_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      // TODO надо разобраться перессылкой qr по адресу
                      // Center(
                      //   child:  (result != null)
                      //       ?Text("Result: ${result!.code}")
                      //       :Text("Scan a code",
                      //   style: TextStyle(color: Colors.red),)
                      // )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
