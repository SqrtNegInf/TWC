#!/usr/bin/env raku

my %available-numbers = 1 => True, 2 => True, 3 => True, 4 => True, 6 => True;
my %rings = Blue => [8], Yellow => [7], Green => [5], Red => [9];
my @results;
for %rings.kv -> $color, @numbers {
    my $need = 11 - @numbers[ 0 ];

    if ?%available-numbers{ $need } {
       # append the new number to the container, and thus to the hash
       @numbers.push: $need;
       %available-numbers{ $need } = False;
      @results.push: "Ring %s contains (%s)".sprintf: $color, @numbers.join( ' & ' );
    }
    else {
        say "Cannot find the required number $need as available for ring $color!";
    }
}

.say for @results.sort;
