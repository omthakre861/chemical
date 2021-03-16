import 'package:bloc/bloc.dart';
import 'package:chemical/jsondata/search_auto/searchbloc.dart';
import 'package:equatable/equatable.dart';

import 'compound_id_services.dart';

class CompoundIdEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchCompoundID extends CompoundIdEvent {
  final _searchID;

  FetchCompoundID(this._searchID);
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CompoundIdState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AutoCompleteTileisActive extends CompoundIdState {
  final _searchCompoundId;

  AutoCompleteTileisActive(this._searchCompoundId);

  @override
  // TODO: implement props
  List<Object> get props => [_searchCompoundId];
  String get getcompoundid => _searchCompoundId;
}

class AutoCompleteTileisNotActive extends CompoundIdState {}

class CompoundIDisNotLoaded extends CompoundIdState {}

class CompoundIDBloc extends Bloc<CompoundIdEvent, CompoundIdState> {
  CompoundCIDServices compoundCID;
  CompoundIDBloc({this.compoundCID}) : super(AutoCompleteTileisNotActive());

  @override
  Stream<CompoundIdState> mapEventToState(CompoundIdEvent event) async* {
    // TODO: implement mapEventToState

    if (event is FetchCompoundID) {
      try {
        String compoundId = await compoundCID.getcompoundcid(event._searchID);
        yield AutoCompleteTileisActive(compoundId);
      } catch (_) {
        yield CompoundIDisNotLoaded();
      }
    }
  }
}
