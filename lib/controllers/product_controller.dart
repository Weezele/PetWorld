import 'package:get/get.dart';
import 'package:petworld/models/pet_accessories.dart';
import 'package:petworld/services/firestore_db.dart';

class ProductController extends GetxController{
  static final products = <Product>[].obs;

  @override
  void onInit(){
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}