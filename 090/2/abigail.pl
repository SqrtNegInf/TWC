#!/usr/bin/env perl
use v5.36;

my $TICK = "\N{CHECK MARK}";

binmode STDOUT, ":utf8";

while (<DATA>) {
    use integer;
    my ($A, $B) = /([0-9]+) \s+ ([0-9]+)/x or next;
    #
    # Max width of the left and right columns.
    #
    my $w1 = length $A;
    my $w2 = length (my $product = $A * $B);
    while ($A) {
        #
        # Print a line, add a tick mark if the left column is odd
        #
        printf "%${w1}d  %${w2}d %s\n" => $A, $B, $A % 2 ? $TICK : "";
        #
        # Divide and double
        #
        $A /= 2;
        $B *= 2;
    }
    #
    # Print the sum
    #
    say " " x $w1, "  ", "-" x $w2, " +";
    say " " x $w1, "  ", $product;
}


__END__
14 12
238 13
