#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use List::Util qw(sum0 product);

# allow any mixture of commas and spaces (separate arguments)
my $str = '1,3,5,6,9';

my @x = split(/,/, $str);
my $n = @x;

my $total = sum0(@x);
my $prod = abs(product(@x));
my $recipsum = sum0( map { 1/$_ } @x );

say "n=$n, total=$total, prod=$prod; recipsum=$recipsum";

my $am = $total/$n;		# sum(@x)/$n
my $gm = $prod ** (1/$n); 	# nth_root( $n, abs(product(@x)) )
my $hm = $n /  $recipsum;	# n / sum( reciprocals(@x) )

printf "AM = %.1f, GM = %.1f, HM = %.1f\n", $am, $gm, $hm;
