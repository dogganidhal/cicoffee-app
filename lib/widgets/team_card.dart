import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:cicoffee_app/store/session/session_store.dart';
import 'package:cicoffee_app/store/team/team_store.dart';
import 'package:cicoffee_app/store/invitation/email_invitation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:cicoffee_app/widgets/email_invitation_form.dart';
import 'package:cicoffee_app/widgets/invitation_qrcode_generator.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TeamCard extends StatefulWidget {
  final TeamDto team;


  TeamCard({Key key, @required this.team}) : super(key: key);

  @override
  _TeamCardState createState() => _TeamCardState();

}

class _TeamCardState extends State<TeamCard> {
  final NavigationStore navigationStore = GetIt.instance.get<NavigationStore>();
  final TeamStore teamStore = GetIt.instance.get<TeamStore>();
  final SessionStore sessionStore = GetIt.instance.get<SessionStore>();
  final EmailInvitationStore invitationEmail = GetIt.instance.get<EmailInvitationStore>();

  final GlobalKey<FormBuilderState> _createSessionFormKey = GlobalKey();

  DateTime _startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Theme.of(context).dividerColor)
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 4,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.team.name.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${widget.team.members.length} members",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  if (widget.team.currentMemberIsCreator)
                    IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => _delete(context)
                    ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              child: ButtonTheme(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () => _inviteToSession(context),
                      icon: Icon(Icons.mail),
                      label: Text("Invite".toUpperCase()),
                    ),
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () => _createSession(context),
                      icon: Icon(Icons.add),
                      label: Text("Session".toUpperCase()),
                    ),
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      textColor: Theme.of(context).errorColor,
                      onPressed: () => _leave(context),
                      icon: Icon(Icons.logout),
                      label: Text("Leave".toUpperCase()),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _delete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        title: Center(
          child: Text(
            "DELETE TEAM".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "Are you sure you want to delete team \"${widget.team.name}\"?\n"
                "This action is not reversible.",
              style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
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
                      onPressed: navigationStore.pop,
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
                      color: Theme.of(context).errorColor,
                      textColor: Theme.of(context).backgroundColor,
                      onPressed: () {
                        navigationStore.pop();
                        teamStore.removeTeam(widget.team);
                      },
                      child: Text("Delete".toUpperCase()),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _leave(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        title: Center(
          child: Text(
            "LEAVE TEAM".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "Are you sure you want to leave team \"${widget.team.name}\"?\n"
                "You can always rejoin when you want to.",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),
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
                      onPressed: navigationStore.pop,
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
                      color: Theme.of(context).errorColor,
                      textColor: Theme.of(context).backgroundColor,
                      onPressed: () {
                        navigationStore.pop();
                        teamStore.leaveTeam(widget.team);
                      },
                      child: Text("Leave".toUpperCase()),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _createSession(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        title: Center(
          child: Text(
            "New session".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        content: FormBuilder(
          key: _createSessionFormKey,
          initialValue: {
            "startDate": DateTime.now(),
            "endDate": DateTime.now().add(Duration(minutes: 10))
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilderDateTimePicker(
                name: "startDate",
                firstDate: DateTime.now(),
                format: DateFormat("dd/MM/yyyy HH:mm"),
                inputType: InputType.both,
                onChanged: (dateTime) => setState(() => _startDate = dateTime),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: "Start date",
                ),
              ),
              SizedBox(height: 24),
              FormBuilderDateTimePicker(
                name: "endDate",
                firstDate: _startDate.add(Duration(minutes: 10)),
                inputType: InputType.both,
                cursorRadius: Radius.circular(24),
                cursorColor: Theme.of(context).primaryColor,
                format: DateFormat("dd/MM/yyyy HH:mm"),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: "End date",
                ),
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
                        onPressed: navigationStore.pop,
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
                          if (!_createSessionFormKey.currentState.saveAndValidate()) {
                            return;
                          }
                          final values = _createSessionFormKey.currentState.value;
                          final DateTime startDate = values["startDate"].toUtc();
                          final DateTime endDate = values["endDate"].toUtc();
                          navigationStore.pop();
                          sessionStore.createSession(widget.team, startDate, endDate);
                        },
                        child: Text("Create".toUpperCase()),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _inviteToSession(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
        ),
        builder: (ctx) {
          return IntrinsicHeight(
            child: Container(
            padding: EdgeInsets.all(16),
            child:
             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Center(
                child: Text(
                  "Invite with".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).unselectedWidgetColor
                  ),
                ),
              ),
              SizedBox(height: 32),
              Container(
                child:
                  ButtonTheme(
                  height: 56,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).backgroundColor,
                    onPressed: () {
                      _emailInvite(context);
                    },
                    child: Text("Email".toUpperCase()),
                  ),
                ),
              ),
                SizedBox(height: 16),
              Container(
                child:
                  ButtonTheme(
                height: 56,
                padding: EdgeInsets.all(16),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                  ),
                  color: Theme.of(context).primaryColor.withOpacity(0.15),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/invitation-qr/${widget.team.id}');
                    //_codeQRInvite(context);
                  },
                  child: Text("QR Code".toUpperCase()),
                ),
              ),
              ),

            ],
             ),
            ),
          );
        });
  }

  void _emailInvite(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        title: Center(
          child: Text(
            "email invitation".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        content: EmailInvitationForm(team: widget.team),
      ),
    );
  }

}
