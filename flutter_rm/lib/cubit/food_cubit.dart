import 'package:bloc/bloc.dart';
import 'package:flutter_rm/models/models.dart';
import 'package:flutter_rm/services/services.dart';
import 'package:meta/meta.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Food>> result = await FoodServices.getFoods();

    if(result.value != null){
      emit(FoodLoaded(result.value!));
    }else{
      emit(FoodLoadingFailed(result.message!));
    }
  }
}
