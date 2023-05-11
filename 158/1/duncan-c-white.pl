#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use List::Util qw(sum0);
#use Data::Dumper;

use lib qw(.);
use MakePrimes;

my $debug=0;
die "Usage: additiive-primes [--debug] [limit] (default 100)\n"
	unless GetOptions( "debug"=>\$debug ) && @ARGV<2;

my $limit = shift // 100;

my @primes = primes_upto( $limit );
my %isprime = map { $_ => 1 } @primes;

my @addprimes = grep { $isprime{ sum0( split(//,$_) ) } } @primes;

say join(', ', @addprimes);
