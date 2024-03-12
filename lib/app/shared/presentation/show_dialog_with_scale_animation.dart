import 'package:flutter/material.dart';

showDialogWithScaleAnimation(
    {required Widget child, required BuildContext context}) {
  return showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, animation, secondaryAnimation, widget) {
      return ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child);
    },
    transitionDuration: const Duration(milliseconds: 500),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) => child,
  );
}
