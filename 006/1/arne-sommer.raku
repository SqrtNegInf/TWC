#!/usr/bin/env raku

unit sub MAIN (Str $values = '1,2,3,4,9,10,14,15,16');

my @values = $values.split(",");

die "Integers only!" if @values.grep(/\D/);
die "Wrong order!"   unless [<] @values;

my @result;

my @current = @values.shift;        # [1]

while @values                       # [2]
{
  my $next = @values.shift;         # [2]
  if $next == @current[* -1] + 1
  {
    @current.push($next);           # [3]
  }
  else
  {
    @result.push(fix-it(@current)); # [4]
    @current = $next;               # [4]
  }
}

@result.push(fix-it(@current)) if @current.elems;   # [5]

say @result.join(",");                              # [6]

sub fix-it (@list)                                  # [7]
{
  return @list[0]              if @list.elems == 1; # [8]
  return "@list[0],@list[1]"   if @list.elems == 2; # [9]
  return "@list[0]-@list[*-1]" if @list.elems  > 2; # [10]
}
