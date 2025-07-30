import 'package:app/data/data.dart';
import 'package:app/models/current_track_model.dart';
import 'package:app/widgets/play_list_header.dart';
import 'package:app/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/tracks_list.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key, required this.playlist, required this.context});

  final Playlist playlist;
  final BuildContext context;


  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {

  ScrollController? _scrollController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController?.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: SideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  context.read<CurrentTrackModel>().playItemdiscures;
                  print('playItem${context.read<CurrentTrackModel>().playItemNumber}');

                },
                child: Container(
                  padding: EdgeInsetsGeometry.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.chevron_left, size: 28.0),
                ),
              ),
              const SizedBox(width: 16.0),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  context.read<CurrentTrackModel>().playItemIncuressing;
                  print('playItem${context.read<CurrentTrackModel>().playItemNumber}');
                },
                child: Container(
                  padding: EdgeInsetsGeometry.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.chevron_right, size: 28.0),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(
                context,
              ).iconTheme.color?.withOpacity(0.09),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30.0,
              color: Theme.of(context).iconTheme.color,
            ),
            label: Text(
              'Mostafijur Rahaman',
              style: TextStyle(color: Theme.of(context).iconTheme.color),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            padding: EdgeInsets.only(),
            onPressed: () {},

            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30.0,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          const SizedBox(width: 15.0),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFAF1018),
              Theme.of(context).colorScheme.background,
            ],
            stops: [0, 0.3],
          ),
        ),
        child: Scrollbar(
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 60.0),
            children: [
              PlayListHeader(playlist: widget.playlist),
              TracksList(tracks: widget.playlist.songs,),

            ],
          ),
        ),
      ),
    );
  }
}
