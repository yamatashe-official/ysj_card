import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Globals/colors.dart';
import '../Globals/icons.dart';

class GyroLogoPage extends StatefulWidget {
  const GyroLogoPage({super.key});
  static const routeName = '/gyro-logo';

  @override
  State<GyroLogoPage> createState() => _GyroLogoPageState();
}

class _GyroLogoPageState extends State<GyroLogoPage> with AppColors, YSJLogo {
  // late StreamSubscription<GyroscopeEvent>? gyroEvents;
  // double deviceZAxisValue = 0;

  // @override
  // void initState() {
  //   gyroEvents = motionSensors.gyroscope.listen((event) {
  //     setState(() => deviceZAxisValue = event.z);
  //   });

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   gyroEvents?.cancel();
  //   gyroEvents = null;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainTheme2,
        body: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                ysjLogo,
                fit: BoxFit.scaleDown,
                clipBehavior: Clip.none,
                width: 150,
                height: 150,
              ),
            ),
          ],
        ));
  }
}
