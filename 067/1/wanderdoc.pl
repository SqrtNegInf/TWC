#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);

my $m = shift // 5;
my $n = shift // 3;
die "Two positive integers, m and n, where m > n!$/" unless 
($m =~ /^[0-9]+$/ and $n =~ /^[0-9]+$/ and $n > 0 and $m > $n);



my @memoize; # For the factorial function (s. below).
# This, in turn, only to mimic the output with commas.
$memoize[1] = 1;
my $num_com = factorial($m) /( factorial($n) * factorial($m - $n ) );
my $iter = combinations([1 .. $m], $n);
my $counter;
while (my $c = $iter->next) 
{
    print "[", join(",", @$c), "]";
    $counter++;
    print ", " if $counter < $num_com;
}


sub factorial # From "Mastering Perl".
{
     my $num = $_[0]; 

     return $memoize[$num] if $memoize[$num];
     for ( @memoize .. $num )
     {
          $memoize[$_] = $memoize[$_ - 1] * $_;

     }
     return $memoize[$num];
}
