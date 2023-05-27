#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0 first);

foreach my $n(5){  # Number of steps from @ARGV
      say "\nInput: $n\nCombinations:";
      foreach my $n2(0..$n/2){
	  my $n1=$n-2*$n2;
	  my $total=$n1+$n2;
	  my $combinator=combinator($total, $n1);
	  while(my @combination=$combinator->()){
	      say join ",", map {$_==0?"double":"single"} @combination;
	  }
      }
}

sub combinator { # produces combinations of n taken k at a time
      my ($n,$k)=@_;
      my @number=((1) x $k, (0) x ($n-$k)); # binary $n-bit number as array
      my $done=0;
      my $iter=0;
      sub {
	  return if $done;
	  return @number if $iter++==0; #first time through
	  @number=following(@number);
	  return @number if @number;
	  $done=1;
	  return;
      }
}

sub following {
    my @number=@_;
    my $first_10=first {$number[$_]==1 && $number[$_+1]==0} (0..@number-2);
    return unless defined $first_10;
    @number[$first_10, $first_10+1]=(0,1);
    restart (@number[0..$first_10-1]);
    return @number;
}

sub restart {
    return unless @_;
    my $ones=sum0 @_;
    @_[0..$ones-1]=(1)x$ones;
    @_[$ones..@_-1]=(0)x(@_-$ones);
}
