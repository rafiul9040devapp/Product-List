import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/toast_message.dart';
import '../../../../generated/l10n.dart';
import '../../../../themes/assets_path.dart';
import '../../bloc/product_bloc.dart';
import '../../model/product.dart';



class ProductHelper {
  /// Displays a delete confirmation dialog and returns a `Future<bool?>` to indicate the user's choice.
  static Future<bool?> showDeleteConfirmationDialogue(
      BuildContext context, Product product) async {
    bool? result;

    await AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      customHeader: Lottie.asset(
        AppAnimations.noInternetConnection,
        repeat: true,
        reverse: true,
      ),
      animType: AnimType.rightSlide,
      title: S.current.delete_confirm,
      desc: 'Are you sure you want to delete ${product.productName}?',
      btnCancelText: S.current.cancel,
      btnOkText: S.current.confirm,
      btnCancelOnPress: () {
        result = false; // Set result to false if Cancel is pressed
      },
      btnOkOnPress: () {
        try {
          // Dispatch the RemoveProductEvent with the product ID
          BlocProvider.of<ProductBloc>(context).add(
            RemoveProductEvent(productID: product.id ?? S.current.not_available),
          );
          // Show success message
          showSuccessToast(context, '${product.productName} has been removed');
          result = true; // Set result to true on success
        } catch (e) {
          // Handle errors
          showErrorToast(context, 'Unable to remove ${product.productName}');
          result = false; // Set result to false on failure
        }
      },
    ).show();

    return result;
  }


}
