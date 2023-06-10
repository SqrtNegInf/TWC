#!/usr/bin/env perl
use v5.36;

use Test::More;

my $in = ["alphabet", "book", "carpet", "cadmium", "cadeau", "alpine"];
my $out = ["alph", "b", "car", "cadm", "cade", "alpi"];
is_deeply unique_prefix($in), $out;
done_testing;

sub unique_prefix {
    my ($words, $i) = @_;
    $words = [@$words] unless $i; # Clone at the start, alters in place
    $i ||= 1;
    my %c;
    map { $c{substr($_, 0, $i)}++ } @$words;
    foreach(@$words) {
        if ($c{substr($_, 0, $i)} == 1) {
            $_ = substr($_, 0, $i);
        } elsif ($i < length $_) {
            unique_prefix($words, $i+1);
        }
    }
    return $words;
}

=back
