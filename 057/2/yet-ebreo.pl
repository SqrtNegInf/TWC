#!/usr/bin/env perl
use v5.36;

sub uniq_prefix {
    my ($words) = @_;
    map {
        my $word = $words->[$_];
        my @copy = @{$words};
        splice @copy, $_, 1;

        my $prefix;
        my $flag = 0;
        for my $size (1..length $word) {
            $prefix = substr $word, 0, $size;
            unless (grep { /^$prefix/ } @copy ) {
                $flag = 1;
                last;
            }
        }
        $flag?$prefix:'na';
    } 0..$#{$words};
}

my @words = @ARGV?@ARGV:qw(alphabet book carpet cadmium cadeau alpine);
my @unique_prefix = uniq_prefix(\@words);
say "[@unique_prefix]";
