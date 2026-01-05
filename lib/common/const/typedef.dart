

import 'package:dartz/dartz.dart';
import 'package:untitled/Project/domain/failures/Project_failure.dart';
import 'package:untitled/common/const/typedef.dart';

import 'failure.dart';

typedef FormJson <T> = T Function (dynamic body);
typedef QueryParams = Map<String , String ?>;
typedef BodyMap = Map<String , dynamic> ;
typedef DataResponse <T> = Future <Either<Failure , T>>;
abstract class UseCase <Type , Params>
{
  DataResponse<Type> call (Params params) ;
}




mixin Params {
  BodyMap getBody () => {};
  QueryParams getParams () => {};

}
class NoParams with Params {}