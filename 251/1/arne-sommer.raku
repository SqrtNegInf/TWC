#!/usr/bin/env raku

#unit sub MAIN (*@ints where all(@ints) ~~ Int && @ints.elems > 0, :v(:$verbose));
my @ints = (10, 7, 31, 5, 2, 2);


my $output = 0;

#say ":Remaining:{ @ints.join(",") }" if $verbose;

while @ints
{
  my $add = @ints.shift;

  $add ~= @ints.pop if @ints.elems;

  $output += $add;

  #say ":Remaining:{ @ints.join(",") } - Add:$add (Total:$output)" if $verbose;
}

say $output;
