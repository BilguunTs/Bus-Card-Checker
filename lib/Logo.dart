import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLogo extends StatelessWidget {
  MainLogo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(125.9, 327.6),
            child: SizedBox(
              width: 158.0,
              height: 176.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 94.2, 94.5),
                    size: Size(157.6, 176.4),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_c5c35u,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 52.9, 123.6, 123.6),
                    size: Size(157.6, 176.4),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_qjexu2,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 69.9, 106.5, 106.5),
                    size: Size(157.6, 176.4),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_3d4spv,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(131.8, 146.9, 25.8, 25.8),
                    size: Size(157.6, 176.4),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_ki02pf,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
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
}

const String _svg_c5c35u =
    '<svg viewBox="137.0 176.6 94.2 94.5" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ffffe49b"  /><stop offset="0.85348" stop-color="#ffadf147"  /><stop offset="1.0" stop-color="#ffffb727"  /></linearGradient></defs><path transform="translate(137.0, 176.56)" d="M 20.17627906799316 -0.0006784882862120867 L 47.07798767089844 -0.0006784882862120867 C 73.07843017578125 -0.0006784882862120867 94.15597534179688 21.15140533447266 94.15597534179688 47.24382400512695 C 94.15597534179688 73.33623504638672 73.07843017578125 94.48832702636719 47.07798767089844 94.48832702636719 L 0 94.48832702636719 L 0 20.2469654083252 C 0 9.064501762390137 9.033228874206543 -0.0006784882862120867 20.17627906799316 -0.0006784882862120867 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qjexu2 =
    '<svg viewBox="137.0 229.4 123.6 123.6" ><defs><linearGradient id="gradient" x1="0.067144" y1="0.04952" x2="0.832528" y2="1.105252"><stop offset="0.0" stop-color="#ffffe224"  /><stop offset="1.0" stop-color="#ffbaffe1"  /></linearGradient></defs><path transform="matrix(0.0, -1.0, 1.0, 0.0, 137.0, 353.0)" d="M 42.61492156982422 0 L 78.83761596679688 0 C 103.5499496459961 0 123.5832672119141 20.03332328796387 123.5832672119141 44.74567794799805 L 123.5832672119141 61.79164123535156 C 123.5832672119141 95.91822052001953 95.91822052001953 123.5832824707031 61.79164123535156 123.5832824707031 C 27.66506195068359 123.5832824707031 0 95.91822052001953 0 61.79164123535156 L 0 42.61492156982422 C 0 19.0793514251709 19.07934951782227 0 42.61492156982422 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_3d4spv =
    '<svg viewBox="137.0 246.5 106.5 106.5" ><defs><linearGradient id="gradient" x1="0.067144" y1="0.04952" x2="0.832528" y2="1.105252"><stop offset="0.0" stop-color="#ffff2424"  /><stop offset="0.0" stop-color="#ff2efce0"  /><stop offset="1.0" stop-color="#ffbac3ff"  /></linearGradient></defs><path transform="matrix(0.0, -1.0, 1.0, 0.0, 137.0, 353.0)" d="M 36.7271614074707 0 L 67.94525146484375 0 C 89.24330139160156 0 106.5087738037109 17.26548004150391 106.5087738037109 38.56352233886719 L 106.5087738037109 53.25382232666016 C 106.5087738037109 82.6654052734375 82.66596984863281 106.5082092285156 53.25438690185547 106.5082092285156 C 23.84280586242676 106.5082092285156 0 82.6654052734375 0 53.25382232666016 L 0 36.72716522216797 C 0 16.44331359863281 16.44331169128418 0 36.7271614074707 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ki02pf =
    '<svg viewBox="268.8 323.4 25.8 25.8" ><defs><linearGradient id="gradient" x1="0.067144" y1="0.04952" x2="0.832528" y2="1.105252"><stop offset="0.0" stop-color="#ffffb624"  /><stop offset="1.0" stop-color="#ffbaffe7"  /></linearGradient></defs><path transform="matrix(-0.999848, 0.017452, -0.017452, -0.999848, 294.55, 348.78)" d="M 8.735592842102051 0 L 16.16085052490234 0 C 21.22660827636719 0 25.33322715759277 4.106612682342529 25.33322715759277 9.172374725341797 L 25.33322715759277 12.66648864746094 C 25.33322715759277 19.66206550598145 19.66218948364258 25.33310317993164 12.66661357879639 25.33310317993164 C 5.671035289764404 25.33310317993164 3.31126778421861e-16 19.66206550598145 3.31126778421861e-16 12.66648864746094 L 3.31126778421861e-16 8.735594749450684 C 3.31126778421861e-16 3.911059379577637 3.911058664321899 0 8.735592842102051 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
