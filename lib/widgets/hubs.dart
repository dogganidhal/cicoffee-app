import 'package:cicoffee_app/store/hubs/hub_store.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:cicoffee_app/widgets/team_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';


class Hubs extends StatefulWidget {
  final HubStore hubStore = GetIt.instance.get<HubStore>();
  final NavigationStore navigationStore = GetIt.instance.get<NavigationStore>();

  @override
  _HubsState createState() => _HubsState();
}

class _HubsState extends State<Hubs> {
  final GlobalKey<FormBuilderState> _addTeamFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Observer(
        builder: (context) => widget.hubStore.loading ?
            _loader :
            widget.hubStore.teams.isEmpty ?
                _emptyPlaceholder :
                _teams
      ),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        children: [
          SpeedDialChild(
              child: Icon(Icons.create),
              backgroundColor: Theme.of(context).primaryColor,
              labelWidget: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Create team".toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              onTap: _createTeam
          ),
          SpeedDialChild(
            child: Icon(Icons.login),
            backgroundColor: Theme.of(context).primaryColor,
            labelWidget: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Join team".toUpperCase(),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            onTap: _joinTeam,
          ),
        ],
      ),
    );
  }

  Widget get _teams => ListView.separated(
    padding: EdgeInsets.all(12),
    itemBuilder: (context, index) => TeamCard(team: widget.hubStore.teams[index]),
    separatorBuilder: (context, index) => SizedBox(height: 12),
    itemCount: widget.hubStore.teams.length
  );

  Widget get _loader => Center(
    child: CircularProgressIndicator(),
  );

  Widget get _emptyPlaceholder => Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "No hubs!",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 8),
          Text(
            "You're not yet a member of any hub, try to add or join a team",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(
                color: Theme.of(context).unselectedWidgetColor,
                fontSize: 14
            ),
          )
        ],
      ),
    ),
  );

  void _createTeam() {
    showDialog(
      context: context,
      builder: (context) => ButtonTheme(
        height: 56,
        minWidth: double.infinity,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          title: Center(
            child: Text(
              "Create team".toUpperCase(),
              style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(
                  fontWeight: FontWeight.w600
                ),
            ),
          ),
          content: FormBuilder(
            key: _addTeamFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 12),
                FormBuilderTextField(
                  attribute: "teamName",
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    labelText: "Team name",
                  ),
                  validators: [
                    FormBuilderValidators.required()
                  ],
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
                          color: Theme.of(context).primaryColor.withOpacity(0.25),
                          textColor: Theme.of(context).primaryColor,
                          onPressed: widget.navigationStore.pop,
                          child: Text("Cancel"),
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
                            if (!_addTeamFormKey.currentState.saveAndValidate()) {
                              return;
                            }
                            final values = _addTeamFormKey.currentState.value;
                            final String teamName = values["teamName"];

                            widget.navigationStore.pop();
                            widget.hubStore.addTeam(teamName);
                          },
                          child: Text("Create"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  void _joinTeam() {

  }
}
