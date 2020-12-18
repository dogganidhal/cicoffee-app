import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/product_dto.dart';
import 'package:cicoffee_app/api/dto/create_order_item_dto.dart';
import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'participant_order_store.g.dart';

class ParticipantOrderStore = _ParticipantOrderStore with _$ParticipantOrderStore;

abstract class _ParticipantOrderStore with Store {
  final ApiClient apiClient;

  @observable
  bool loading = false;

  @observable
  List<ProductDto> products;

  @observable
  List<CreateOrderItemDto> orderItems = List<CreateOrderItemDto>();

  _ParticipantOrderStore({@required this.apiClient}) {
  }

  @action
  Future loadOrderItems() async {
    loading = true;
    products = await apiClient.products.getProducts();
    loading = false;

  }
  @action
  Future addItem(ProductDto product){
    loading = false;

    var existingItem;
    try {
      existingItem = orderItems.singleWhere((element) =>
      element.productId == product.id, orElse: () => null);

    }catch (Exception){
      existingItem = null;
    }
    if (existingItem != null){
      existingItem.quantity = existingItem.quantity+1;
    }
    else {
      orderItems.add(new CreateOrderItemDto(quantity: 1, productId: product.id));
    }
  }

  @action
  Future removeItem(ProductDto product){
    loading = false;

    var existingItem;
    try {
      existingItem = orderItems.singleWhere((element) =>
      element.productId == product.id, orElse: () => null);

    }catch (Exception){
      existingItem = null;
    }
    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        existingItem.quantity = existingItem.quantity-1;
      }
      else{
        orderItems.remove(existingItem);
      }
    }
  }

}