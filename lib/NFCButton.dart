import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

/**
 Nfc button is triggered by its permisions 
 just kidding  I don't actually know :) 
 */
class NFCButton extends StatefulWidget {
  @override
  NFCbuttonState createState() => NFCbuttonState();
}

class NFCbuttonState extends State<NFCButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CancelAnimation extends SimpleAnimation {
  CancelAnimation(String animationName) : super(animationName);

  start() {
    instance.animation.loop = Loop.oneShot;
    isActive = true;
  }

  stop() => instance.animation.loop = Loop.oneShot;
}

class _MyHomePageState extends State<MyHomePage> {
  /// Tracks if the animation is playing by whether controller is running.

  Artboard _riveArtboard;

  SimpleAnimation _handController;
  SimpleAnimation _scanningConroller;

  CancelAnimation _cancelController;
  bool _detectionOn = false;
  bool get isPlaying => _scanningConroller?.isActive ?? false;

  void _toggleDetection() {
    if (_scanningConroller == null) {
      _riveArtboard.addController(
        _scanningConroller = SimpleAnimation('Detected'),
      );
    }
    if (_detectionOn) {
      _scanningConroller.instance.animation.loop = Loop.loop;
    } else {
      _scanningConroller.instance.animation.loop = Loop.oneShot;
    }
  }

  void _toggleCancel() {
    if (_cancelController == null) {
      _riveArtboard.addController(
        _cancelController = CancelAnimation('Cancel'),
      );
    }
    if (_detectionOn) {
      _cancelController.start();
    } else {
      _cancelController.stop();
    }
  }

  void _toggleHandGesture() {
    if (_detectionOn) return;

    if (_handController == null) {
      _riveArtboard.addController(
        _handController = SimpleAnimation('HandAnimation'),
      );
    }
    _handController.instance.animation.loop = Loop.loop;
  }

  void _togglePlay(bool active) {
    // setState(() {
    //   _scanningConroller.isActive = !_scanningConroller.isActive;
    // });
    if (active) {
      _toggleDetection();
    } else {
      _toggleCancel();
      _toggleHandGesture();
    }
    setState(() {
      _detectionOn != active;
    });
  }

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/rive/rfc_button.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          _scanningConroller = SimpleAnimation("Scanning");
          _handController = SimpleAnimation("HandAnimation");
          // SimpleAnimation detectedAnimation = SimpleAnimation("Detected");

          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;

          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_scanningConroller);
          //  artboard.addController(_detectionController = detectedAnimation);

          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(artboard: _riveArtboard),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _togglePlay(_detectionOn);
        },
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
