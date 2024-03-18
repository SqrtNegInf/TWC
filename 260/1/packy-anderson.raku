#!/usr/bin/env raku

sub uniqueOccurrences(@ints) {
  my %counts;
  for @ints -> $i {
    # count how many time each int occurs
    %counts{$i}++;
  }
  my %seen;
  for %counts.kv -> $i, $c {
    # if we've seen this count before, return 0
    return 0 if %seen{$c}:exists;
    %seen{$c} = $i;
  }
  # each count was unique
  return 1;
}

sub solution(@ints) {
  say 'Input: @ints = (' ~ @ints.join(', ') ~ ')';
  say 'Output: ' ~ uniqueOccurrences(@ints);
}

say "Example 1:";
solution([1,2,2,1,1,3]);

say "\nExample 2:";
solution([1,2,3]);

say "\nExample 3:";
solution([-2,0,1,-2,1,1,0,1,-2,9]);
