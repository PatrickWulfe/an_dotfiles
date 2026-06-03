import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '${2:`(s-replace "_cubit" "" (file-name-base (buffer-file-name)))`}_state.dart';

class ${1:`(s-replace "_" ""(capitalize (s-replace "_cubit" "" (file-name-base (buffer-file-name)))))`}Cubit extends Cubit<$1State> {
      $1Cubit() : super($1Initial());
}

$0
