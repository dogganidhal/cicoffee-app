import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/product_dto.dart';
import 'package:cicoffee_app/api/dto/order_item_dto.dart';
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
  List<OrderItemDto> orderItems;

  _ParticipantOrderStore({@required this.apiClient}) {
    loadOrderItems();
  }

  @action
  Future loadOrderItems() async {
    loading = true;

    products = await apiClient.products.getProducts();


    loading = false;

  }
  @action
  Future addItem(ProductDto product){

    var existingItem = orderItems.singleWhere((element) => element.product.id == product.id,
        orElse: () => null);

    if (existingItem != null){
      orderItems.add(new OrderItemDto(quantity: existingItem.quantity + 1, product: product));
    }
    else {
      orderItems.add(new OrderItemDto(quantity: 1, product: product));
    }
  }

}