#!/usr/bin/env perl
use v5.36;
sub move_zero{
  my $count = 0;
  my @ret = grep {$_ == 0 ? $count++ && () : $_} @{$_[0]};
  push @ret, (0) x $count;
  sprintf "(%s)\n" => join ',' => @ret;
}

print move_zero([1,0,3,0,0,5]);
print move_zero([1,6,4]);
print move_zero([0,1,0,2,0]);

