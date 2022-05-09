#!/usr/bin/env raku

# munged quite a bit to get this to run...

#subset Count of Int where * >= 0;

#| Script to generate 5-smooth numbers
#unit sub MAIN(
  #my $n; # = 20; #= How many 5-smooth numbers to generate.
  #Bool :$timing = False, #= Display timing information with output.
  #my @print = ^20; #= Specific indices to show.
#);

# Use a lazy list to generate 5-smooth numbers
my $smooth5 = gather {
  # Initialize some iterators.
  my ($i2, $i3, $i5) = ($smooth5.iterator for ^3);
  my ($n2, $n3, $n5) = 1 xx 3;

  # Just keep generating.  Does the list become sparse?  I don't know!
  loop {
    # Minimum of the latest iterations
    take my $n = ($n2, $n3, $n5).min;

    # Advance the iterators that matched.
    $n2 == $n and $n2 = $i2.pull-one * 2;
    $n3 == $n and $n3 = $i3.pull-one * 3;
    $n5 == $n and $n5 = $i5.pull-one * 5;
  }
}

#$smooth5.[^$count].say if $count;

.say for $smooth5[^20];

#for @print.grep(* ~~ Int).sort -> $n {
#  if $timing {
#    my $result = $smooth5[$n-1];
#    (Q:b'\r%6.2fs %*d: %d').sprintf((now - INIT now), @print.max.chars, $n, $result).say;
#  } else {
    #printf('%*d: %d', @print.max.chars, $n, $smooth5[$n-1]);
    #sprintf('%*d: %d', @print.max.chars, $n, $smooth5[$n-1]).say;
#  }
#}
