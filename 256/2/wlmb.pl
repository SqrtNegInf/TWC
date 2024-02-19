#!/usr/bin/env perl
use v5.36;

sub next_char($x){
    shift @$x||""
}
my ($x,$y)=map{[split ""]}('abcd', '1234');
my $out="";
$out.=next_char($x) . next_char($y) while(@$x||@$y);
say "blah -> $out"
