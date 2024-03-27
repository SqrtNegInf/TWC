#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Algorithm::Combinatorics qw(permutations);
# Tuples are generated in lexicographic order, except in subsets().

is(dictionary_rank('CAT'), 3, 'Example 1');
is(dictionary_rank('GOOGLE'), 88, 'Example 2');
is(dictionary_rank('SECRET'), 255, 'Example 3');
done_testing();

sub dictionary_rank
{
     my $word = $_[0];
     my @data = sort { $a cmp $b } split(//, $word);
     my $counter = 0;
     my %seen;
     my $iter = permutations(\@data);
     while (my $c = $iter->next) 
     {
          my $tuple = join('', @$c);
          next if (exists $seen{$tuple});
          $seen{$tuple} = undef;
          $counter++;
          if ( $tuple eq $word )
          {
               return $counter;
          }
     }
}
