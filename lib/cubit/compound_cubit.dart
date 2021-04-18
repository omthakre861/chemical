import 'package:bloc/bloc.dart';
import 'package:chemical/data/compoundData/respository_compound.dart';
import 'package:chemical/data/model/info.dart';
import 'package:chemical/presentation/screens/compound_info.dart';
import 'package:equatable/equatable.dart';

part 'compound_state.dart';

class CompoundCubit extends Cubit<CompoundState> {
  final Respository_compound respository_compound;

  CompoundCubit({this.respository_compound}) : super(CompoundInitial());

  void fetchinfo(compound_id) {
    respository_compound.fetchinfo(compound_id).then((info) => {
      emit(CompoundLoaded(info: info))
    });
  }
}
