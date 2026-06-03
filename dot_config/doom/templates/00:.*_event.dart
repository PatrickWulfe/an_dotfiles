part of '${1:`(s-replace "_" "" (s-replace "_event" "" (file-name-base (buffer-file-name))))`}_bloc.dart';

@immutable
abstract class ${2:`(s-replace "_" ""(capitalize  (file-name-base (buffer-file-name))))`} {}
$0