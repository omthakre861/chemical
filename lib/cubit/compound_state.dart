part of 'compound_cubit.dart';

abstract class CompoundState extends Equatable {
  const CompoundState();

  @override
  List<Object> get props => [];
}

class CompoundInitial extends CompoundState {}

class CompoundLoaded extends CompoundState {
  final List<Info> info;

  CompoundLoaded({this.info});
}
