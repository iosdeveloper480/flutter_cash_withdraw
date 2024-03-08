import 'dart:convert';

import 'package:cash_withdraw/modules/screens/customer_card_details_page.dart';
import 'package:cash_withdraw/modules/widgets/CustomText.dart';
import 'package:cash_withdraw/modules/widgets/GradientAppBarView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// import 'package:nfc_manager/nfc_manager.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class NFCReaderPage extends StatefulWidget {
  const NFCReaderPage({super.key});

  @override
  State<NFCReaderPage> createState() => _NFCReaderPageState();
}

class _NFCReaderPageState extends State<NFCReaderPage> {
  @override
  void initState() {
    super.initState();
    // _tagRead();
    _tagRead2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBarView(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.green,
                  ),
                  CustomText(
                    data: "back",
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Wrap(
                children: [
                  const Stack(
                    children: [
                      Center(
                        child: RippleAnimation(
                          color: Colors.green,
                          delay: Duration(milliseconds: 0),
                          repeat: true,
                          minRadius: 145,
                          ripplesCount: 6,
                          duration: Duration(milliseconds: 6 * 300),
                          child: CircleAvatar(
                            minRadius: 155,
                            maxRadius: 155,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child: Image(
                          image: AssetImage("lib/assets/payez.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40.0, bottom: 20),
                    child: Center(
                      child: Image(
                        image: AssetImage("lib/assets/nfc.png"),
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: CustomText(
                      data: "Request customer to tap their WPS Card",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tagRead2() async {
    // timeout only works on Android, while the latter two messages are only for iOS
    var tag = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 5),
        iosMultipleTagMessage: "Multiple tags found!",
        iosAlertMessage: "Scan your tag");

    print("jsonEncode(tag)");
    print(jsonEncode(tag));
    // if (tag.type == NFCTagType.iso7816) {
    //   var result = await FlutterNfcKit.transceive(
    //       "3101F1564011001900000000000000"); // timeout is still Android-only, persist until next change
    //
    //   print("result");
    //   print(result);
    // }
// iOS only: set alert message on-the-fly
// this will persist until finish()
//     await FlutterNfcKit.setIosAlertMessage("hi there!");

// read NDEF records if available

    if (tag.ndefAvailable ?? false) {
      /// decoded NDEF records (see [ndef.NDEFRecord] for details)
      /// `UriRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=U uri=https://github.com/nfcim/ndef`
      for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
        print("record.toString()");
        print(record.toString());
      }

      /// raw NDEF records (data in hex string)
      /// `{identifier: "", payload: "00010203", type: "0001", typeNameFormat: "nfcWellKnown"}`
      for (var record
          in await FlutterNfcKit.readNDEFRawRecords(cached: false)) {
        print("jsonEncode(record).toString()");
        print(jsonEncode(record).toString());
      }
    }

    // Call finish() only once
    await FlutterNfcKit.finish();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomerCardDetailsPage(),
      ),
    );
  }

//   void _tagRead() {
//     // Navigator.of(context).push(
//     //   MaterialPageRoute(
//     //     builder: (context) => const CustomerCardDetailsPage(),
//     //   ),
//     // );
//     // return;
//     NfcManager.instance.startSession(
//       pollingOptions: {
//         NfcPollingOption.iso14443,
//         NfcPollingOption.iso15693,
//         NfcPollingOption.iso18092,
//       },
//       onDiscovered: (NfcTag tag) async {
//         // result.value = tag.data;
//         //Call API with this tag.data
//         print("tag.data");
//         print(tag.data);
//         print(tag.handle);
// /////
//         var ndef = Ndef.from(tag);
//         print("ndef");
//         print(ndef);
//         var record = ndef?.cachedMessage?.records.first;
//         print("record");
//         print(record);
//
//         // var decodedPayload = ascii.decode(record!.payload);
//         // print("decodedPayload");
//         // print(decodedPayload);
// /////
//
//         if (tag.data != null) {
//           NfcManager.instance.stopSession();
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const CustomerCardDetailsPage(),
//             ),
//           );
//         }
//       },
//       onError: (NfcError error) async {
//         print("NFC Error");
//         print(error.message);
//         print(error.details);
//         print(error.type);
//         NfcManager.instance.stopSession();
//       },
//     );
//   }
}
