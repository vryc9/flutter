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
      if (response != null && response.status_code == 1) {
        emit(PersonDetailNotifierSuccessState(response.results));
      } else {
        emit(
            PersonDetailNotifierErrorState(response?.error, response?.status_code));
      }
    } catch (e) {
      emit(PersonDetailNotifierErrorState(e.toString(), 0));
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
  final int? statusCode;

  PersonDetailNotifierErrorState(this.error, this.statusCode);
}
