#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Data::Dumper;
use List::Util qw(sum0);

my $debug=0;

my $isbn = '978-0-306-40615-7';
$isbn =~ tr/-//d;
my $len = length($isbn);
if( $len==13 )
{
	$isbn =~ s/.$//;
	$len--;
}

die "isbn-13 checker: $isbn (len $len) should be 12 chars long\n"
	unless $len == 12;

my $scale = 3;
my $total = sum0( map { $scale = 4-$scale; $scale * $_; } split(//,$isbn) );
$total %= 10;
$total = 10-$total;
$total %= 10;

say $total;
