import 'package:cicoffee_app/api/dto/session_dto.dart';
import 'package:cicoffee_app/store/session/session_store.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';


class SessionCard extends StatelessWidget {
  final NavigationStore navigationStore = GetIt.instance.get<NavigationStore>();
  final SessionStore sessionStore = GetIt.instance.get<SessionStore>();

  final SessionDto session;

  final GlobalKey<FormBuilderState> _createSessionFormKey = GlobalKey();

  SessionCard({Key key, @required this.session}) : super(key: key);

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
                        session.team.name.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 4),
                      _participants(context),
                      SizedBox(height: 4),
                      _startDateWidget(context),
                      SizedBox(height: 4),
                      _duration(context),
                    ],
                  ),
                  Spacer(),

                ],
              ),
            ),
            if (session.ongoing || session.incoming)
              ...[
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
                          textColor: Theme.of(context).unselectedWidgetColor,
                          onPressed: () {},
                          icon: Icon(Icons.history),
                          label: Text("Maybe later".toUpperCase()),
                        ),
                        FlatButton.icon(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {},
                          icon: Icon(Icons.check),
                          label: Text("Confirm".toUpperCase()),
                        ),
                      ],
                    ),
                  ),
                )
              ]
          ],
        ),
      ),
    );
  }

  Widget _duration(BuildContext context) => Text.rich(
    TextSpan(
      text: "Duration : ",
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
          ),
      children: [
        TextSpan(
          text: printDuration(session.endDate.difference(session.startDate)),
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .color
              )
        )
      ]
    )
  );

  Widget _participants(BuildContext context) => Text.rich(
    TextSpan(
      text: "Participants : ",
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
          ),
      children: [
        TextSpan(
          text: "${session.participants.length}",
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .color
              )
        )
      ]
    )
  );

  Widget _startDateWidget(BuildContext context) {
    final now = DateTime.now();
    final textStyle = Theme.of(context)
        .textTheme
        .caption
        .copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500
        );
    final valueStyle = textStyle
      .copyWith(
        color: Theme.of(context)
            .textTheme
            .bodyText1
            .color
      );
    if (session.startDate.isAfter(now)) {
      return Text.rich(
        TextSpan(
          text: "Starts in ",
          style: textStyle,
          children: [
            TextSpan(
              text: printDuration(session.startDate.difference(now), tersity: DurationTersity.minute),
              style: valueStyle
            )
          ]
        ),
      );
    }
    if (session.endDate.isAfter(now)) {
      return Text.rich(
        TextSpan(
            text: "Started ",
            style: textStyle,
            children: [
              TextSpan(
                text: printDuration(now.difference(session.startDate), tersity: DurationTersity.minute),
                style: valueStyle,
                children: [
                  TextSpan(
                    text: " ago",
                    style: textStyle,
                  )
                ]
              ),
            ]
        ),
      );
    }
    return Text.rich(
      TextSpan(
          text: "Finished ",
          style: textStyle,
          children: [
            TextSpan(
              text: printDuration(now.difference(session.endDate), tersity: DurationTersity.minute),
              style: valueStyle,
              children: [
                TextSpan(
                  text: " ago",
                  style: textStyle
                )
              ]
            )
          ]
      ),
    );
  }
}
