import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'dart:async';
import "package:provider/provider.dart";
import 'package:flutter/foundation.dart';

class NFCReader with ChangeNotifier, DiagnosticableTreeMixin {
  bool _supportsNFC = false;
  int _reading = 0;

  int get reading => _reading;
  StreamSubscription<NDEFMessage> _stream;

  void checkSupport() {
    print("hi this is from scanner class");
    notifyListeners();
    //NFC.isNDEFSupported.then((bool isSupported) {});
  }

  void startReading() {
    if (_reading == 1) {
      _stream?.cancel();
      _reading = 0;
    } else {
      _reading = 1;
      // Start reading using NFC.readNDEF()
      _stream = NFC
          .readNDEF(
        once: true,
        throwOnUserCancel: false,
      )
          .listen((NDEFMessage message) {
        print("read NDEF message: ${message.payload}");
      }, onError: (e) {
        // Check error handling guide below
      });
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(IntProperty("reading", _reading));
  }
}
