// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ParticipantOrderStore on _ParticipantOrderStore, Store {
  final _$loadingAtom = Atom(name: '_ParticipantOrderStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$productsAtom = Atom(name: '_ParticipantOrderStore.products');

  @override
  List<ProductDto> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductDto> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$orderItemsAtom = Atom(name: '_ParticipantOrderStore.orderItems');

  @override
  List<CreateOrderItemDto> get orderItems {
    _$orderItemsAtom.reportRead();
    return super.orderItems;
  }

  @override
  set orderItems(List<CreateOrderItemDto> value) {
    _$orderItemsAtom.reportWrite(value, super.orderItems, () {
      super.orderItems = value;
    });
  }

  final _$loadProductsAsyncAction =
      AsyncAction('_ParticipantOrderStore.loadProducts');

  @override
  Future<dynamic> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  final _$orderAsyncAction = AsyncAction('_ParticipantOrderStore.order');

  @override
  Future<dynamic> order(String sessionId) {
    return _$orderAsyncAction.run(() => super.order(sessionId));
  }

  final _$_ParticipantOrderStoreActionController =
      ActionController(name: '_ParticipantOrderStore');

  @override
  void addItem(ProductDto product) {
    final _$actionInfo = _$_ParticipantOrderStoreActionController.startAction(
        name: '_ParticipantOrderStore.addItem');
    try {
      return super.addItem(product);
    } finally {
      _$_ParticipantOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(ProductDto product) {
    final _$actionInfo = _$_ParticipantOrderStoreActionController.startAction(
        name: '_ParticipantOrderStore.removeItem');
    try {
      return super.removeItem(product);
    } finally {
      _$_ParticipantOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
products: ${products},
orderItems: ${orderItems}
    ''';
  }
}
