import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/add_edit_product_constants.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/add_edit_products_controller.dart';
import 'package:thirumathikart_seller/models/product.dart';
import 'package:thirumathikart_seller/widgets/AddEditProduct/add_edit_product_dropdown.dart';
import 'package:thirumathikart_seller/widgets/AddEditProduct/add_edit_product_field.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:thirumathikart_seller/widgets/utils/app_button.dart';

class AddEditProductPage extends GetView<AddEditProductsController> {
  AddEditProductPage({super.key});
  final _nameController =
      TextEditingController(text: '${Get.arguments.name ?? ''}');
  final _priceController =
      TextEditingController(text: '${Get.arguments.price ?? ' '}');
  final _descController =
      TextEditingController(text: '${Get.arguments.description ?? ' '}');

  final _quantityController =
      TextEditingController(text: '${Get.arguments.quantity ?? ' '}');
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final String name = Get.routing.current == NavigationRoutes.addProduct
      ? 'Add Product'
      : 'Edit Product';
  final String buttonName = Get.routing.current == NavigationRoutes.addProduct
      ? 'Add Product'
      : 'Save Product';
  void _saveForm() {
    if (_formkey.currentState!.validate()) {
      var product = Product(
        name: _nameController.text,
        price: _priceController.text,
        category: controller.dropdownvalue.value,
        description: _descController.text,
        image: controller.image.value,
        quantity: _quantityController.text,
        productWeight: controller.dropdownvalue1.value,
      );
      controller.updateProduct(product);
    } else {
      Get.snackbar('Add/Update Product', 'Please fill all the fields');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(label: 'name', context: context),
        body: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            children: [
              Obx(() => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: (MediaQuery.of(context).size.width).toInt() - 100,
                      height: (MediaQuery.of(context).size.width).toInt() - 100,
                      child: Container(
                        decoration: controller.isImageAdded.value
                            ? const BoxDecoration()
                            : BoxDecoration(
                                border: Border.all(color: AppTheme.textPrimary),
                                borderRadius: BorderRadius.circular(15)),
                        child: controller.isImageAdded.value
                            ? Image.file(controller.image.value)
                            : Get.arguments.imageUrl != null
                                ? Image.network(Get.arguments.imageUrl)
                                : const Center(
                                    child: Text(
                                        '\t \t \t No Image Added \n Click here to add image'),
                                  ),
                      ),
                    ),
                    onTap: () {
                      controller.pickImage();
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 0, right: 0, bottom: 0),
                child: Divider(
                  color: AppTheme.searchBar,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              AddEditProductField(
                productName: EditProductConstants.name,
                namecontroller: _nameController,
              ),
              AddEditProductField(
                productName: EditProductConstants.price,
                namecontroller: _priceController,
              ),
              // TODO: uncomment this when connection with the dropdown backend is fully understood
              const AddEditProductDropDown(
                  productName: EditProductConstants.category),
              const AddEditProductDropDown(
                productName: EditProductConstants.productWeight,
                isCategory: false,
              ),

              AddEditProductField(
                productName: EditProductConstants.quantity,
                namecontroller: _descController,
              ),
              AddEditProductField(
                productName: EditProductConstants.description,
                namecontroller: _quantityController,
              ),
              AppButton(buttonName: buttonName, onPressed: _saveForm),
            ],
          ),
        )),
      );
}
