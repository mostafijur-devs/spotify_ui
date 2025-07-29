import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../widgets/current_tracks.dart';
import '../../widgets/side_menu.dart';
import '../play_list_screen.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer:SideMenu() ,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800)
                  SideMenu(),
                   Expanded(
                    child: PlayListScreen(playlist: lofihiphopPlaylist)),
              ],
            ),
          ),
          CurrentTracks(),
        ],
      ),
    );
  }
}
