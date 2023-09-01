#!/usr/bin/env perl
use v5.36;

my @lists = (
    ["7868190130M7522","5303914400F9211","9273338290F4010"],
    ["1313579440F2036","2921522980M5644"]
);
foreach my $list (@lists) {
    printf "\n%s\n\t -> %d seniors", (join ' ', map { $_ } @$list),
                                     count_seniors($list);
}

exit 0;

sub count_seniors {
    my $list = shift || [];

    return scalar map { ((substr $_, 11, 2) >= 60) ? 1 : () }
                    @$list;
}
