import 'dart:convert';

import 'package:cicoffee_app/service/storage.dart';
import 'package:meta/meta.dart';
import 'package:cicoffee_app/api/dto/member_dto.dart';
import 'package:cicoffee_app/api/dto/token_dto.dart';


class Session {
  static final String _kMember = "com.softkall.cicoffee.user";
  static final String _kToken = "com.softkall.cicoffee.credentials";

  final StorageService storageService;

  final Map<String, dynamic> _cacheMap = {
    _kMember: null,
    _kToken: null
  };

  Session({@required this.storageService});

  Future<MemberDto> getMember() async {
    final jsonString = await storageService.getStringAsync(_kMember);
    if (jsonString == null) {
      return null;
    }
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final MemberDto user = MemberDto.fromJson(jsonMap);
    _cacheMap[_kMember] = user;
    return user;
  }

  Future<void> setMember(MemberDto user) async {
    await storageService.setStringAsync(_kMember, json.encode(user.toJson()));
    _cacheMap[_kMember] = user;
  }

  Future<void> clearMember() async {
    await storageService.removeAsync(_kMember);
    _cacheMap[_kMember] = null;
  }

  Future<void> persistCredentials(TokenDto credentials) async {
    await storageService.setStringAsync(_kToken, json.encode(credentials.toJson()));
  }

  Future<TokenDto> getCredentials() async {
    final jsonString = await storageService.getStringAsync(_kToken);
    if (jsonString == null) {
      return null;
    }
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return TokenDto.fromJson(jsonMap);
  }

  Future<void> clearCredentials() async {
    await storageService.removeAsync(_kToken);
  }
}
