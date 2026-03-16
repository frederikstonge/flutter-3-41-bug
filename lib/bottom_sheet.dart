import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BottomSheetDialog {
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required Widget child,
    required RouteSettings? routeSettings,
    bool useMediaQueryInsetPadding = true,
    bool fullScreen = false,
    double closeProgressThreshold = 0.6,
    Clip? clipBehavior,
    bool enableDrag = true,
  }) => showCustomModalBottomSheet(
    context: context,
    closeProgressThreshold: closeProgressThreshold,
    builder: (BuildContext context) => child,
    useRootNavigator: true,
    settings: routeSettings,
    clipBehavior: clipBehavior,
    enableDrag: enableDrag && !fullScreen,
    containerWidget: (BuildContext context, Animation<double> animation, Widget containedChild) => BottomSheetContainer(
      fullScreen: fullScreen,
      useMediaQueryInsetPadding: useMediaQueryInsetPadding,
      child: containedChild,
    ),
  );
}

class BottomSheetContainer extends StatelessWidget {
  final bool fullScreen;
  final Widget child;
  final bool useMediaQueryInsetPadding;

  const BottomSheetContainer({
    super.key,
    required this.child,
    this.fullScreen = false,
    this.useMediaQueryInsetPadding = true,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
    top: !fullScreen,
    bottom: false,
    child: Padding(
      padding: useMediaQueryInsetPadding
          ? EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom)
          : EdgeInsets.zero,
      child: Material(
        color: Colors.white,
        clipBehavior: fullScreen ? Clip.none : Clip.antiAlias,
        borderRadius: fullScreen
            ? null
            : BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
        child: child,
      ),
    ),
  );
}

