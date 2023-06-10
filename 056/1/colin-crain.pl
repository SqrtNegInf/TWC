#!/usr/bin/env perl
use v5.36;

srand 1;

my $k = shift @ARGV // 24;

my @input;
push @input, int(rand(50)) for (1..20);
@input = sort { $a <=> $b } @input;

my @indices = (0..scalar @input - 1);
my @output;

my @is =  grep { $input[$_] > $k } @indices;

for my $i ( @is ) {
    ## for each $i we can do a lookup and see whether any values $input[$j] = $input[$i] - $k exist
    ## we need to make allowances that adjacent multiple indices may hold equal values
    my @js = grep {    $input[$_] <= $input[$i]                         ## A[j] <= A[i]
                    && $input[$_] == $input[$i] - $k                    ## A[j] = A[i] - k
                    && $_ != $i                         } @indices;     ## i != j
    for my $j ( @js ) {
        push @output, [ $i, $j ];
    }
}

## output report
##
say "input\n-----\n";
say ' array: ', join ', ', @input;

say "target: $k";
say '';

say "solutions\n---------\n";
for (@output) {
    my ( $i, $j) = $_->@*;
    printf "i = %2d, j = %-2d --> %2d - %-2d = %d\n", $i, $j, $input[$i], $input[$j], $k;
}
