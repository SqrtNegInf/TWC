#!/usr/bin/env raku

my @a = qw/1 2 3/;
my @b = qw/a b c /;

sub zip ( @first, @second ) {

  my @c;
  if @first.elems != @second.elems {
    say "Error: Unbalanced arrays!";
    say @first;
    say @second;
    exit(-1);
  }

  loop ( my $x = 0; $x < @a.elems; $x++ ) {
    @c.push(@first[$x]);
    @c.push(@second[$x]);
  }
  return @c;
}

say zip(@a,@b);
say zip(@b,@a);
