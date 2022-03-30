#!/usr/bin/env raku

#unit sub MAIN (*@A where @A.elems && all(@A) ~~ Int);
my @A = <9 10 7 5 6 1>;

my @B;

while (@A)
{
  my $a = @A.shift;
  @B.push: $a if $a > all(@A);  
}

say '(' ~ @B.join(', ')  ~ ')';
