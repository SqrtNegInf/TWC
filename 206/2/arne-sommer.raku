#!/usr/bin/env raku

my @permutations = <1 2 3 4 5 6>.permutations;

#say ": Permutations: { @permutations.join("|") }" if $verbose;

my $max = -Inf;

for @permutations -> @candidate
{
  state $index = 0;
  $index++;
  next if $index %% 2;
  
  my $sum = max-sum-min-pair(@candidate);

  $max = max($max, $sum);
}

say $max;

sub max-sum-min-pair (@array is copy)
{
  my $sum = 0;

  #my $echo = $verbose ?? ":Candidate: { @array.join(",") }  Pairs:" !! "";

  while @array.elems
  {
    my $first   = @array.shift;
    my $second  = @array.shift;
    my $minimum = min($first, $second);
#   $echo ~= "[$first,$second -> $minimum]" if $verbose;
    $sum += $minimum;
  }

# say "$echo -> Sum: $sum" if $verbose;

  return $sum;
}
