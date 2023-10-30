#!/usr/bin/env perl

use strict;
use warnings;

my @arrays = ([ ["Perl", "Python", "Pascal"],
                 "ppp"
              ],
              [ ["Perl", "Raku"],
                "rp"
              ],
              [ ["Oracle", "Awk", "C"],
                "oac"
              ]
             );
            

foreach my $strings (@arrays) {
    my $str1 = join '', map { lc(substr $_, 0, 1) }
                            @{$strings->[0]};
    printf "[%s] acronym? '%s' -> %s\n", (join ', ', map { sprintf '"%s"', $_ }
                                                 @{$strings->[0]}
                                         ),
                                         $strings->[1],
        ($str1 eq $strings->[1])
            ? 'true'
            : 'false';
}
