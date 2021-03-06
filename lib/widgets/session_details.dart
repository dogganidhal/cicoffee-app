import 'package:cicoffee_app/store/participant_order/participant_order_store.dart';
import 'package:cicoffee_app/store/session_details/session_details_store.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:cicoffee_app/widgets/status.dart';
import 'package:cicoffee_app/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';

class SessionDetails extends StatefulWidget {
  final String sessionId;

  SessionDetails({Key key, @required this.sessionId}) : super(key: key);

  @override
  _SessionDetailsState createState() => _SessionDetailsState();
}

class _SessionDetailsState extends State<SessionDetails> {
  final SessionDetailsStore sessionDetailsStore =
      GetIt.instance.get<SessionDetailsStore>();
  final ParticipantOrderStore participantOrderStore =
      GetIt.instance.get<ParticipantOrderStore>();

  @override
  void initState() {
    super.initState();
    sessionDetailsStore.loadParticipants(widget.sessionId);
    participantOrderStore.loadProducts();
  }

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
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: Observer(builder: (context) {
        if (sessionDetailsStore.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) =>
                _participantOrders(sessionDetailsStore.participants[index]),
            separatorBuilder: (context, _) => SizedBox(height: 12),
            itemCount: sessionDetailsStore.participants.length);
      }),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        overlayColor: Theme.of(context).shadowColor,
        overlayOpacity: 0.4,
        onPress: () =>
            {Navigator.pushNamed(context, "products/${widget.sessionId}")},
      ),
    );
  }

  Widget _participantOrders(ParticipantOrders participantOrders) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Theme.of(context).dividerColor)),
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
                          color: participantOrders.confirmed ?
                            Theme.of(context).primaryColor :
                            Theme.of(context).unselectedWidgetColor,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(width: 12),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            participantOrders.member.firstName +
                                " " +
                                participantOrders.member.lastName,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 12),

                        ],
                      ),
                    ),
                    Status(selected: participantOrders.confirmed,
                        selectedText: "Participating",
                        unselectedText: "Not participating"
                    ),
                  ],
                ),

              ),
              participantOrders.order != null && participantOrders.confirmed ? OrderItem(order: participantOrders.order) : Container(),
            ],
          ),
        ),
      );
}
