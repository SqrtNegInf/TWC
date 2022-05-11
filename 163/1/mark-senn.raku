#!/usr/bin/env raku

Test((1, 2, 3));
Test((2, 3, 4));
Test((1, 2, 3, 10));

sub Test(@array)
{
    my @n = @array;
    say "Input : @n = ({@n.join(',')})"; # trivial error fixed
    say 'Output: ' ~ combinations(@n, 2).map({[+&] $_}).sum;
}
