#!/usr/bin/env raku

use v6.d;
use MONKEY-SEE-NO-EVAL;

# with 2022.12:
# the postfix '!' isn't defined in the EVAL'd code
BEGIN die 'not ok - disabled: does not work with 2022.12';

constant \TEST=True;

# Factorions

#$*ERR.print: "Warning: Postfix bang binds tighter than unary minus,\n"
#           ~ "         Use a function for general use.\n";

my sub postfix:<!> ( Int $i --> Int ) {
    state @f = 1,1,2,6;
    while @f.end < $i {
        @f.push: @f.end × (@f[@f.end -1] + @f[@f.end])
    }
    @f[$i];
}

#my $n = (1..100000).pick;
#factorion( $n);

exit unless TEST;

sub factorion ( Int $n, Bool :$QUIET --> Bool) {
    my Str $explan = (($n.split( '', :skip-empty)).join: '! + ') ~ '!'; 
    my $output = EVAL( $explan);
    my $ation = join ' + ',
            ($explan.split( ' + ', :skip-empty)).map: { EVAL $_ };

    unless $QUIET {
        say "Input: \$n = $n\n"
        ~ "Output: ", ($output==$n).Int(), "\n\n"
        ~ "    Since $explan => $ation = $output";
    }
    $output == $n;
}

use Test;

my @good = 1, 2, 145, 40585;

plan 4;

for @good -> $x {
    is factorion($x), $x == @good.any, "is a factorion";
}

#for 0 .. 49999 {
#    next if $_ == @good.any;
#    is factorion($_, :QUIET ), False, 'is not a factorion';
#}
