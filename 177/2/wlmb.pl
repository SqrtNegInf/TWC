#!/usr/bin/env perl
use v5.36;
use Math::Prime::Util qw(is_prime);
my $left=1;
my $count=0;
my $how_many=shift//20;
while($count<$how_many){
    my $candidate=$left."0".reverse $left;
    ++$count, print "$candidate " if $left!~/0/ && is_prime($candidate);
    ++$left
}
