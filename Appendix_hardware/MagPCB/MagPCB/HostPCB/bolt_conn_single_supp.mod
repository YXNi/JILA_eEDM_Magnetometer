PCBNEW-LibModule-V1  7/15/2015 2:51:27 PM
# encoding utf-8
Units mm
$INDEX
bolt_conn_single_supply
$EndINDEX
$MODULE bolt_conn_single_supply
Po 0 0 0 15 55A03C18 00000000 ~~
Li bolt_conn_single_supply
Sc 0
AR /55A013CB
Op 0 0 0
T0 0 -12 1 1 0 0.15 N V 21 N "P1"
T1 0 -10 1 1 0 0.15 N V 21 N "BOLT_CONN_SINGLE_SUPP"
DS -6 -10 6 -10 0.15 21
DS -1.5 -1.5 1.5 -1.5 0.15 21
DS 1.5 -1.5 1.5 1.5 0.15 21
DS 1.5 1.5 -1.5 1.5 0.15 21
DS -1.5 1.5 -1.5 -1.5 0.15 21
DS -1.5 -1.5 -1.5 -1 0.15 21
$PAD
Sh "4" C 4 4 0 0 0
Dr 2.15 0 0
At STD N 00A0FFFF
Ne 3 "SDA"
Po 0 -6
$EndPAD
$PAD
Sh "2" C 4 4 0 0 0
Dr 2.15 0 0
At STD N 00A0FFFF
Ne 1 "GND"
Po 5 -6
$EndPAD
$PAD
Sh "3" C 4 4 0 0 0
Dr 2.15 0 0
At STD N 00A0FFFF
Ne 2 "SCL"
Po -5 -6
$EndPAD
$PAD
Sh "1" C 4 4 0 0 0
Dr 2.15 0 0
At STD N 00A0FFFF
Ne 4 "VDD"
Po -5 0
$EndPAD
$EndMODULE bolt_conn_single_supply
$EndLIBRARY
