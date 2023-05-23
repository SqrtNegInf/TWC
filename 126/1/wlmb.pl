#!/usr/bin/env perl
use v5.36;
use POSIX qw(floor);

foreach( (25, 200) ){
    my $N=floor($_); # check non-negative integer arguments
    warn("Expected natural: $_"), next unless $N>=0 and $N==$_;
    say "Input: $_\nOutput: ", $N>1?count(split '',$N)-1:0;
}

sub count {
    state @m1=(0,1,1..8);
    state @m2=(1,0,(1)x8);
    my ($first,@rest)=@_;
    return 1 unless defined $first;
    return $m1[$first]*9**@rest+$m2[$first]*count(@rest); #$first>1
}
