#!/usr/bin/env perl
use v5.36;

use Math::BigInt;

sub get_reverse_int {
    # it does not say how the input number looks like, for example
    # 1.000 is still a valid integer - perhaps, not speaking about inputs
    # like 1e+3, so I used the BigInt normalize...
 
    my $what = Math::BigInt->new(shift)->bnorm;

    # get the reverse of the normalized norm
    $what = Math::BigInt->new($what->sign . reverse $what->babs)->bnorm;

    # ok, now that I have normalized version, let's conver it to binary and
    # count digits. It could be done by simple comparison with 2**32-1 and
    # -2**23, but hey why not...
    
    my $bin_ver = unpack("B32", pack("N", $what->copy->babs));
    $bin_ver =~ s/^0+(?=\d)//;

    return 0 if length($bin_ver) >= 32;
   
    return $what;
}

use Test::More;

is(get_reverse_int(1234), 4321);
is(get_reverse_int(-1234), -4321);
is(get_reverse_int(1_231_230_512), 0);
is(get_reverse_int(1.000), 1);
is(get_reverse_int(1e+3), 1);
is(get_reverse_int(7_463_847_412),2147483647);
is(get_reverse_int(2_147_483_648), 0);
done_testing;
