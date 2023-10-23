#!/usr/bin/env perl
use v5.36;

my @strings = ([ ["ab", "c"],
                 ["a", "bc"]
               ],
               [ ["ab", "c"],
                 ["ac", "b"]
               ],
               [ ["ab", "cd", "e"],
                 ["abcde"]
               ]
              );
            

foreach my $arr (@strings) {
    my $str1 = join '', map { $_ }
                            @{$arr->[0]};
    my $str2 = join '', map { $_ }
                            @{$arr->[1]};
    printf "[%s] =? [%s] -> %s\n", (join ', ', map { sprintf '"%s"', $_ }
                                                 @{$arr->[0]}
                                   ),
                                   (join ', ', map { sprintf '"%s"', $_ }
                                                 @{$arr->[1]}
                                   ),
        ($str1 eq $str2)
            ? 'true'
            : 'false';
}
