#!/usr/bin/env raku

unit sub MAIN (Str :m(:$matrix) = "1 2 | 3 4", Int :$r where $r > 0 = 1, Int :$c where $c > 0 = 4, :v(:$verbose));

my @all   = $matrix.split(/<[\s|]>+/);
my $count = @all.elems;

say ": All: { @all.raku }" if $verbose;
say ": Count: $count"      if $verbose;

if $r * $c == $count
{
  my @result;

  for ^$r -> $row-id
  {
    my $start-index = $row-id * $c;
    my $stop-index  = $start-index + $c - 1;
    
    say ": Row $row-id [ index $start-index .. $stop-index ]" if $verbose;
    @result.push: @all[$start-index .. $stop-index];
  }

  say @result.elems == 1
    ?? "[ { @result[0].join(", ") } ]"
    !! "[ { @result.map({ '[' ~ @_.join(", ") ~ ']' }).join(", ") } ]";
}
else
{
  say 0;
}
