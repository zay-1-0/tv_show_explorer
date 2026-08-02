

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../classes/show.dart';

final selectedShowProvider = NotifierProvider<SelectedShow, Show?>(SelectedShow.new);


class SelectedShow extends Notifier<Show?>{

  @override
  Show? build() {
    return null;
  }

  void selectNewShow(Show show){
    state =show;
  }

  void deselectShow(){
    state=null;
  }

}