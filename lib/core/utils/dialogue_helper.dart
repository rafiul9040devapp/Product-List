import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DialogHelper {
  static void showExitConfirmationDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'Exit Application',
      desc: 'Are you sure you want to exit the application?',
      btnCancelText: 'Cancel',
      btnOkText: 'Exit',
      btnOkOnPress: () {
        SystemNavigator.pop();
      },
    ).show();
  }
}
