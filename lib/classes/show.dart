
import 'package:isar_community/isar.dart';



part 'show.g.dart';

@Collection()
class Show{


  final Id showID;
  final String title;
  final String imageURL;
  String posterURL='';
  final double rating;
  final int runTimeStart;
  final int runTimeEnd;
  final List<String> genres;
  final String summary;
  final String timeOfShowing;
  final List<String> daysOfShowing;
  final String network;
  final String status;
  final int runtime;

  @Index(type: IndexType.value)
  bool isFavorite=false;

  Show(
      {
        required this.showID,
        required this.title,
        required this.imageURL,
        required this.rating,
        required this.runTimeStart,
        required this.runTimeEnd,
        required this.genres,
        required this.summary,
        required this.timeOfShowing,
        required this.daysOfShowing,
        required this.network,
        required this.status,
        required this.runtime
      }
      );


  factory Show.fromJson(Map data){

    String tempSummary;
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    tempSummary=data['summary']?.replaceAll(exp, '')??'';

    return Show(
        showID: data['id']??0,
        title: data['name']??'',
        imageURL: data['image']?['medium']?? '',
        rating: ((data['rating']?['average']?? 0) as num).toDouble(),
        runTimeStart: int.tryParse((data['premiered']?.substring(0, 4)) ?? '') ?? 0,
        runTimeEnd:  int.tryParse((data['ended']?.substring(0, 4)) ?? '') ?? 0,
        genres:List<String>.from(data['genres']??[]),
        summary: tempSummary,
        timeOfShowing: data['schedule']?['time']?? '',
        daysOfShowing:List<String>.from(data['schedule']?['days']??[]),
        network:data['network']?['name']?? '',
        status: (int.tryParse((data['ended']?.substring(0, 4)) ?? '') ?? 0)==0 ? 'Running' : 'Ended',
        runtime : data['runtime']?? 0
    );
  }

  factory Show.empty() {
    return Show(
      showID: 0,
      title: 'Unknown Show',
      imageURL: '',
      rating: 0,
      runTimeStart: 0,
      runTimeEnd: 0,
      genres: [],
      summary: '',
      timeOfShowing: '',
      daysOfShowing: [],
      network: '',
      status: '',
      runtime: 0,
    );
  }

  @override
  String toString() {

    return title+ showID.toString();
  }

}

extension ShowImages on Show {

  /// TVMaze serves the same upload at several resolutions under a predictable
  /// path segment, so the list thumbnail can be upgraded without the extra
  /// `/shows/{id}/images` request that [Show.posterURL] needs.
  ///
  /// Callers should fall back to [Show.imageURL] if this URL fails to load.
  String get bannerURL => imageURL.contains('medium_portrait')
      ? imageURL.replaceFirst('medium_portrait', 'original_untouched')
      : imageURL;
}

extension ShowFormatting on Show {

  /// Streaming shows drop a whole season at once, so TVMaze gives them an
  /// empty `schedule.days`. Reading `.first` on that throws, so every caller
  /// must go through here.
  String get scheduleLabel {
    if (daysOfShowing.isEmpty) {
      return timeOfShowing.isEmpty ? 'Streaming' : timeOfShowing;
    }
    return timeOfShowing.isEmpty
        ? daysOfShowing.first
        : '${daysOfShowing.first}, $timeOfShowing';
  }

  /// `runTimeEnd` stays 0 while a show is still running, which would otherwise
  /// render as "2008 - 0".
  String get yearsLabel {
    if (runTimeStart == 0) return '';
    return runTimeEnd == 0
        ? '$runTimeStart – Present'
        : '$runTimeStart – $runTimeEnd';
  }

  String get runtimeLabel => runtime == 0 ? '—' : '$runtime mins';

  String get networkLabel => network.isEmpty ? '—' : network;

  String get statusLabel => status.isEmpty ? '—' : status;
}