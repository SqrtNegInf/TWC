#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);

my %count;
my $reverse;
for (<ab de ed bc>){
    ++$count{$_};
    my $reverse=reverse $_;
    --$count{$reverse} unless $reverse eq $_;
}
say "blah -> ", (sum0 map {!$_} values %count)/2;
