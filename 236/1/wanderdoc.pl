#!/usr/bin/env perl
use v5.36;

use Test::More;

sub exact_change
{
     my @bills = @_;
     my %change;
     for my $bill ( @bills )
     {
          if ( $bill == 5 )
          {
               $change{$bill}++;
          }
          elsif ( $bill == 10 )
          {
               if ( $change{5} > 0 )
               {
                    $change{$bill}++;
                    $change{5}--;
               }
               else
               {
                    return 'false';
               }
          }
          elsif ( $bill == 20 )
          {
               if ( $change{5} > 2 ) 
               { 
                    $change{$bill}++; 
                    $change{5} -= 3; 
               }
               elsif ( $change{5} > 0 and $change{10} > 0 )
               {
                    $change{$bill}++;
                    $change{5}--;
                    $change{10}--;
               }
               else
               {
                    return 'false';
               }
          }
     }
     return 'true';
}


is_deeply(exact_change(5, 5, 5, 10, 20), 'true', 'Example 1');
is_deeply(exact_change(5, 5, 10, 10, 20), 'false', 'Example 2');
done_testing();
