#!/usr/bin/env raku

subset Positive of Int where * >= 1;

sub MAIN (@list is copy = (5, 9, 2, 8, 1, 6) )
{
    my $order = 1;
  die "Integers only in the list!" unless @list.all ~~ Int;
    
  @list = forward-difference(@list) for ^$order;

  say @list;
}

sub forward-difference (@list)
{
  return gather take @list[$_] - @list[$_ -1] for 1 .. @list.end;
}
