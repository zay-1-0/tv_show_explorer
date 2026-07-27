import 'dart:convert';

import 'package:http/http.dart';

class ApiService {

  static const String baseUrl='api.tvmaze.com';


  static Future<Map?> fetchShow(int id) async {

    Uri showUrl=Uri.https(baseUrl, 'shows/$id');
    Response urlReponse=await get(showUrl);
    if(urlReponse.statusCode==200) {
      final data = jsonDecode(urlReponse.body);
      return data;
    }else{
      return null;
    }
  }

  Future<List<dynamic>?> fetchResultsbyPage(int pageNum) async {
    Uri pageUrl=Uri.https(baseUrl,'shows',{'page' : pageNum});
    Response pageResponse=await get(pageUrl);
    if(pageResponse.statusCode==200){
      final data=jsonDecode(pageResponse.body) as List;
      return data;
    }else{
      return null;
    }
    
  }

}