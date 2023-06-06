#!/usr/bin/env perl
use v5.36;

my @input = @ARGV;
@input = (7, 8, -3, 12, -10);
my @output = ('∅');

for (1..@input-1) {
    my @slice = @input[0..$_];
    my $smallest = smallest_neighbor( @slice );
    push @output, $smallest;
}

say "Input:  @input";
say "Output: ", join ', ', @output;

## ## ## ## ## SUBS:

sub smallest_neighbor {
## find the minimum value to the left and return it if 
## min < given value, else 0
    my $value = pop @_;
    my $min = "inf";
    $_ < $min and $min = $_ for @_;
    $min < $value ? $min : '∅';
}
