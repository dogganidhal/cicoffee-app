import 'package:cicoffee_app/theme/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cicoffee_app/theme/layout.dart';


class Login extends StatefulWidget {
  final VoidCallback onSignUpTapped;

  const Login({Key key, this.onSignUpTapped}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordTextObscure = true;

  @override
  Widget build(BuildContext context) {
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height - safeAreaPadding.top - safeAreaPadding.bottom,
            child: Center(
              child: _form(context),
            ),
          ),
        )
    );
  }

  Widget _form(BuildContext context) => FormBuilder(
      child: Padding(
        padding: Layout.padding.defaultHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                height: 148,
                child: Image.asset(Assets.logo),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Connexion",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            FormBuilderTextField(
              attribute: "email",
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 0.5,
                  ),
                ),
                labelText: "Adresse Email",
              ),
              validators: [
                FormBuilderValidators.required(errorText: "Ce champ est requis"),
                FormBuilderValidators.email(errorText: "Adresse mail non valide")
              ],
            ),
            SizedBox(height: 16),
            FormBuilderTextField(
              attribute: "password",
              maxLines: 1,
              decoration: InputDecoration(
                  focusColor: Theme.of(context).primaryColor,
                  border: OutlineInputBorder(),
                  labelText: "Mot de passe",
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                        _isPasswordTextObscure ?
                        Icons.visibility :
                        Icons.visibility_off
                    ),
                    onPressed: _togglePasswordObscureText,
                  )
              ),
              obscureText: _isPasswordTextObscure,
              validators: [
                FormBuilderValidators.required(errorText: "Ce champ est requis")
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: widget.onSignUpTapped,
                    child: Text("S'inscrire"),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                    child: Text("Se connecter"),
                  )
                ],
              ),
            ),
          ],
        ),
      )
  );

  void _togglePasswordObscureText() {
    setState(() => _isPasswordTextObscure = !_isPasswordTextObscure);
  }
}
