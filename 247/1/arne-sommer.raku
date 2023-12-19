#!/usr/bin/env raku

#multi MAIN (Int $example where $example == 1|2, :v(:$verbose))
#{
  my @names = 1 == 1
  ?? ('Mr. Wall',
      'Mrs. Wall',
      'Mr. Anwar',
      'Mrs. Anwar',
      'Mr. Conway',
      'Mr. Cross',
     )
  !! ('Mr. Wall',
      'Mrs. Wall',
      'Mr. Anwar',
     );

  glorp(@names);
#}

multi glorp (*@names)
{
  my %count;

  @names.map({%count{family($_)}++});

  my @sorted = @names.sort({ %count{family($^b)} <=> %count{family($^a)} || Bool.pick });

  my $first = @sorted.shift;
  my $from  = $first;

  while (@sorted)
  {
    my $to = @sorted.shift;

    if (@sorted.elems && family($from) eq family($to))
    {
      my $next = @sorted.pop; # shift;
      @sorted.unshift: $to;
      $to = $next;
    }

    say "$from -> $to";

    $from = $to;
  }

  say "$from -> $first";
}

sub family ($name)
{
  my ($title, $family) = $name.words;
  return $family;
}
