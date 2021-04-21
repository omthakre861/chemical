import 'package:bloc/bloc.dart';
import 'package:chemical/jsondata/meltingpoint.dart';
import 'package:chemical/jsondata/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'search_auto/search_autocomplete.dart';
import 'search_auto/search_services.dart';

class InfoEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchInfo extends InfoEvent {
  final _compoundid;

  FetchInfo(this._compoundid);

  @override
  // TODO: implement props
  List<Object> get props => [];
}



class ResetInfo extends InfoEvent {}

class InfoState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class InfoisnotSearch extends InfoState {}

class InfoIsLoading extends InfoState {}

class InfoisLoaded extends InfoState {
  final _information;

  InfoisLoaded(this._information);
  @override
  // TODO: implement props
  List<Object> get props => [_information];

  Info get getinfo => _information;
}

class InfoisNotLoaded extends InfoState {}

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoRepo infoRepo;
  

  InfoBloc({@required this.infoRepo}) : super(InfoisnotSearch());

  @override
  Stream<InfoState> mapEventToState(InfoEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchInfo) {
      yield InfoIsLoading();

      try {
        Info information = await infoRepo.getInfo(event._compoundid);
        yield InfoisLoaded(information);
      } catch (_) {
        yield InfoisNotLoaded();
      }
    }  else if (event is ResetInfo) {
      yield InfoisnotSearch();
    }
  }
}
