#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    my @N = /[0-9]+/g;
    #
    # The second example will die on this. Because 0 ain't no positive number.
    #
    die "Not all positive integers" if grep {/[^0-9]/ || !$_} @N;
    my $index = 0;
    while ($index < @N - 1) {
        #
        # Note that we ALWAYS make progress, as it's given that
        # @N contains POSITIVE numbers.
        #
        $index += $N [$index];
    }
    say $index == $#N ? 1 : 0;
}

__END__
1 2 1 2
1 3 1 2
