#!/usr/bin/env raku

#unit sub MAIN (:$H, :$T, :$A = "", :$verbose, :$verbose2);

#my @H = $H.words>>.Int;
#my @T = $T.words>>.Int;
#my @A = $A.words>>.Int;

my  @H = (27, 21, 37,  4, 19, 52, 23, 64,  1,  7, 51, 17, 24, 50,  3,  2,
          34, 40, 47, 20,  8, 56, 14, 16, 42, 38, 62, 53, 31, 41, 55, 59,
          48, 12, 32, 61,  9, 60, 46, 26, 58, 25, 15, 36, 11, 44, 63, 28,
           5, 54, 10, 49, 57, 30, 29, 22, 35, 39, 45, 43, 18,  6, 13, 33);

    # Number taller people in front
my  @T = ( 6, 41,  1, 49, 38, 12,  1,  0, 58, 47,  4, 17, 26,  1, 61, 12,
          29,  3,  4, 11, 45,  1, 32,  5,  9, 19,  1,  4, 28, 12,  2,  2,
          13, 18, 19,  3,  4,  1, 10, 16,  4,  3, 29,  5, 49,  1,  1, 24,
           2,  1, 38,  7,  7, 14, 35, 25,  0,  5,  4, 19, 10, 13,  4, 12);

    # Expected answer
my  @A = (35, 23,  5, 64, 37,  9, 13, 25, 16, 44, 50, 40,  2, 27, 36,  6,
          18, 54, 20, 39, 56, 45, 12, 47, 17, 33, 55, 30, 26, 51, 42, 53,
          49, 41, 32, 15, 22, 60, 14, 46, 24, 59, 10, 28, 62, 38, 58, 63,
           8, 48,  4,  7, 31, 19, 61, 43, 57, 11,  1, 34, 21, 52, 29,  3);


# die "Repeated heights" if @H.repeated;
die "H and T have different sizes" if @H.elems != @T.elems;
die "A have different size than H and T" if @A && @A.elems != @H.elems;

class Lineup
{
  has Int $.height;
  has Int $.taller;
}

my @list;

for ^@H -> $index
{
  @list.push: Lineup.new(height => @H[$index], taller => @T[$index]);
}

my @result;

for @list.sort({ $^b.height <=> $^a.height }) -> $elem
{
  my $taller = $elem.taller;

#  say ": H:{ $elem.height } -> T:{ $elem.taller }" if $verbose;

  if (@result[$taller].defined)
  {
    @result.splice($taller, 1, $elem, @result[$taller]);
  }
  else
  {
    die "Not enough taller persons in front of { $elem.height }: { @result.elems } (should have been $taller)"
      if  @result.elems != $taller;
      
    @result.push: $elem;
  }
}

#say ": " ~ @result.raku if $verbose;

say @result>>.height.join(", ");

#say @result.map({ ": " ~ ++$ ~ ": " ~ $_.height ~ "[<" ~ $_.taller ~ "]"}).join("\n") if $verbose2;

say @result>>.height eqv @A if @A;
