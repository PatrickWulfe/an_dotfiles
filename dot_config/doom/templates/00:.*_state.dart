part of '${1:`(s-replace "_state" "" (file-name-base (buffer-file-name)))`}_bloc.dart';

@immutable
abstract class ${2:`(s-replace "_" ""(capitalize  (file-name-base (buffer-file-name))))`} {}

class ${3:`(s-replace "_" ""(capitalize (s-replace "_state" ""  (file-name-base (buffer-file-name)))))`}Initial extends $2 {}
$0
