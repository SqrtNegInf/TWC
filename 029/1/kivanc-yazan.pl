#!/usr/bin/env perl
use v5.36;

use List::Util qw/any none/;

my @input = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge';
my $i = 0;
my $input_last_index = 0;
my @output = ();

# Handle one {,} at a time
while ($i <= $input_last_index){
  my $in = $input[$i];

  # First, find leftmost }. Then find closest { on its left.
  # eg. abc{xyz{123}...}...
  #            ^   ^
  my $right_paran = index($in, '}');
  my $left_paran  = index($in, '{');
  my $test_left_paran = index($in, '{', $left_paran + 1);
  while ($test_left_paran > -1 && $test_left_paran < $right_paran){
    $left_paran = $test_left_paran;
    $test_left_paran = index($in, '{', $left_paran + 1);
  }
  # Keep substrings up to { and after }
  my $up_to_left_paran  = substr($in, 0, $left_paran);
  my $after_right_paran = substr($in, $right_paran + 1);

  # Start an array to keep boundaries of words to be expanded
  # This will have indices of { } and all ,s in between
  my @limits = ($left_paran);
  # Find all ,s in between { and }
  my $comma = index($in,',',$left_paran);
  while ($comma > $left_paran && $comma < $right_paran){
    push @limits, $comma;
    $comma = index($in,',',$comma+1);
  }
  push @limits, $right_paran;

  # Process words now that we know where they are
  for my $j (0..((scalar @limits) - 2)){
    # Find this one word to be expanded ..
    my $offset = $limits[$j] + 1; # start from left boundary + 1
    my $length = $limits[$j+1] - $limits[$j] - 1; # and take up to right boundary
    my $word = substr($in, $offset, $length);

    # Now join everything up to { + this word + everything after }
    my $join = $up_to_left_paran . $word . $after_right_paran;

    # If there's still a { push the whole thing to the end of @input.
    # Otherwise, push it to the @output (no duplicates)
    if (index($join,'{') > -1){
      push @input, $join;
    } elsif (none {$_ eq $join} @output){
      push @output, $join;
    }
  }

  # Update loop values
  $input_last_index = scalar @input - 1;
  $i++;
}

# Sort and print!
@output = sort @output;
print join("\n",@output)."\n";
