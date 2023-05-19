#!/usr/bin/env perl
use v5.36;

my ($lower, $upper, $maxcount, $largest)=(10,1000,500,10_000_000); #bounds
foreach((56, 57, 59, 196) ){
    my @why=lychrel($_);
    say "Input: $_\nOutput: ", @why?"0\n":"1?", @why>1?join("\n", @why):"";
    say "";
}
sub lychrel {
    my $n=shift;
    my $r=reverse $n;
    say("Failed $lower<=$_<=$upper"), exit unless $lower<=$_<=$upper;
    my $count=$maxcount;
    my @why=("as");
    while(--$count){
	return (@why) if $n eq $r;
	push @why, "$n+$r=". ($n+=$r);
	return if $n>=$largest;
	$r=reverse $n;
    }
    return;
}
