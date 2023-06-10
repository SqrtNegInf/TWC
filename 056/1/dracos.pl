#!/usr/bin/env perl
use v5.36;

use Test::More;

is(diffk_print(k => 2, N => [2, 7, 9]), "2,1");
is(diffk_print(k => 2, N => [2, 7, 9, 11]), "2,1\n3,2");
is(diffk_print(k => 7, N => [2, 7, 9, 11]), "2,0");
is(diffk_print(k => 0, N => [2, 7, 7, 9]), "2,1");
is(diffk_print(k => 5, N => [2, 3, 5, 8, 13, 21, 34]), "3,1\n4,3");

done_testing;

sub diffk {
    my %p = @_;
    my ($i, $j) = (0, 1);
    my $size = @{$p{N}};
    my @out;
    while ($i < $size && $j < $size) {
        my $diff = $p{N}[$j] - $p{N}[$i];
        if ($diff == $p{k} && $i != $j) { # Success
            push @out, [$j,$i];
            $i++;
        } elsif ($diff > $p{k}) { # Too large
            $i++;
        } else { # Too small, or same
            $j++;
        }
    }
    return @out;
}

=item diffk_print

Calls diffk, then converts the output to be printed.

=back

=cut

sub diffk_print {
    join "\n", map { "$_->[0],$_->[1]" } diffk(@_);
}
