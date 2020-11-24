import 'dart:ui';
import 'package:cicoffee_app/store/team/team_store.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:cicoffee_app/widgets/team_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';


class Teams extends StatefulWidget {
  final TeamStore teamStore = GetIt.instance.get<TeamStore>();
  final NavigationStore navigationStore = GetIt.instance.get<NavigationStore>();

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  final GlobalKey<FormBuilderState> _addTeamFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              centerTitle: false,
              elevation: 0,
              forceElevated: false,
              bottom: PreferredSize(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        "My Teams",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor
                        ),
                      ),
                    ),
                  ),
                  preferredSize: Size(0, 72)
              ),
            ),
            Observer(
                builder: (context) => widget.teamStore.loading ?
                _loader :
                widget.teamStore.teams.isEmpty ?
                _emptyPlaceholder :
                _teams
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        overlayColor: Theme.of(context).shadowColor,
        overlayOpacity: 0.4,
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
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).backgroundColor
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
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).backgroundColor
                ),
              ),
            ),
            onTap: _joinTeam,
          ),
        ],
      ),
    );
  }

  Widget get _teams => SliverPadding(
    padding: EdgeInsets.only(top: 12, left: 12, right: 12),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: TeamCard(
            team: widget.teamStore.teams[index]
          ),
        ),
        childCount: widget.teamStore.teams.length,
      ),
    ),
  );

  Widget get _loader => SliverFillRemaining(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );

  Widget get _emptyPlaceholder => SliverFillRemaining(
    child: Center(
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
                  name: "teamName",
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
                  validator: FormBuilderValidators.required(context)
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
                            widget.teamStore.addTeam(teamName);
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
