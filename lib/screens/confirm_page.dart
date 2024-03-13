// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:ai_barcode_scanner/ai_barcode_scanner.dart'

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  String scannedCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE2CAAE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('اختر طريقة الدفع لتأكيد الحجز'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your action for "الكريمي" payment method
                    print('Selected: الكريمي');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffA95F44),
                  ),
                  child: const Text(
                    'ام فلوس',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your action for "فلوسك" payment method
                    print('Selected: فلوسك');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffA95F44),
                  ),
                  child: const Text(
                    'فلوسك',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your action for "بيبال" payment method
                    print('Selected: بيبال');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffA95F44),
                  ),
                  child: const Text(
                    'حوالة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your action for "بيبال" payment method
                    print('Selected: بيبال');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffA95F44),
                  ),
                  child: const Text(
                    'إيداع',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              // onPressed: () async {
              // await Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => AiBarcodeScanner(
              //       validator: (value) {
              //         return value.startsWith('https://');
              //       },
              //       canPop: false,
              //       onScan: (String value) {
              //         debugPrint(value);
              //         setState(() {
              //           scannedCode = value;
              //         });
              //       },
              //       onDetect: (p0) {},
              //       onDispose: () {
              //         debugPrint("Barcode scanner disposed!");
              //       },
              //       controller: MobileScannerController(
              //         detectionSpeed: DetectionSpeed.noDuplicates,
              //       ),
              //     ),
              //   ),
              // );

              // Implement your action for "مسح باركود الحوالة" payment method
              //      print('Selected: مسح باركود الحوالة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffA95F44),
              ),
              child: const Text(
                'مسح باركود الحوالة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> scanBarcode() async {
  //   try {
  //     String barcode = await BarcodeScanner.scan();
  //     setState(() {
  //       scannedCode = barcode;
  //     });
  //   } catch (e) {
  //     print('Error scanning barcode: $e');
  //   }
  // }
// // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//   }
}
