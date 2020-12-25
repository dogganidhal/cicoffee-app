import 'package:cicoffee_app/widgets/teams.dart';
import 'package:cicoffee_app/widgets/sessions.dart';
import 'package:cicoffee_app/widgets/settings.dart';
import 'package:cicoffee_app/store/team/team_store.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  final teamStore = GetIt.instance.get<TeamStore>();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
                color: _currentIndex == 0 ?
                  Theme.of(context).primaryColor :
                  Theme.of(context).unselectedWidgetColor,
              ),
              label: 'My teams'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant,
                color: _currentIndex == 1 ?
                  Theme.of(context).primaryColor :
                  Theme.of(context).unselectedWidgetColor,
              ),
              label: 'Sessions'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _currentIndex == 2 ?
                  Theme.of(context).primaryColor :
                  Theme.of(context).unselectedWidgetColor,
              ),
              label: 'Settings'
          )
        ],
      ),
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            Teams(),
            Sessions(),
            Settings()
          ],
        )
    );
  }
}
