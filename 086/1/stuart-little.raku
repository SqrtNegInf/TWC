#!/usr/bin/env raku
use v6;

sub diffpair($n, @a) {
    @a.combinations(2).map({ $_, ($_[1],$_[0]) }).map(|*).first({$_[1]-$_[0]==$n}, :v)
}

my $res=diffpair(7, (10, 8, 12, 15, 5).map(*.Int));
say ($res) ?? ("1: $res[1]-$res[0]=7") !! ("0")

# run as <script> <difference> <space-separated array entries>

