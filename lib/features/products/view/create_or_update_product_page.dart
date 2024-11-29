import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/core/utils/helper.dart';
import 'package:product_list/core/utils/toast_message.dart';
import 'package:product_list/core/utils/ui_helper.dart';
import 'package:product_list/features/products/bloc/product_bloc.dart';
import 'package:product_list/features/products/model/product.dart';
import 'package:product_list/notification/notification_service.dart';
import 'package:product_list/routes/navigation_helper.dart';
import 'package:product_list/widgets/custom_app_bar.dart';
import 'package:product_list/widgets/custom_button.dart';
import 'package:product_list/widgets/loading_state_display.dart';
import '../../../widgets/labeled_text_form_field.dart';


class CreateOrUpdateProductPage extends StatefulWidget {
  final Product? product;

  const CreateOrUpdateProductPage({super.key, this.product});

  @override
  State<CreateOrUpdateProductPage> createState() =>
      _CreateOrUpdateProductPageState();
}

class _CreateOrUpdateProductPageState extends State<CreateOrUpdateProductPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each field
  final _productNameController = TextEditingController();
  final _productQuantityController = TextEditingController();
  final _productUnitPriceController = TextEditingController();

  @override
  void initState(){
    super.initState();

    if (widget.product != null) {
      _productNameController.text = widget.product?.productName ?? "N/A";
      _productQuantityController.text =
          widget.product?.quantity.toString() ?? "N/A";
      _productUnitPriceController.text =
          widget.product?.unitPrice.toString() ?? "N/A";
    }
  }

  void clear(){
    _productQuantityController.clear();
    _productUnitPriceController.clear();
    _productNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.status == ProductStatus.loading) {
          return const LoadingStateDisplay();
        } else {
          return _buildUI();
        }
      },
      listener: (context, state) {
        if (state.status == ProductStatus.success && mounted) {
          _showNotification();
          _formKey.currentState?.reset();
          clear();
          if(widget.product != null){
            context.pop(true);
          }
        }
        if (state.status == ProductStatus.error && mounted) {
          showErrorToast(context, state.errorMessage);
        }
      },
      listenWhen: (previous, current) => current.status  != previous.status,
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.product == null ? 'Create Product' : 'Update Product',
        ),
        body: Padding(
          padding: UIHelper.symmetricPadding(),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                LabeledTextFormField(
                  controller: _productNameController,
                  labelText: 'Product Name',
                  hintText: 'Enter product name',
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product name is required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpaceMedium(),
                LabeledTextFormField(
                  controller: _productQuantityController,
                  labelText: 'Product Quantity',
                  hintText: 'Enter product quantity',
                  inputType: TextInputType.number,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product quantity is required';
                    }
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Please enter a valid quantity';
                    }
                    return null;
                  },
                  // Restrict input to numbers only
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                UIHelper.verticalSpaceMedium(),
                LabeledTextFormField(
                  controller: _productUnitPriceController,
                  labelText: 'Product Unit Price',
                  hintText: 'Enter product unit price',
                  inputType: TextInputType.number,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product unit price is required';
                    }
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                  // Restrict input to numbers only
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                UIHelper.verticalSpaceLarge(),
                CustomButton(
                  onTap: widget.product == null
                      ? _onCreateProduct
                      : _onUpdateProduct,
                  text: widget.product == null ? 'Create' : 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productQuantityController.dispose();
    _productUnitPriceController.dispose();
    super.dispose();
  }

  void _onCreateProduct() {
    if (_formKey.currentState?.validate() ?? false) {
      final productName = _productNameController.text.trim();
      final productQuantity = int.parse(_productQuantityController.text.trim());
      final productUnitPrice = int.parse(_productUnitPriceController.text.trim());

      // Handle form submission
      print('Product Name: $productName');
      print('Product Quantity: $productQuantity');
      print('Product Unit Price: $productUnitPrice');

     try{
       context.read<ProductBloc>().add(AddNewProductEvent(
           productName: productName,
           productQuantity: productQuantity,
           productUnitPrice: productUnitPrice));
     }catch(e){
       showErrorToast(context, e.toString());
     }
    }
  }

  void _onUpdateProduct() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isInputUnchanged()) {
        showErrorToast(context, 'No value is updated');
        return;
      }

      try {
        final updatedProduct = _createUpdatedProduct();
        context.read<ProductBloc>().add(UpdatingExistingProductEvent(product: updatedProduct));
      } catch (e) {
        showErrorToast(context, e.toString());
      }
    }
  }

  bool _isInputUnchanged() {
    return _productNameController.text.trim().toLowerCase() ==
        (widget.product?.productName?.trim().toLowerCase() ?? '') &&
        _productUnitPriceController.text.trim() ==
            (widget.product?.unitPrice?.toString() ?? '') &&
        _productQuantityController.text.trim() ==
            (widget.product?.quantity?.toString() ?? '');
  }

  Product _createUpdatedProduct() {
    final productName = _productNameController.text.trim();
    final productQuantity = int.parse(_productQuantityController.text.trim());
    final productUnitPrice = int.parse(_productUnitPriceController.text.trim());

    return Product(
      id: widget.product?.id ?? '',
      productCode: widget.product?.productCode ?? 0,
      imageUrl: widget.product?.imageUrl ?? '',
      productName: productName,
      quantity: productQuantity,
      unitPrice: productUnitPrice,
      totalPrice: calculateTotalPrice(
        quantity: productQuantity,
        unitPrice: productUnitPrice,
      ),
    );
  }

  void _showNotification() {
    if (widget.product == null) {
      NotificationService.showBasicNotification(
          title: 'New Product is Created', body: _productNameController.text);
    } else {
      NotificationService.showBasicNotificationWithImage(
        title: 'Product is Updated',
        body: widget.product?.productName ?? ' ',
        imageUrl: widget.product?.imageUrl ?? "",
      );
    }
  }
}

