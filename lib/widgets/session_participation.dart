import 'package:cicoffee_app/api/dto/session_dto.dart';
import 'package:flutter/material.dart';


class SessionParticipationStatus extends StatelessWidget {
  final SessionDto session;

  const SessionParticipationStatus({
    Key key,
    @required this.session
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = session.currentMemberParticipating ?
      Colors.green :
      Theme.of(context).unselectedWidgetColor;
    final text = session.currentMemberParticipating ?
        session.currentMemberCreator ?
            "Leader" :
            "Accepted" :
        session.past ?
          "Missed" :
          "Pending";
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1.5)
      ),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(
              color: color,
              fontWeight: FontWeight.bold
            ),
        ),
      ),
    );
  }
}
