#!/usr/bin/env perl
use v5.36;

use lib qw(.);
use Roman;

my @ARGV = <V + VI>;
die "Usage: romancalc R1 OP R2    [R1 and R2 are Roman numerals or integers]\n".
    "or:    romancalc test\n"
	unless @ARGV==3 || (@ARGV==1 && $ARGV[0] eq "test");

if( @ARGV==1 && $ARGV[0] eq "test" )
{
	testroman();
	exit 0;
}

my( $r1, $op, $r2 ) = @ARGV;
my $origr1 = $r1;
my $origr2 = $r2;

$r1 = fromroman($r1) if $r1 =~ /^[MCDLXVI]+$/;
$r2 = fromroman($r2) if $r2 =~ /^[MCDLXVI]+$/;

die "romancalc: bad r1: $r1\n" unless $r1 > 1 && $r1 < 4000;
die "romancalc: bad r2: $r2\n" unless $r2 > 1 && $r2 < 4000;

my $n = eval "$r1 $op $r2" || die "romancalc: bad operator $op\n";
$n = int($n);

my $r = toroman($n);
say "result of $origr1 ($r1) $op $origr2 ($r2): $r ($n)";
