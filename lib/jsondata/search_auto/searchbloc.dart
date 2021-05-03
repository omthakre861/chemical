import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'search_autocomplete.dart';
import 'search_services.dart';

class SearchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchSearch extends SearchEvent {
  final _searchcompound;

  FetchSearch(this._searchcompound);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchisnotActive extends SearchState {}

class SearchisnotLoaded extends SearchState {}

class SearchIsLoading extends SearchState {}

class SearchisActive extends SearchState {
  final _search_info;

  SearchisActive(this._search_info);

  @override
  // TODO: implement props
  List<Object> get props => [_search_info];
  AutoComplete get getsearch => _search_info;
}

class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

  get getinfo => null;
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchAuto searchAuto;

  SearchBloc({this.searchAuto}) : super(SearchisnotActive());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchSearch) {
      try {
        AutoComplete autoComplete =
            await searchAuto.getAutoComplete(event._searchcompound);
        yield SearchisActive(autoComplete);
      } catch (_) {
        yield (SearchisnotLoaded());
      }
    }
  }
}
