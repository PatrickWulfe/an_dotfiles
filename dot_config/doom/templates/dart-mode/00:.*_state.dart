part of '${1:`(s-replace "_" "" (s-replace "_state" "" (file-name-base (buffer-file-name))))`}_bloc.dart';

@immutable
abstract class ${2:`(s-replace "_" ""(capitalize  (file-name-base (buffer-file-name))))`} {}

class ${3:`(capitalize (s-replace "_" ""(s-replace "_state" ""  (file-name-base (buffer-file-name)))))`}Initial extends $2 {}
$0
