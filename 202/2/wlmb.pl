#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use List::UtilsBy qw(max_by);

my @A  = (2, 1, 2, 1, 3);

my @in=@A;
my $ascending=0;
my @up=my @down=(my $previous=shift);
my @out;
for(@A){
    if($_>$previous){
	@up=@down unless $ascending;
	@down=();
	$ascending=1;
    }
    if($_<$previous){
	push @out, [@up];
        @up=();
	$ascending=0;
    }
    push @down, $_;
    push @up, $_;
    $previous=$_;
}
push @out, [@down], [@up];
my $result=max_by {@$_} @out;
say join " ", @in, "->", @$result;
