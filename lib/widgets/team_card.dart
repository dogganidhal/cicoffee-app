import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:flutter/material.dart';


class TeamCard extends StatelessWidget {
  final TeamDto team;

  const TeamCard({Key key, @required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Theme.of(context).dividerColor)
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: IntrinsicHeight(
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
                    team.name.toUpperCase(),
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
                    "${team.members.length} members",
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
              if (team.currentMemberIsCreator)
                IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () {}
                ),
              IconButton(
                  icon: Icon(Icons.share),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {}
              ),
              IconButton(
                  icon: Icon(Icons.insert_invitation),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
