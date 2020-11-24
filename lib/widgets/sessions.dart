import 'package:cicoffee_app/api/dto/session_dto.dart';
import 'package:cicoffee_app/store/session/session_store.dart';
import 'package:cicoffee_app/widgets/session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get_it/get_it.dart';


class Sessions extends StatefulWidget {
  @override
  _SessionsState createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  final SessionStore sessionStore = GetIt.instance.get<SessionStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) => SafeArea(
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
                        "My Sessions",
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
              ...(
                  sessionStore.loading ?
                  [_loader] :
                  sessionStore.sessions.isEmpty ?
                  [_emptyPlaceholder] :
                  _sessions
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
      ),
    );
  }

  Widget _sliverList(List<SessionDto> sessions) => SliverPadding(
    padding: EdgeInsets.all(12),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: SessionCard(session: sessions[index]),
        ),
        childCount: sessions.length,
      ),
    ),
  );

  Widget _sectionStickyHeader(String title) => Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    color: Theme.of(context).backgroundColor,
    child: Text(
      title.toUpperCase(),
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16
      ),
    ),
  );

  List<Widget> get _sessions => [
    if (sessionStore.ongoingSessions.length > 0)
      SliverStickyHeader(
          header: _sectionStickyHeader("Ongoing"),
          sliver: _sliverList(sessionStore.ongoingSessions)
      ),
    if (sessionStore.incomingSessions.length > 0)
      SliverStickyHeader(
          header: _sectionStickyHeader("Incoming"),
          sliver: _sliverList(sessionStore.incomingSessions)
      ),
    if (sessionStore.pastSessions.length > 0)
      SliverStickyHeader(
        header: _sectionStickyHeader("Earlier this day"),
        sliver: _sliverList(sessionStore.pastSessions)
      )
  ];

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
              "No Sessions yet!",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              "You dont have any active or past sessions yet, you can create some",
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
}
