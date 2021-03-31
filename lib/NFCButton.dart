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

  reset() {
    instance.reset();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  /// Tracks if the animation is playing by whether controller is running.

  Artboard _riveArtboard;

  SimpleAnimation _handController;
  SimpleAnimation _scanningConroller;
  SimpleAnimation _zoomInController;
  CancelAnimation _cancelController;
  bool _detectionOn = false;
  bool get isPlaying => _scanningConroller?.isActive ?? false;

  void _toggleDetection() {
    if (_zoomInController == null) {
      _riveArtboard.addController(
        _zoomInController = SimpleAnimation('Detected'),
      );
    }
    _handController.isActive = false;
    _zoomInController.instance.reset();
    _zoomInController.instance.animation.loop = Loop.oneShot;
    _zoomInController.isActive = true;
  }

  void _toggleCancel() {
    if (_cancelController == null) {
      _riveArtboard.addController(
        _cancelController = CancelAnimation('Cancel'),
      );
    }

    _handController.isActive = true;
    _cancelController.reset();
    _cancelController.start();
  }

  void _togglePlay() {
    setState(() {
      _scanningConroller.isActive = !_scanningConroller.isActive;
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
          artboard.addController(_handController);
          //  artboard.addController(_detectionController = detectedAnimation);

          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _scanningConroller.isActiveChanged.addListener(() {
      if (_scanningConroller.isActive) {
        _toggleCancel();
      } else {
        _toggleDetection();
      }
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(artboard: _riveArtboard),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
