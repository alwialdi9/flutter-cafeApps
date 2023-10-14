part of 'food_cubit.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}

class FoodLoaded extends FoodState {
  final List<Food> foods;

  FoodLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}

class FoodLoadingFailed extends FoodState {
  final String message;

  FoodLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}