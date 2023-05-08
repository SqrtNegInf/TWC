#!/usr/bin/env perl

use v5.36;
my $count=1;
my $copy=my $orig=(1, 0, 0, 0, 1);
for($copy){ # localize
    die "Only 0's and 1's allowed. Invalid input: $_" unless /^[01]*$/;
    s/^/0/; # add leading and trailing 0's
    s/$/0/;
    my $replacements=0;
    $replacements++ while s/000/010/; # count replacements
    say "Count: $count, string: $orig -> ", $replacements>=$count? 1:0;
}
