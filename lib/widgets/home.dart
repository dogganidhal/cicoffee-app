import 'package:cicoffee_app/widgets/hubs.dart';
import 'package:cicoffee_app/widgets/sessions.dart';
import 'package:cicoffee_app/widgets/settings.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
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
              label: 'Hubs'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant,
                color: _currentIndex == 1 ?
                  Theme.of(context).primaryColor :
                  Theme.of(context).unselectedWidgetColor,
              ),
              label: 'Pauses'
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
            Hubs(),
            Sessions(),
            Settings()
          ],
        )
    );
  }
}
