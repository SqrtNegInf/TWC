#!/usr/bin/env perl
use v5.36;

# solution
sub combiCoinSum {
    my $S  = shift;
    my @RC = sort { $b <=> $a } @_;   # (R)est of (C)oins (sorted)
    my $fc = shift @RC;               # (f)irst (c)oin

    defined $fc or ( warn "no coins provided", return ());

    my @result;

    my $maxNoc = int $S / $fc ;
    for my $noc ( reverse 0 .. $maxNoc ) {
        my $change  = $S -$fc * $noc;
        my @coins   = ( $fc ) x $noc;
        if ( $change > 0 ) {
            push @result, map { [ @coins, @$_ ] } combiCoinSum( $change, @RC );
        }
        else { push @result, [ @coins ] }
    }
    @result;
}

# testing
package main;

sub usage {
    say "perl ch-1.pl <sum> <coins ...>\n";
}
sub raku_array { "[".(join ", ", @_)."]" }

my $S = 6; my @C = <1 2 4>;
my @combi = combiCoinSum( $S, @C );

say "Input:";
say "\@C = @{[raku_array @C]}";
say "\$S = $S";
say "Output: @{[scalar @combi ]}";
say "possible ways are:";
say "@{[raku_array @$_ ]}" for @combi;
