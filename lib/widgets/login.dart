import 'package:cicoffee_app/store/login/login_store.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:cicoffee_app/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';


class Login extends StatefulWidget {
  final loginStore = GetIt.instance.get<LoginStore>();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  bool _isPasswordTextObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 32,
              child: Image.asset(Assets.logo),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Pausa Café",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: _form(context)
      ),
    );
  }

  Widget _form(BuildContext context) => Observer(
    builder: (context) => FormBuilder(
        key: _formKey,
        child: ButtonTheme(
          height: 56,
          minWidth: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: ScrollColumnExpandable(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Login",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                FormBuilderTextField(
                  name: "email",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    labelText: "Email",
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context)
                  ])
                ),
                SizedBox(height: 24),
                FormBuilderTextField(
                  name: "password",
                  maxLines: 1,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    focusColor: Theme.of(context).primaryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    labelText: "Password",
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                          _isPasswordTextObscure ?
                          Icons.visibility :
                          Icons.visibility_off
                      ),
                      onPressed: _togglePasswordObscureText,
                    ),
                  ),
                  obscureText: _isPasswordTextObscure,
                  validator: FormBuilderValidators.required(context)
                ),
                SizedBox(height: 24),
                if (widget.loginStore.error != null)
                  ...[
                    Center(
                      child: Text(
                        widget.loginStore.error.message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(
                              color: Theme.of(context).errorColor,
                              fontSize: 16
                            ),
                      ),
                    ),
                    SizedBox(height: 24),
                //   ],
                // Center(
                //     child: Text(
                //       "Or, login with",
                //       style: Theme.of(context)
                //           .textTheme
                //           .caption
                //         .copyWith(fontSize: 16, fontWeight: FontWeight.w600)
                //     )
                // ),
                // SizedBox(height: 24),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     IconButton(
                //       icon: Image.asset(
                //         Assets.google,
                //         height: 36,
                //       ),
                //       onPressed: () {},
                //     ),
                //     SizedBox(width: 48),
                //     IconButton(
                //       icon: Image.asset(
                //           Assets.facebook,
                //           height: 36
                //       ),
                //       onPressed: () {},
                //     ),
                   ],
                // ),
                SizedBox(height: 24),
                Spacer(),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).backgroundColor,
                  onPressed: widget.loginStore.loading ?
                  null :
                  _login,
                  child: Text(
                      widget.loginStore.loading ?
                      "Loading" :
                      "Login"
                  ),
                ),
              ],
            ),
          ),
        )
    ),
  );

  void _login() {
    if (!_formKey.currentState.saveAndValidate()) {
      return;
    }
    final values = _formKey.currentState.value;
    final String email = values["email"];
    final String password = values["password"];
    var arguments = ModalRoute.of(context).settings.arguments;
    widget.loginStore.login(email, password);

  }

  void _togglePasswordObscureText() {
    setState(() => _isPasswordTextObscure = !_isPasswordTextObscure);
  }
}
