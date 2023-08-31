import 'package:widgest/ApiServices/api_route.dart';
import '../../Model/Response/products_response_model.dart';
import 'package:http/http.dart' as http;

class GetProductsRepo {
  static Future<ProductsResponseModel> getUser() async {
    ProductsResponseModel? productsResponseModel;

    http.Response response = await http.get(Uri.parse(ApiRoutes.products));

    Map products = {};

    if (response.statusCode == 200) {
      productsResponseModel = productsResponseModelFromJson(response.body);
      print("RESPONSE ${products}");
    } else {
      print('STATUS ${response.statusCode}');
    }
    return productsResponseModel!;
  }
}
