#!/usr/bin/env perl
use v5.36;

my ($n, $d) = (42,0);

unless (defined $n && defined $d) { say "usage ./divide_by_zero numerator denominator"; exit};

## from the beginning:
##      matches maybe a digit,
##      then maybe a decimal,
##      then maybe not a digit if we matched before the decimal
##      or necessarily a digit if there were no digits before
##      so 0.5, .5 and 5. all are recognized as valid input
##      but neither 2.2.5 nor . are valid
my $regex = '^(\d*)\.?(?(1)\d*|\d+)$';
unless ($n =~ /$regex/ && $d =~ /$regex/ ) { say "arguments must be numbers"; exit };

say divide_safe( $n, $d );

sub divide_safe {
## safe division function
## given input n, d returns n/d
## if d = 0, returns NAN (Not A Number)
    my ($numerator, $denominator) = @_;
    my $result;
    eval {$result = $numerator/$denominator};

    if( $@ ){
        return "NAN";
    }
    else {
        return "$result";
    }

}


