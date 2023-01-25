part of 'gsheets_bloc.dart';

abstract class GSheetsEvent extends Equatable {
  const GSheetsEvent();

  @override
  List<Object> get props => [];
}

class GSheetsInitEvent extends GSheetsEvent {
  final String tableId;

  const GSheetsInitEvent({
    required this.tableId,
  });

  @override
  List<Object> get props => [tableId];
}
