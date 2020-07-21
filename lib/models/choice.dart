import 'package:hiepnx/models/basic.dart';
import 'package:hiepnx/utils/configs.dart';

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

}