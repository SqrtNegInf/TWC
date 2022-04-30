#!/usr/bin/env raku

# Factorial function, create prefix !. I.e. 2! = 2, 3! = 3*2, 4! = 4*3*2, ...
sub postfix:<!>(Int $n) { [*] 1..$n };

# A straightforward calculation gives that person n gets
#
#   99 / 100 * 98 / 100 * ... * (99 - n + 1) / 100 * n / 100
#     = 99! / (100 - n)! * n / 100^n
#
# -th piece of the pie.
my @pieces = (1..100).map(-> Int \n { 99! / (100 - n)! * n / 100**n });

# Find the person with the biggest piece.
my $person_no = @pieces.maxpairs()[0].key + 1;

# Print the number of the person with the biggest piece.
say "The person that gets the biggest piece is person $person_no.";

