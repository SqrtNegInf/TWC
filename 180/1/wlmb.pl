#!/usr/bin/env perl

use v5.36;
use List::MoreUtils qw(firstidx);

foreach('raku Yearly Challenge'){
    my @chars=split ""; # or split "", lc or grep {/\S/} split...
    my %count;
    $count{$_}++ foreach(@chars);
    my $first= firstidx {$count{$_}==1} @chars;
    say "The first unique character of '$_' is $first->$chars[$first]" if $first>=0;
    say "'$_' has no unique characters" if $first==-1;
}
