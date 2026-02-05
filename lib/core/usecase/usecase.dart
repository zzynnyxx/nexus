// core/usecase/usecase.dart
// type:The data we expect back(eg UserEntity)
// Paams: The data we need to send (eg LoginParams containing email/password

import 'package:fpdart/fpdart.dart';
import 'package:nexus_social/core/error/failures.dart';

abstract interface class UseCase <Type,Params>{
  Future <Either<Failure,Type>> call(Params params);
}

// Helper class for Use Caases that dont nee any input (Like "Get current User")
class Noparams{}