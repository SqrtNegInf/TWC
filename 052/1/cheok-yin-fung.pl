#!/usr/bin/env perl
use strict;

sub diff {
    if (($_[0]-$_[1] == 1) or ($_[0]-$_[1] == -1)) {
        return 1;
    } else {return undef;}
}

(my $head, my $tail) = (111,999);

foreach ($head..$tail) {
    my $num = $_;
    (my $h, my $t, my $d) = split //, $num;
    print "$num\n" if (diff($h,$t) && diff($t,$d));
}
