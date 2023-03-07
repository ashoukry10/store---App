
import 'package:store/helper/api.dart';
import '../models/product_model.dart';
class CategoriesServices {
  Future<List<ProductModel>> getCategories({required String categoriesName}) async {
   List<dynamic>data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoriesName');
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
