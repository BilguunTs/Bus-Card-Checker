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

class _MyHomePageState extends State<MyHomePage> {
  /// Tracks if the animation is playing by whether controller is running.

  Artboard _riveArtboard;

  RiveAnimationController _handController;
  RiveAnimationController _scanningConroller;
  RiveAnimationController _detectionController;

  bool get isPlaying => _scanningConroller?.isActive ?? false;

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
          SimpleAnimation scanning = SimpleAnimation("Scanning");
          SimpleAnimation handAN = SimpleAnimation("HandAnimation");
          SimpleAnimation detectedAnimation = SimpleAnimation("Detected");

          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;

          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_scanningConroller = scanning);
          artboard.addController(_detectionController = detectedAnimation);
          artboard.addController(_handController = handAN);

          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _scanningConroller.isActiveChanged.addListener(() {});

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
