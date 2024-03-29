#!/usr/bin/env perl
use v5.36;

use ntheory qw(primes);

my %primes;
my $sorted_primes = primes(1000);
@primes{@{$sorted_primes}} = undef;

for my $NUM ( 5 .. 51 )
{

     if ( $NUM % 2 == 0 )
     {
          my ($first, $second) = check_even($NUM);
          print "${NUM} = ${first} + ${second}$/" unless $first == 0;
          print "Something went wrong, probably too big number.$/" if $first == 0;
     }
     else
     {
          my @answer = sort {$a<=>$b} check_odd($NUM);
          print "${NUM} = ", join(' + ', @answer), $/ unless $answer[0] == 0;
          print "Something went wrong, probably too big number.$/" if $answer[0] == 0;
     }


}



# Algorithm: https://stackoverflow.com/questions/35755825
sub check_even
{
     my $num = $_[0];

     for my $prim ( @{$sorted_primes} )
     {
          if ( exists $primes{$num - $prim} )
          {

               return ($prim, $num - $prim);
          }
     }

     return (0, 0);
}

sub check_odd
{
     my $num = $_[0];
     if ( exists $primes{$num - 2} )
     {

          return ($num - 2, 2);
     }
     else
     {
          my ($first, $second) = check_even($num - 3);
          if ( exists $primes{$first} )
          {
               return ($first, $second, 3);

          }
          else
          {
               return (0, 0, 0);
          }
     }
}
