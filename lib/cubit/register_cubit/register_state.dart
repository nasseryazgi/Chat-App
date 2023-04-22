abstract class RegisterState{}
class RegisterInitial extends RegisterState{}
class RegisterSucess extends RegisterState{}
class RegisterLoading extends RegisterState{}

class RegisterFailure extends RegisterState{
  String errorMessage;
  RegisterFailure({ required this.errorMessage});
}
