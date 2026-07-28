
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

  @override
  String toString() {

    return title+ showID.toString();
  }

}