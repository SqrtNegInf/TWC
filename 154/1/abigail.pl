#!/usr/bin/env perl
use v5.36;

#
# Create a hash with all possible permutation as key, delete the
# ones from the input, print what remains. We make use of the fact
# that "PERL" doesn't have duplicate letters.
#

my           %all;
             @all {grep {!/(.).*\g{1}/} glob "{P,E,R,L}" x 4} = ();
delete       @all {map {chop; $_} <DATA>};
say for keys %all;

__END__
PELR
PREL
PERL
PRLE
PLER
PLRE
EPRL
EPLR
ERPL
ERLP
ELPR
ELRP
RPEL
RPLE
REPL
RELP
RLPE
RLEP
LPER
LPRE
LEPR
LRPE
LREP
