import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ResponsiveLayout extends GetResponsiveView<ResponsiveController> {
  ResponsiveLayout({
    super.key,
    required this.phoneUI,
    required this.webUI,
  }) : super(
          alwaysUseBuilder: false,
          settings: const ResponsiveScreenSettings(desktopChangePoint: 1000),
        );

  final Widget phoneUI;
  final Widget webUI;

  @override
  Widget build(BuildContext context) {

    return super.build(context);
  }

  @override
  Widget? phone() {
    ScreenUtil.init(screen.context, designSize: const Size(360, 800));
    return phoneUI;
  }

  @override
  Widget? desktop() {
    ScreenUtil.init(screen.context, designSize: const Size(1920, 1080));
    return webUI;
  }
}

class ResponsiveController extends GetxController {}
