import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:cicoffee_app/store/invitation/email_invitation.dart';
import 'package:get_it/get_it.dart';


class EmailInvitationForm extends StatelessWidget {
  final TeamDto team;

  final GlobalKey<FormBuilderState> _inviteEmailFormKey = GlobalKey();

  final EmailInvitationStore _invitationEmail = GetIt.instance.get<EmailInvitationStore>();
  final NavigationStore _navigationStore = GetIt.instance.get<NavigationStore>();

  EmailInvitationForm({Key key, @required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          return FormBuilder(
            key: _inviteEmailFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                Container(
                  child: FormBuilderTextField(
                      name: "email",
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        focusColor: Theme.of(context).primaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        labelText: "Email",
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.send),
                          onPressed: () {
                            if (!_inviteEmailFormKey.currentState.saveAndValidate()) {
                              return;
                            }
                            final data = _inviteEmailFormKey.currentState.value;
                            final email = data["email"];
                            _invitationEmail.addEmail(email);
                            _inviteEmailFormKey.currentState.reset();
                          },
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context)
                      ])
                  ),
                ),
                SizedBox(height: 24),
                Wrap(
                  direction: Axis.vertical,
                  children: _invitationEmail.values
                    .map((email) => InputChip(
                        label: Text(email),
                        elevation: 0,
                        onDeleted: () {
                          _invitationEmail.removeEmail(email);
                        }
                    ))
                    .toList(),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ButtonTheme(
                        height: 56,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                          ),
                          color: Theme.of(context).primaryColor.withOpacity(0.15),
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            _invitationEmail.removeAll();
                            _navigationStore.pop();
                          },
                          child: Text("Cancel".toUpperCase()),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: ButtonTheme(
                        height: 56,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                          ),
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).backgroundColor,
                          onPressed: () {
                            _invitationEmail.sendInvitations();
                            _navigationStore.pop();
                          },
                          child: Text("Invite".toUpperCase()),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}