#!/usr/bin/env perl
use v5.36;

# an upper bound of moves to check
use constant MOVES_LIMIT => 10;

my @solution;

# A binary number is used to get a particular combination
#  for each of the moves to check
#
# The combination defines a serie of operations (add 1 or multiply by 2)
# Each one of them updates the value for the next operation.

foreach my $n ( 0 .. (2 ** MOVES_LIMIT)-1 ) {
    my @ops = map { $_ ? '+ 1' : '* 2'} split //, sprintf("%b", $n);

    my $value = 1;
    $value = eval($value . $_) for (@ops);

    if ($value == 200) {
        @solution = @ops;
        last;
    }
}

# beautified solution printing
my $value = 1;
print $value . $/;
foreach (@solution) {
    $value = eval($value . $_);
    print $_.' = '. $value . $/;
}
