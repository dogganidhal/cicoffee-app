import 'package:cicoffee_app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class SignUp extends StatelessWidget {

  final VoidCallback onLoginTapped;

  const SignUp({Key key, this.onLoginTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: screenSize.height - safeAreaPadding.top - safeAreaPadding.bottom,
          child: Center(

          ),
        ),
      )
    );
  }

  Widget _form(BuildContext context) => FormBuilder(
    child: Padding(
      padding: Layout.padding.defaultHorizontal,
      child: Column(
        children: [
          _fullNameFields
        ],
      ),
    )
  );

  Widget get _fullNameFields => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Flexible(
        child: FormBuilderTextField(
          attribute: "lastName",
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: 0.5)
            ),
            labelText: "Nom",
          ),
          validators: [
            FormBuilderValidators.required(errorText: "Ce champ est requis")
          ],
        ),
      ),
      SizedBox(width: 16),
      Flexible(
        child: FormBuilderTextField(
          attribute: "firstName",
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: 0.5)
            ),
            labelText: "Prénom",
          ),
          validators: [
            FormBuilderValidators.required(errorText: "Ce champ est requis"),
          ],
        ),
      ),
    ],
  );

}
