import 'package:flutter/cupertino.dart';


abstract class Layout {
  static final padding = _Padding();
}

class _Padding {
  final defaultHorizontal = EdgeInsets.symmetric(horizontal: 16);
}
