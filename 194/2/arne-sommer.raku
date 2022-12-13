#!/usr/bin/env raku

#subset az where /^<[a..z]>+$/;

my $s = 'xyzyyxz';
my @freq = $s.comb.Bag.values.sort;
@freq.push(@freq.pop - 1);
say ( [==] @freq ) ?? 1 !! 0;

@freq = 'aaicocciaoouiacio'.comb.Bag.values.sort;
@freq.push(@freq.pop - 1);
say ( [==] @freq ) ?? 1 !! 0;
