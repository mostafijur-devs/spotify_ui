import 'package:app/data/data.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTap(
            iconData: Icons.home,
            title: 'Home',
            onpress: () {},
          ),
          _SideMenuIconTap(
            iconData: Icons.search,
            title: 'Search',
            onpress: () {},
          ),
          _SideMenuIconTap(
            iconData: Icons.audiotrack,
            title: 'Radio',
            onpress: () {},
          ),
          const SizedBox(height: 18.0),
          _LaybaryPlaysit(),
        ],
      ),
    );
  }
}

class _SideMenuIconTap extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onpress;

  const _SideMenuIconTap({
    super.key,
    required this.iconData,
    required this.title,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _LaybaryPlaysit extends StatefulWidget {
  const _LaybaryPlaysit({super.key});

  @override
  State<_LaybaryPlaysit> createState() => _LaybaryPlaysitState();
}

class _LaybaryPlaysitState extends State<_LaybaryPlaysit> {
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
    return Expanded(
      child: Scrollbar(
        controller: _scrollController,
        child: ListView(
          physics: CarouselScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map(
                      (e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 16.0,),
                _SongPlayLIst(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SongPlayLIst extends StatefulWidget {
  const _SongPlayLIst({super.key});

  @override
  State<_SongPlayLIst> createState() => _SongPlayLIstState();
}

class _SongPlayLIstState extends State<_SongPlayLIst> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'PLAYLISTS',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        ...playlists.map((e) => ListTile(dense: true,title: Text(e,style: Theme.of(context).textTheme.bodySmall,),),)
      ],
    );
  }
}
