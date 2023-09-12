#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);
use Test2::V0 -srand => 1;

sub word_letters
{
     my $str = $_[0];
     my %uniq;
     my $ltr = join('', sort { $a cmp $b }
          grep { ! $uniq{$_}++ } split(//,$str));
     return $ltr;
}

sub find_pairs
{
     my @wds = @_;

     my %similar;
     for my $wd ( @wds )
     {
          push @{$similar{ word_letters($wd) }}, $wd;
     }

     my @output;
     for my $key ( keys %similar )
     {
          next if scalar @{$similar{$key}} < 2;
          my $iter = combinations(\@{$similar{$key}}, 2);
          while (my $p = $iter->next)
          {
               push @output, $p; # print "@$p$/";
          }
     }
     @output = sort { $a->[0] cmp $b->[0] } @output; # for Test2::V0 only.
     if ( scalar @output > 0 ) { return [@output];}
     else { return 0;}
}

# find_pairs("nba", "cba", "dba");
is (find_pairs("aba", "aabb", "abcd", "bac", "aabc"), [['aba', 'aabb'], ['bac', 'aabc']], 'Example 1');
is (find_pairs("aabb", "ab", "ba"), [['aabb', 'ab'], ['aabb', 'ba'], ['ab', 'ba']], 'Example 2');
is (find_pairs("nba", "cba", "dba"), 0, 'Example 3');
done_testing();
