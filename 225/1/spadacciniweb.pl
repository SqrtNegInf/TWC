#!/usr/bin/env perl
use v5.36;

use List::Util qw( max );

my @list = ("Perl and Raku belong to the same family.",
            "I love Perl.",
            "The Perl and Raku Conference.");

printf "%d\n", max_words(\@list);

@list = ("The Weekly Challenge.",
         "Python is the most popular guest language.",
         "Team PWC has over 300 members.");
printf "%d\n", max_words(\@list);


sub max_words {
    my $list = shift;
    return max map { scalar split / /, $_ }
               map { $_ =~ /^\s?+(.+)\s?+$/ }
               @{ $list };
}

