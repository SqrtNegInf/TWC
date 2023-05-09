#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

my $desired=8;
my $try=1;
my @found=();
while(@found<$desired){
    push @found,  $try if happy($try);
    ++$try;
}
say "The first $desired happy numbers are: ", join " ", @found;

sub happy {
    my $x=shift;
    my %seen;
    while(!$seen{$x}){
        $seen{$x}=1;
        $x=sum map {$_*$_} split "", $x
    }
    return $x==1;
}
