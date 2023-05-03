#!/usr/bin/env perl
use v5.36;
use Carp;

sub zip :prototype(\@\@){
    my($a,$b)=@_;
    croak 'Args have unequal size' if @$a != @$b;
    map { $$a[$_], $$b[$_] } 0..$#$a;
}

my @a = qw/1 2 3/;
my @b = qw/a b c/;

my @result = zip(@a,@b);

print "qw/@result/\n";
