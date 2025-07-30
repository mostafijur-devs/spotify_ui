import 'package:flutter/material.dart';

import '../data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
Song? selected;
List<Playlist> playlist = homePlaylist;
int playItemNumber = 0;

get playItem {
  playItemNumber;
  notifyListeners();
}

get playItemIncuressing {
  if(playItemNumber<2){
    playItemNumber++;
    notifyListeners();
  }
}
get playItemdiscures {
  if(playItemNumber>0 ){
    playItemNumber--;
    notifyListeners();
  }
}

void selectedTrack(Song track){
  selected = track;
  notifyListeners();
}


}
