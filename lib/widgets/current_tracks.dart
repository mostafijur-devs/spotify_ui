import 'package:app/models/current_track_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CurrentTracks extends StatelessWidget {
  const CurrentTracks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [

              _TrackTnfo(),
            Spacer(),
            _PlayerController(),
            Spacer(),
            if(MediaQuery.of(context).size.width>800)
            _MoreControl(),
            if(MediaQuery.of(context).size.width<800)
            IconButton(icon: Icon(Icons.menu),onPressed: () {
              Scaffold.of(context).openDrawer();
            },)
          ],
        ),
      ),
    );
  }
}

class _PlayerController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.shuffle),
              iconSize: 20.0,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.skip_previous_outlined),
              iconSize: 20.0,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.play_circle_outline),
              iconSize: 34.0,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.skip_next_outlined),
              iconSize: 20.0,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.repeat),
              iconSize: 20.0,
            ),
          ],
        ),
        // SizedBox(height: 4.0,),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.titleSmall),
            SizedBox(width: 8.0),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ],
    );
  }
}

class _TrackTnfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60.0.h,
          width: 60.0.w,
          fit: BoxFit.cover,
        ),
         SizedBox(width: 12.0.w),
        if(MediaQuery.of(context).size.width>500)

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(selected.title, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4.0),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.grey[300],
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        if(MediaQuery.of(context).size.width>500)

        SizedBox(width: 10.0),
        if(MediaQuery.of(context).size.width>500)

        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
      ],
    );
  }
}

class _MoreControl extends StatelessWidget {
  const _MoreControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.devices_outlined),
          iconSize: 20.0,
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.volume_up_outlined)),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.fullscreen_outlined),
          iconSize: 20.0,
        ),
      ],
    );
  }
}
