#!/usr/bin/env raku

#unit sub MAIN (Str $A, Str $B);

#my @A = $A.split("|")>>.words>>.List;
#my @B = $B.split("|")>>.words>>.List;

my @A = [ 1, 2 ], [ 3, 4 ];
my @B = [ 5, 6 ], [ 7, 8 ];

my $A-rows = @A.elems;
my $A-cols = @A[0].elems;
my $B-rows = @B.elems;

my @C;

for ^$A-rows -> $Ar
{
  for ^$B-rows -> $Br
  {
    my @row;
    for ^$A-cols -> $Ac
    {
      @row.append: (@B[$Br]).map({ $_ * @A[$Ar][$Ac] });
    }

    @C.push: @row;
  }
}

@C.map: *.say;
