#!/usr/bin/env perl
use v5.36;


use bigint;

my $n = shift @ARGV // 10;

for my $n (1..$n) {
    my $fact    = fact($n);
    my ($zeros) = $fact =~ m/.*?(0*)$/;
    my $count   =  @{[split //, $zeros]} ;  ## baby cart operator

    my @plurals = $count == 1 ? ("is ", " ") : ("are", "s");
    
    say "there $plurals[0] $count trailing zero${plurals[1]} on " 
            . (sprintf "%2d! = ", $n) . $fact;
}


## ## ## ## ## SUBS:


sub fact {
## final form: memoized in case someone wants to put in large n
## makeshift reduction using a for loop
    state %memo;

    my $end = shift;
    if (exists $memo{ $end - 1 }) {
        $memo{ $end } = $memo{ $end - 1 } * $end;
        return $memo{ $end }
    }
    my $acc = 1;
    $acc *= $_ for (2..$end);
    $memo{ $end } = $acc;
    return $acc;
 }

## original recursive version
    # sub fact {
    #     my $n = shift;
    #     return 1 if $n == 1;
    #     return $n * fact ($n - 1);
    # }

## original accumulator version
    # sub fact {
    #     my $end = shift;
    #     my $acc = 1;
    #     $acc *= $_ for (2..$end);
    #     return $acc;
    # }

## List::Util::reduce version
    # use List::Util qw( reduce );  
    # sub fact { return reduce { $a * $b } (1..$_[0]) }
