import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tp/api/model/response_api.dart';
import 'package:flutter_tp/api/services/off_api.dart';
import 'package:flutter_tp/model/person_api.dart';

abstract class PersonDetailEvent {}

class LoadPersonDetailEvent extends PersonDetailEvent {
  LoadPersonDetailEvent();
}

class PersonDetailBloc extends Bloc<PersonDetailEvent, PersonDetailState> {
  PersonDetailBloc(this.personId)
      : assert(personId.isNotEmpty),
        super(PersonDetailNotifierLoadingState()) {
    on<LoadPersonDetailEvent>(_loadPerson);
    add(LoadPersonDetailEvent());
  }

  final String personId;

  Future<void> _loadPerson(
    PersonDetailEvent event,
    Emitter<PersonDetailState> emit,
  ) async {
    try {
      final OFFServerResponsePerson? response =
          await OFFAPIManager().fetchPersonById(personId);
      emit(PersonDetailNotifierSuccessState(response!.results));
    } catch (e) {
      emit(PersonDetailNotifierErrorState(e));
    }
  }
}

sealed class PersonDetailState {}

class PersonDetailNotifierLoadingState extends PersonDetailState {}

class PersonDetailNotifierSuccessState extends PersonDetailState {
  final Person? person;

  PersonDetailNotifierSuccessState(this.person);
}

class PersonDetailNotifierErrorState extends PersonDetailState {
  final dynamic error;

  PersonDetailNotifierErrorState(this.error);
}
