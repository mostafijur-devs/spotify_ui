import 'package:flutter/material.dart';

import '../data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
Song? selected;

void selectedTrack(Song track){
  selected = track;
  notifyListeners();
}

}
