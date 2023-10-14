import 'package:bloc/bloc.dart';
import 'package:flutter_rm/models/models.dart';
import 'package:flutter_rm/services/services.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if(result.value != null){
      emit(UserLoaded(result.value!));
    }else{
      emit(UserLoadingFailed(result.message!));
    }
  }
}
