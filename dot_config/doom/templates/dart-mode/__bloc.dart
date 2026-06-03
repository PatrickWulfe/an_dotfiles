import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '${2:`(s-replace "_" "" (s-replace "_bloc" "" (file-name-base (buffer-file-name))))`}_event.dart';
part '$2_state.dart';

class ${1:`(s-replace "_" ""(capitalize (s-replace "_bloc" "" (file-name-base (buffer-file-name)))))`}Bloc extends Bloc<$1Event, $1State> {
      $1Bloc() : super($1Initial()) {
               on<$1Event>((event, emit) {
                    // TODO: implement event handler
               });
      }
}

$0
