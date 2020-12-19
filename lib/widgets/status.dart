import 'package:cicoffee_app/api/dto/session_dto.dart';
import 'package:flutter/material.dart';


class Status extends StatelessWidget {
  final String selectedText;
  final String unselectedText;
  final bool selected;

  const Status({
    Key key, this.selectedText, this.unselectedText, this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = selected ?
      Colors.green :
      Theme.of(context).unselectedWidgetColor;
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1.5)
      ),
      child: Center(
        child: Text(
          (selected ? selectedText : unselectedText).toUpperCase(),
          style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(
              color: color,
              fontWeight: FontWeight.bold
            ),
        ),
      ),
    );
  }
}
