#!/usr/bin/env raku

my @states=$=finish.lines;
my $dict = $*VM ~~ /jvm/ ?? 'words' !! '/usr/share/dict/words';
my @words= $dict.IO.lines;

say @words.grep((*.uc.comb(2) (-) @states).elems==0).classify(*.chars).max(*.key).value

=finish
AL
AK
AZ
AR
CA
CO
CT
DE
DC
FL
GA
HI
ID
IL
IN
IA
KS
KY
LA
ME
MD
MA
MI
MN
MS
MO
MT
NE
NV
NH
NJ
NM
NY
NC
ND
OH
OK
OR
PA
RI
SC
SD
TN
TX
UT
VT
VA
WA
WV
WI
WY
