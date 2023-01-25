import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gsheets_event.dart';
part 'gsheets_state.dart';

class GsheetsBloc extends Bloc<GSheetsEvent, GsheetsState> {
  GsheetsBloc() : super(GsheetsInitial()) {
    on<GSheetsInitEvent>(_init);
  }
  
   Future<void> _init(
    GSheetsInitEvent event,
    Emitter<GsheetsState> emit,
  ) async {}
  
  
  
  
}
