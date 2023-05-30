#!/usr/bin/env perl
use v5.36;

sub pattern_match {
    my $what = shift;

    # convert the pattern to regex
    $what->{p} =~ s/\?/./g;
    $what->{p} =~ s/\*/.*/g;
    $what->{p} = '^'.$what->{p}.'$';

    my $match = $what->{s} =~ /$what->{p}/;
    return 0 unless $match;
    return 1;
}

use Test::More;

is(pattern_match({'s' => 'abcde', 'p' => 'a*e'}), 1);
is(pattern_match({'s' => 'abcde', 'p' => 'a*d'}), 0);
is(pattern_match({'s' => 'abcde', 'p' => '?b*d'}), 0);
is(pattern_match({'s' => 'abcde', 'p' => 'a*c?e'}), 1);

done_testing;
