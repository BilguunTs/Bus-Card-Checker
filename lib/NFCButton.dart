import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:BusCardChecker/widgets/data_table.dart';

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

  SimpleAnimation _scanningConroller = SimpleAnimation("Scanning");
  SimpleAnimation _handController = SimpleAnimation("HandAnimation");
  SimpleAnimation _cancelController = CancelAnimation('Cancel');
  SimpleAnimation _zoomInController;

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
    _riveArtboard.addController(_cancelController);

    _handController.isActive = true;
    _cancelController.instance.reset();
    _cancelController.instance.animation.loop = Loop.oneShot;
    _cancelController.isActive = true;
  }

  void _togglePlay() {
    setState(() {
      _scanningConroller.isActive = !_scanningConroller.isActive;
    });
  }

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/rive/rfc_button.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_scanningConroller);
          artboard.addController(_handController);
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _scanningConroller.isActiveChanged.addListener(() {
      if (_scanningConroller.isActive) {
        _toggleCancel();
      } else {
        _toggleDetection();
      }
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(
            child: _riveArtboard == null
                ? const SizedBox()
                : Rive(artboard: _riveArtboard),
          ),
          new Positioned(
              left: 0,
              top: 0,
              child: new Container(
                width: width,
                height: height,
                decoration: new BoxDecoration(color: Colors.transparent),
                child: AnimatedOpacity(
                  opacity: isPlaying ? 0 : 1,
                  duration: Duration(seconds: 1),
                  child: Center(
                      child: SliverTest(
                    shouldRender: !isPlaying,
                  )),
                ),
              )),
        ],
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
