#!/usr/bin/env perl
use v5.36;

my @listOfLists;

# Read the number list
while (<DATA>) {
  s/#.*//;
  s/^\s*(.*?)\s*$/$1/;

  my @l = split(/\s+/);

  push(@listOfLists,\@l) if (scalar(@l));
}

foreach my $list (@listOfLists) {
  # Deref for easier editing ;-)
  my @list = @$list;

  my ($maxLeftIdx, $lIdx) = (0, 0);
  my ($maxRightIdx, $rIdx)  = (1, 1);

  # Initially the first two factors are the first maximum
  my $maxProduct = $list[$lIdx] * $list[$rIdx];

  my $tmpProduct = $maxProduct;

  # Go for a 'C' like style solution with 'pointers'
  while ($rIdx < scalar(@list) - 1) {
    while ($rIdx < scalar(@list) - 1 and 
           $tmpProduct * $list[$rIdx + 1] > $tmpProduct) {
      $tmpProduct *= $list[$rIdx + 1];
      $rIdx++;
    }

    # New maximum product found?
    # If so keep value and indexes
    if ($tmpProduct > $maxProduct) {
      ($maxProduct, $maxLeftIdx, $maxRightIdx) = ($tmpProduct, $lIdx, $rIdx);
    }

    # List exhausted?
    last if ($rIdx == scalar(@list) - 1);

    # Last factor must have been 0 or smaller to make the running 
    # product smaller then its predecessor.
    #
    # Set 'pointers' to new starting point
    if ($list[$rIdx + 1] == 0) {
      # If 0 then maximum is (potentially) at the right
      $rIdx += 2;
    } else {
      $rIdx++;
    }

    $lIdx = $rIdx - 1; 

    # Calculate the new potential maximum
    $tmpProduct = $list[$lIdx] * $list[$rIdx];
  }

  # New maximum product found?
  # If so keep value and indexes
  if ($tmpProduct > $maxProduct) {
    ($maxProduct, $maxLeftIdx, $maxRightIdx) = ($tmpProduct, $lIdx, $rIdx);
  }

  print "# ------------------------------------------------------------------\n";
  printf "Input: [ %s ]\n", join(', ', @list);
  printf "Output: [ %s ] which gives maximum product %d\n",
          join(', ', @list[$maxLeftIdx .. $maxRightIdx]), $maxProduct;
  print "# ------------------------------------------------------------------\n";
}

# The rest of the file is test sets
__DATA__
 2  5 -1  3 
 3  1  0  6  1  2
 3 -1 -2 -1  5  1
-2  3  0  5 -1 -2
-3  2  0  0 -5 -3
-4 -1 -8  0  1  7
 5 -1  0  1  1
 1 -9  1 -1  1  2
 1 -5  1  0 -5  1  2
 1 -4  1  2 
