import 'package:app/data/data.dart';
import 'package:app/models/current_track_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TracksList extends StatelessWidget {
  const TracksList({super.key, required this.tracks});

  final List<Song> tracks;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      dataRowHeight: 54.0,
      headingTextStyle: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 12.0),
      columns: [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      // border: TableBorder(
      //   horizontalInside: BorderSide(color: Colors.black),
      //   verticalInside: BorderSide(color: Colors.black),
      //
      // ),
      rows: tracks.map((e) {
        final selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle =  TextStyle(color:selected ? Theme.of(context).colorScheme.secondary: Theme.of(context).iconTheme.color);
        return DataRow(

          cells: [
            DataCell(
              Text(
                e.title,
                style:textStyle,
              ),
            ),
            DataCell(
              Text(
                e.artist,
                style: textStyle,
              ),
            ),
            DataCell(
              Text(
                e.album,
                style: textStyle,
              ),
            ),
            DataCell(
              Text(
                e.duration,
                style: textStyle,
              ),
            ),
          ],
          selected: selected,
          onSelectChanged: (value) => context.read<CurrentTrackModel>().selectedTrack(e),
        );
      }).toList(),
    );
  }
}
