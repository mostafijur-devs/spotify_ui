import 'package:app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayListHeader extends StatelessWidget {
  const PlayListHeader({super.key, required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    bool ismobileSize = MediaQuery.of(context).size.width<500;

    return Column(
      children: [
        Row(
          children: [
            Image.asset(

              // alignment: Alignment.center,
              playlist.imageURL,
              height: 200.0,
              width: ismobileSize?MediaQuery.of(context).size.width*0.88:200.0,
              fit: BoxFit.cover,
            ),
            if(MediaQuery.of(context).size.width>500)
            const SizedBox(width: 16.0),
            if(MediaQuery.of(context).size.width>500)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(fontSize: 12.0),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Created by ${playlist.creator} * ${playlist.songs.length} songs, ${playlist.duration}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        if(MediaQuery.of(context).size.width<500)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PLAYLIST',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 12.0),
              ),
              const SizedBox(height: 12.0),
              Text(
                playlist.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 12.0),
              Text(
                playlist.description,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Created by ${playlist.creator} * ${playlist.songs.length} songs, ${playlist.duration}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),


        _PlaylistButton(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButton extends StatelessWidget {
  final String followers;

  const _PlaylistButton({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 18.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,

            // iconColor: Colors.white,
            // overlayColor: Colors.white,
            textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 12.0,
              letterSpacing: 2.0,
            ),
          ),
          onPressed: () {},
          child: const Text('Play', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
          iconSize: 30.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          iconSize: 30.0,
        ),
        const Spacer(),
        Text('FOLLWERS \n$followers',style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 12.0),
        textAlign:TextAlign.right,),

      ],
    );
  }
}
