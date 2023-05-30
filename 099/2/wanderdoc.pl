#!/usr/bin/env perl
use v5.36;

sub find_subsequence
{
     my ($str_1, $str_2) = @_;

     my $mtr;

     my @first  = split(//,$str_1);
     my @second = split(//,$str_2);

     do { my $ch1 = $_;
          do { $mtr->[$ch1][$_] = 0 } for 0 .. scalar @second }
          for 0 .. scalar @first;
     $mtr->[$_][0] = 1 for 0 .. scalar @first;

     for my $i ( 1 .. scalar @first )
     {
          for my $j ( 1 .. scalar @second )
          {


               if($first[$i-1] eq $second[$j-1])
               {
                    $mtr->[$i][$j] += $mtr->[$i-1][$j] + $mtr->[$i-1][$j-1];
               }
               else
               {
                    $mtr->[$i][$j] += $mtr->[$i-1][$j];
               }

          }
     }
     return $mtr->[-1][-1];
}

is(find_subsequence(qw(littleit lit)), 5, 'Example 1');
is(find_subsequence(qw(london lon)), 3, 'Example 2');
is(find_subsequence(qw(trace car)), 0, 'Example with 0');

done_testing();
