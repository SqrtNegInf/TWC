#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
#use DDP;

my @S = ("opt", "bat", "saw", "tab", "pot", "top", "was");

my %output;
my @output;

for my $str(@S)
{
  my $anagram;
  $anagram .= $_ for (sort split //, $str );
  push @{$output{$anagram}}, $str;
}

@output = values %output;

print "@$_\n" for sort @output;

=head2
perl ch-1.pl
[
    [0] [
        [0] "opt",
        [1] "pot",
        [2] "top"
    ],
    [1] [
        [0] "bat",
        [1] "tab"
    ],
    [2] [
        [0] "saw",
        [1] "was"
    ]
]
=cut
