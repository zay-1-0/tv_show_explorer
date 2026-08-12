import 'dart:convert';

import 'package:http/http.dart';

class ApiService {

  ApiService();

  static const String baseUrl='api.tvmaze.com';


  Future<Map?> fetchShow(int id) async {

    Uri showUrl=Uri.https(baseUrl, 'shows/$id');
    Response urlResponse=await get(showUrl);
    if(urlResponse.statusCode==200) {
      final data = jsonDecode(urlResponse.body);
      return data;
    }else{
      return null;
    }
  }

  Future<String?> fetchPosterUrl(int showId) async {
    final uri = Uri.https(baseUrl, 'shows/$showId/images');

    final response = await get(uri);

    if (response.statusCode != 200) {
      return null;
    }

    final List<dynamic> posterData = jsonDecode(response.body);

    if (posterData.isEmpty) {
      return null;
    }

    final bg = posterData.firstWhere(
          (img) => img['type'] == 'background',
      orElse: () => posterData.first,
    );


    return bg['resolutions']?['original']?['url'];
  }

  Future<List<dynamic>?> fetchResultsbyPage(int pageNum) async {
    Uri pageUrl=Uri.https(baseUrl,'shows',{'page' : pageNum.toString()});
    Response pageResponse=await get(pageUrl);
    if(pageResponse.statusCode==200){
      final data=jsonDecode(pageResponse.body) as List;
      return data;
    }else{
      return null;
    }
    
  }

  Future<List<dynamic>?> fetchSearchResults(String query) async {

    Uri url=Uri.https('api.tvmaze.com','search/shows',{'q' : query});
    Response response= await get(url);
    final results = jsonDecode(response.body) as List;
    return results;

  }

}