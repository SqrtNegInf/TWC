#!/usr/bin/env perl
use v5.36;

sub distribute_elements{
  my @ret1 = shift @{$_[0]};
  my @ret2 = shift @{$_[0]};
  while(@{$_[0]}){
    my $e = shift @{$_[0]};
    $ret1[-1] > $ret2[-1] ? push @ret1,$e : push @ret2,$e;
  }
  @ret1,@ret2
}

say join '  ', distribute_elements([2,1,3,4,5]);
say join '  ', distribute_elements([3,2,4]);
say join '  ', distribute_elements([5,4,3,8]);

