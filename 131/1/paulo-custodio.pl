#!/usr/bin/env perl
use v5.36;

my @input = (1, 2, 3, 6, 7, 8, 9);
my @output = cons_arrays(@input);
say "[".join(", ", map {"[".join(", ", @$_)."]"} @output)."]";

sub cons_arrays {
    my(@input) = @_;
    my @output = [shift @input];
    while (@input) {
        my $n = shift @input;
        if ($n == $output[-1][-1] + 1) {
            push @{$output[-1]}, $n;
        }
        else {
            push @output, [$n];
        }
    }
    return @output;
}
