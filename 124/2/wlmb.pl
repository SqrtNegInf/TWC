#!/usr/bin/env perl
use v5.36;

use POSIX qw(floor);
use List::Util qw(sum0);

my @set=sort {$a <=> $b} (10, -15, 20, 30, -25, 0, 5, 40, -5);
my $N=@set;
my $k=floor $N/2;
my @set1=map {$set[2*$_]} 0..$k-1;
push @set1, $set[-1] if $N%2; # odd number of elements
my @set2=map {$set[2*$_+1]} 0..$k-1;
my $N1=@set1;
my $N2=@set2;
my ($sum1,$sum2)=map {sum0 @$_} (\@set1,\@set2);
my $E=abs($sum2-$sum1);
my $done=0;
while(!$done){
    $done=1;
    foreach my $delta(-1,0,1){
	foreach my $i1(0..$N1-1){
	    $done=0 if attempt($i1, $i1+$delta);
	}
    }
}

say "Input: ", join " ", @set;
say "Set1: ", join " ", sort {$a<=>$b} @set1;
say "Set2: ", join " ", sort {$a<=>$b} @set2;
say "Diff: ", $E;

sub attempt {
    my ($i1, $i2)=@_;
    return if $i1<0 || $i2<0 || $i1>=$N1 || $i2>=$N2;
    my ($new_sum1, $new_sum2)=($sum1-$set1[$i1]+$set2[$i2], $sum2+$set1[$i1]-$set2[$i2]);
    my $new_E=abs($new_sum2-$new_sum1);
    return if $new_E>=$E;
    ($set1[$i1],$set2[$i2])=($set2[$i2],$set1[$i1]);
    ($sum1, $sum2)=($new_sum1,$new_sum2);
    $E=$new_E;
    return 1;
}
