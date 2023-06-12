#!/usr/bin/env perl
use v5.36;

use List::Util 'uniq';

my %seen;
my @A = ("love", "live", "leave");
for(@A){
    $seen{$_}++ for uniq split "", lc
}
my $N=@A;
my @result=sort {$a cmp $b} grep {$seen{$_}==$N} keys %seen;
say "@A -> @result"
