import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/core/utils/ui_helper.dart';
import 'package:toastification/toastification.dart';

/// Display a success toast with a flat colored style
void showSuccessToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    title: const Text('Success'),
    description: Text(message),
    type: ToastificationType.success,
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 300),
    icon: const Icon(Icons.check),
    showIcon: true,
    primaryColor: Colors.green.withOpacity(.5),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding:UIHelper.symmetricPadding(),
    margin: UIHelper.symmetricMargin(),
    borderRadius: BorderRadius.circular(12.r),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}

/// Display an error toast with a flat colored style
void showErrorToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    title: const Text('Error'),
    description: Text(message),
    type: ToastificationType.error,
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 300),
    icon: const Icon(Icons.error_outline_outlined),
    showIcon: true,
    primaryColor: Colors.redAccent.withOpacity(.5),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding:UIHelper.symmetricPadding(),
    margin: UIHelper.symmetricMargin(),
    borderRadius: BorderRadius.circular(12.r),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}
