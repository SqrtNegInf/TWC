#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);
use POSIX qw(floor);

my ($N, $D)= (24,7);
die "Usage: ./ch-1b.pl positive-integer digit"
    unless defined $N and defined $D and $N>=0
    and $D=~m/^\d$/ and $N==floor $N;
say("Inputs: N=$N D=$D: Output: 1 as $N>=",$D*10), exit if $N>=$D*10;
my @set=reverse grep {m/$D/} (1..$N); # ordered set from large to small.
my @answer=find($N,@set);
say("Inputs: N=$N D=$D: Output: ",
    @answer? "1 as $N=". join("+", @answer):"0");


sub find {
    my ($goal, @set)=@_;
    while(defined (my $current=shift @set)){
	next if $current > $goal;
	return ($current) if $current==$goal;
	my @answer=find($goal-$current, @set);
	return ($current,@answer) if @answer;
    }
    return ();
}
