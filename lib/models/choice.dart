import 'package:hiepnx/models/basic.dart';
import 'package:hiepnx/utils/configs.dart';

final String tableChoice = 'Choice';
final String _columnId = "id";
final String _columnStatus = "status";
final String _columnParentId = "parentId";
final String _columnCorrect = "correct";
final String _columnFrontText = "frontText";
final String _columnFrontSound = "frontSound";
final String _columnFrontImage = "frontImage";
final String _columnFrontVideo = "frontVideo";
final String _columnFrontHint = "frontHint";

final String createChoiceTable = '''
  create table IF NOT EXISTS "$tableChoice" (
    "$_columnId" integer primary key,
    "$_columnStatus" integer,
    "$_columnCorrect" integer,
    "$_columnParentId" integer,
    "$_columnFrontText" text,
    "$_columnFrontSound" text,
    "$_columnFrontImage" text,
    "$_columnFrontVideo" text,
    "$_columnFrontHint" text)
  ''';

class Choice extends Base {
  int id;
	int parentId = INT_NULL; // cardId
	int status = INT_NULL;
	bool correct = false;
	
	String frontText = TEXT_EMPTY;
	String frontImage = TEXT_EMPTY;
  String frontSound = TEXT_EMPTY;
	String frontVideo = TEXT_EMPTY;
	String frontHint = TEXT_EMPTY;

  Choice(int id) : super(id);

@override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      _columnParentId: parentId,
      _columnStatus: status,
      _columnFrontText: frontText,
      _columnFrontImage: frontImage,
      _columnFrontSound: frontSound,
      _columnFrontVideo: frontVideo,
      _columnFrontHint: frontHint,
      _columnCorrect: correct == true ? 1 : 0
    };
    if (id != null) {
      map[_columnId] = id;
    }
    return map;
  }

  Choice.fromMap(Map<String, dynamic> map) : super(map[_columnId]) {
    id = map[_columnId] ?? INT_NULL;
    status = map[_columnStatus] ?? INT_NULL;
    parentId = map[_columnParentId] ?? INT_NULL;
    correct = map[_columnCorrect] == 1;
    frontText = map[_columnFrontText] ?? TEXT_EMPTY;
    frontSound = map[_columnFrontSound] ?? TEXT_EMPTY;
    frontImage = map[_columnFrontImage] ?? TEXT_EMPTY;
    frontVideo = map[_columnFrontVideo] ?? TEXT_EMPTY;
    frontHint = map[_columnFrontHint] ?? TEXT_EMPTY;
  }

  @override
  String toString() {
    return "Choice: id = $id; parentId = $parentId; correct = $correct; frontText = $frontText";
  }
}