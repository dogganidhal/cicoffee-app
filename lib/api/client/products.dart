import 'package:cicoffee_app/api/client/http_client.dart';
import 'package:cicoffee_app/api/dto/product_dto.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class ProductsApiClient extends HttpClient {
  ProductsApiClient({@required Dio dio}) : super(dio: dio);

  Future<List<ProductDto>> getProducts() async {
    final data = await get("/api/product");
    return (data as List)
        .map((item) => ProductDto.fromJson(item))
        .toList();
  }
}
