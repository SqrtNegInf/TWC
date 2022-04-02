#!/usr/bin/env raku



unit sub MAIN () ;

my @input = 7, 8, 3, 12, 10;
my @output;

for [\,] @input  {                            ## triangular comma 
    push @output, smallest_neighbor( $_.Array );     # $_ is List
}

sub smallest_neighbor( @slice ) {
## find the minimum value to the left of last value not inclusive
## return it if less than last, else ∅
    my $val = @slice.pop;
    my $min = @slice.min;
    $min < $val ?? $min !! '∅';
}

@input .say;
@output.say;



