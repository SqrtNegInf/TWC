#!/usr/bin/env perl
use v5.36;

srand 1;

use List::Util qw/shuffle/;

# Let's make sure we have equal number of ( and ) to increase chances
my $count = rand(10)+1; # Could be as low as 1, as high as 10
my @chars = ( '(', ')' ) x $count;
@chars    = shuffle(@chars);
print join('',@chars)."\n";

# Walk through to validate
my $current_open = 0;
for my $char (@chars){
  if ($char eq '('){
    $current_open++;
  } elsif ($current_open == 0){
    print "Not Valid\n";
    exit;
  } else {
    $current_open--;
  }
}
print "Valid\n";
