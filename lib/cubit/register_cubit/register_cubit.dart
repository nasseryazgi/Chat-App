import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/cubit/register_cubit/register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser({required email, required password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(RegisterSucess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'email-already-in-use'));
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }
}
