import 'package:flutter/material.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:cicoffee_app/widgets/scroll_column_expandable.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:cicoffee_app/store/reset_password/reset_password_store.dart';

class ResetPassword extends StatefulWidget {
  final resetPasswordStore = GetIt.instance.get<ResetPasswordStore>();

  @override
  _ResetPassword createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

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
        child: _form(context),
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
                    "Reset Password",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(height: 48),
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
                    validator:
                      FormBuilderValidators.email(context)

                ),
                SizedBox(height: 48),
                Spacer(),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).backgroundColor,
                  onPressed: widget.resetPasswordStore.loading ?
                    null :
                    _resetPassword,
                    child: Text(
                        widget.resetPasswordStore.loading ?
                        "Loading" :
                        "Submit"
                    ),
                ),
               ]
            ),
          ),
        )
    ),
  );
  void _resetPassword() {
    if (!_formKey.currentState.saveAndValidate()) {
      return;
    }
    final values = _formKey.currentState.value;
    final String email = values["email"];
    widget.resetPasswordStore.resetPassword(email);
    Navigator.popAndPushNamed(context, '/login');
  }

}