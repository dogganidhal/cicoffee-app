import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/api/dto/create_session_dto.dart';
import 'package:cicoffee_app/api/dto/session_dto.dart';
import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:cicoffee_app/api/exception/api_exception.dart';
import 'package:cicoffee_app/service/session.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'session_store.g.dart';

class SessionStore = _SessionStore with _$SessionStore;

abstract class _SessionStore with Store {
  final ApiClient apiClient;
  final Session session;

  @observable
  bool loading = false;

  @observable
  List<SessionDto> sessions;

  @observable
  List<String> mutedSessions = List.empty(growable: true);

  @computed
  List<SessionDto> get incomingSessions => sessions
      .where((session) => session.incoming)
      .toList();

  @computed
  List<SessionDto> get ongoingSessions => sessions
      .where((session) => session.ongoing)
      .toList();

  @computed
  List<SessionDto> get pastSessions => sessions
      .where((sessions) => sessions.past)
      .toList();

  _SessionStore({@required this.apiClient, @required this.session}) {
    loadSessions();
  }

  @action
  Future loadSessions() async {
    loading = true;
    try {
      final member = await session.getMember();
      sessions = await apiClient.sessions.getMemberSessions();
      sessions = sessions
        .where((element) => !mutedSessions.contains(element.id))
        .toList();
      sessions.forEach((session) {
        final membersWithIdCount = session.participants
            .where((element) => element.id == member.id)
            .length;
        session.currentMemberParticipating = membersWithIdCount > 0;
        session.currentMemberCreator = session.author.id == member.id;
      });
    } on ApiError catch (apiError) {
      print(apiError);
    }
    loading = false;
  }

  @action
  Future createSession(TeamDto team, DateTime startDate, DateTime endDate) async {
    loading = true;
    try {
      await apiClient.sessions.createSession(CreateSessionDto(
          teamId: team.id,
          startDate: startDate,
          endDate: endDate
      ));
    } on ApiError catch (apiError) {
      print(apiError);
    }
    loadSessions();
  }

  @action
  Future muteSession(SessionDto session) async {
    loading = true;
    mutedSessions.add(session.id);
    sessions = sessions
      .where((element) => element.id != session.id)
      .toList();
    loading = false;
  }

  @action
  Future confirm(SessionDto session) async {
    loading = true;
    await apiClient.sessions.confirmParticipation(session.id);
    loadSessions();
  }

  @action
  Future retract(SessionDto session) async {
    loading = true;
    await apiClient.sessions.retractParticipation(session.id);
    loadSessions();
  }
}
