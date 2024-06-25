#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
# use Math::Round;
use Test2::V0 -no_srand;

# sprintf uses the Round half to even method.
# Math::Round would do the right thing.
# Here we imitate  $Math::Round::half to fix the sprintf behavior.
use constant epsilon => 1e-6;

is(percentage_character('perl', 'e'), 25, 'Example 1');
is(percentage_character('java', 'a'), 50, 'Example 2');
is(percentage_character('python', 'm'), 0, 'Example 3');
is(percentage_character('ada', 'a'), 67, 'Example 4');
is(percentage_character('ballerina', 'l'), 22, 'Example 5');
is(percentage_character('analitik', 'k'), 13, 'Example 6');
done_testing();


sub percentage_character
{
     my $string = $_[0];
     my $character = $_[1];
     my %freq;
     for my $chr (split(//, lc $string))
     {
          $freq{$chr}++;
     }
     my $this_freq = $freq{ lc $character } // 0;
     return # round($this_freq * 100 / sum(values %freq));
          sprintf("%.0f", (epsilon + $this_freq / sum(values %freq)) * 100 );
}
