import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'age_calculator_event.dart';
part 'age_calculator_state.dart';

class AgeCalculatorBloc extends Bloc<AgeCalculatorEvent, AgeCalculator> {
  AgeCalculatorBloc() : super(const AgeCalculatorInitial()) {
    on<AgeCalculatorEvent>((event, emit) async {
      if (event is GetStage) {
        if (event.ageval.toString().isEmpty) {
          emit(const AgeCalculatorError());
        } else {
          emit(const AgeCalculatorLoading());
          await Future.delayed(const Duration(seconds: 3), () {
            emit(AgeCalculatorLoaded(
                stageOfLife: getStage(int.parse(event.ageval.toString()))));
          });
        }
      } else {
        emit(const AgeCalculatorError());
      }
    });
  }

  String getStage(int ageval) {
    if (ageval == 0 || ageval == 1) {
      return "Infant";
    } else if (ageval >= 2 && ageval <= 4) {
      return "Toddler";
    } else if (ageval >= 5 && ageval <= 12) {
      return "Child";
    } else if (ageval >= 13 && ageval <= 19) {
      return "Teen";
    } else if (ageval >= 20 && ageval <= 39) {
      return "Adult";
    } else if (ageval >= 40 && ageval <= 59) {
      return "Middle Age Adult";
    } else {
      return "Senior Adult";
    }
  }
}
