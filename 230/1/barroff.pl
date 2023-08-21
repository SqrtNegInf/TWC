#!/usr/bin/env perl
use v5.36;

sub separate_digits (@ints) {
    my $connected_ints = join '', @ints;
    my @result         = split '', $connected_ints;
    return \@result;
}

sub MAIN() {

    #| Run test cases
    use Test::More;

    is_deeply separate_digits( ( 1, 34, 5, 6 ) ), [ 1, 3, 4, 5, 6 ],
      'works for (1, 34, 5, 6)';
    is_deeply separate_digits( ( 1, 24, 51, 60 ) ), [ 1, 2, 4, 5, 1, 6, 0 ],
      'works for (1, 24, 51, 60)';
    done_testing;
}

MAIN();
