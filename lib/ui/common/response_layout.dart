import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ResponsiveLayout extends GetResponsiveView<ResponsiveController> {
  ResponsiveLayout({super.key, required this.webUI, this.phoneUI, this.tabletUI})
    : super(alwaysUseBuilder: false, settings: appScreenSetting);

  final Widget? phoneUI;
  final Widget webUI;
  final Widget? tabletUI;

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  Widget? phone() {
    return phoneUI;
  }

  @override
  Widget? tablet() {
    return tabletUI;
  }

  @override
  Widget? desktop() {
    return webUI;
  }
}

const appScreenSetting = ResponsiveScreenSettings(desktopChangePoint: 1000);

class ResponsiveController extends GetxController {}
