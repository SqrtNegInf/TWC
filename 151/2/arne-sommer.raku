#!/usr/bin/env raku

#unit sub MAIN (*@valuables where @valuables.elems && all(@valuables) ~~ Numeric, :v(:$verbose));

# fails on 1st return from 'recurse'?
die 'not ok - disabled: Exception in thread "main" org.raku.nqp.runtime.UnwindException' if $*VM ~~ /jvm/;

#my @valuables = (4, 2, 3, 6, 5, 3);
my @valuables = (2, 4, 5);

my $seq = gather { recurse( (0,), 0, @valuables.elems -1); }

sub recurse(@done is copy, $index, $todo is copy)
{
  if $todo < 2
  {
    say ": Added candidate: @done[]"; # if $verbose;
    take @done;
    return;
  }

  for 2, 3 -> $add
  {
    say ": 2,3 add: $add";
    if $todo >= $add
    {
    say ": todo: $todo";
      my @done1 = @done.clone;
      @done1.push: $index + $add;
      recurse(@done1, $index + $add, $todo - $add);
    }
  }
}
    
my @candidates = $seq;

if True
{
  for @candidates -> @list
  {
    say ": Candidate indices: [{ @list.join(",") }] with sum: { @valuables[@list].sum }";
  }
}

say @candidates.map({ @valuables[@$_].sum }).max;
