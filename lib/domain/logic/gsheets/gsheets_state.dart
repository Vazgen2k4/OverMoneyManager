part of 'gsheets_bloc.dart';

abstract class GsheetsState extends Equatable {
  const GsheetsState();
  
  @override
  List<Object> get props => [];
}

class GsheetsInitial extends GsheetsState {}
