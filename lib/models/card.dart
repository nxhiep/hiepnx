import 'dart:convert';

import 'package:hiepnx/models/basic.dart';
import 'package:hiepnx/models/choice.dart';
import 'package:hiepnx/utils/configs.dart';

final String tableCard = 'Card';
final String _columnId = "id";
final String _columnStatus = "status";
final String _columnCode = "code";
final String _columnParentId = "parentId";
final String _columnType = "type";
final String _columnDifficultyLevel = "difficultyLevel";
final String _columnIndex = "index";
final String _columnFrontText = "frontText";
final String _columnFrontSound = "frontSound";
final String _columnFrontImage = "frontImage";
final String _columnFrontVideo = "frontVideo";
final String _columnFrontHint = "frontHint";
final String _columnBackText = "backText";
final String _columnBackImage = "backImage";
final String _columnBackSound = "backSound";
final String _columnBackVideo = "backVideo";
final String _columnBackHint = "backHint";

final String _columnChoiceIds = "choiceIds";

final String createCardTable = '''
  create table IF NOT EXISTS "$tableCard" (
    "$_columnId" integer primary key,
    "$_columnStatus" integer,
    "$_columnCode" text,
    "$_columnParentId" integer,
    "$_columnType" integer,
    "$_columnDifficultyLevel" integer,
    "$_columnIndex" integer,
    "$_columnFrontText" text,
    "$_columnFrontSound" text,
    "$_columnFrontImage" text,
    "$_columnFrontVideo" text,
    "$_columnFrontHint" text,
    "$_columnBackText" text,
    "$_columnBackImage" text,
    "$_columnBackSound" text,
    "$_columnBackVideo" text,
    "$_columnBackHint" text,
    "$_columnChoiceIds" text)
  ''';

class Card extends Base {

  int id;
  int status = INT_NULL;
  String code;
  int parentId = INT_NULL;
  int type = INT_NULL;
  int difficultyLevel = INT_NULL;
  int index = INT_NULL;

  String frontText = TEXT_EMPTY;
  String frontSound = TEXT_EMPTY;
  String frontImage = TEXT_EMPTY;
  String frontVideo = TEXT_EMPTY;
  String frontHint = TEXT_EMPTY;

  String backText = TEXT_EMPTY;
	String backImage = TEXT_EMPTY;
	String backSound = TEXT_EMPTY;
	String backVideo = TEXT_EMPTY;
	String backHint = TEXT_EMPTY;

  List<int> choiceIds = [];

  List<Choice> choices = [];

  Card(int id) : super(id);

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      _columnParentId: parentId,
      _columnStatus: status,
      _columnCode: code,
      _columnType: type,
      _columnDifficultyLevel: difficultyLevel,
      _columnIndex: index,
      _columnFrontText: frontText,
      _columnFrontImage: frontImage,
      _columnFrontSound: frontSound,
      _columnFrontVideo: frontVideo,
      _columnFrontHint: frontHint,
      _columnBackText: backText,
      _columnBackSound: backSound,
      _columnBackVideo: backVideo,
      _columnBackImage: backImage,
      _columnBackHint: backHint,
      _columnChoiceIds: choiceIds.toString()
    };
    if (id != null) {
      map[_columnId] = id;
    }
    return map;
  }

  Card.fromMap(Map<String, dynamic> map) : super(map[_columnId]) {
    id = map[_columnId] ?? INT_NULL;
    status = map[_columnStatus] ?? INT_NULL;
    code = map[_columnCode] ?? TEXT_EMPTY;
    parentId = map[_columnParentId] ?? INT_NULL;
    type = map[_columnType] ?? INT_NULL;
    difficultyLevel = map[_columnDifficultyLevel] ?? INT_NULL;
    index = map[_columnIndex] ?? INT_NULL;
    frontText = map[_columnFrontText] ?? TEXT_EMPTY;
    frontSound = map[_columnFrontSound] ?? TEXT_EMPTY;
    frontImage = map[_columnFrontImage] ?? TEXT_EMPTY;
    frontVideo = map[_columnFrontVideo] ?? TEXT_EMPTY;
    frontHint = map[_columnFrontHint] ?? TEXT_EMPTY;
    backText = map[_columnBackText] ?? TEXT_EMPTY;
    backImage = map[_columnBackImage] ?? TEXT_EMPTY;
    backSound = map[_columnBackSound] ?? TEXT_EMPTY;
    backVideo = map[_columnBackVideo] ?? TEXT_EMPTY;
    backHint = map[_columnBackHint] ?? TEXT_EMPTY;
    choiceIds = map[_columnChoiceIds] != null ? jsonDecode(map[_columnChoiceIds]).cast<int>() : [];
  }

  @override
  String toString() {
    return "Card: id = $id; parentId = $parentId; status = $status; code = $code";
  }
}