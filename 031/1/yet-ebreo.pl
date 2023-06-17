#!/usr/bin/env perl
use v5.36;

sub div_zero_check {
    my @div =  @_;
    my $r   =  eval "$_[0]/$_[1]";
    $@      =~ /z/ ? -1 :$r ;
} 
my $r;
say ( (($r = div_zero_check(112,0)) < 0) ? "Division by zero detected" : $r );
say ( (($r = div_zero_check(0,0))   < 0) ? "Division by zero detected" : $r );
say ( (($r = div_zero_check(0,1))   < 0) ? "Division by zero detected" : $r );
say ( (($r = div_zero_check(32,12)) < 0) ? "Division by zero detected" : $r );

