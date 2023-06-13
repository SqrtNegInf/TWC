#!/usr/bin/env perl
use v5.36;

use Roman;

my @ARGV = <V + VI>;
my $argString = uc "@ARGV";
my $script    = $FindBin::Script;

die "$FindBin::Script requires arguments.\n" if scalar @ARGV == 0;

print STDERR "[Arabic number detected in input]\n" if $argString =~ m{\d+};

$argString =~ s{(\s*[-+*/%]\s*)}{ $1 }g;
$argString =~ s{([MDCLXVI]+)}{arabic $1}ge;

my $result = eval $argString;

my $oldResult = $result;
$result = int $result;
my $decimal = $oldResult - $result;
print STDERR "Calculation result had a decimal $decimal that was truncated.\n" if $decimal;

if ( $result == 0) {
    print "N (no formal zero)\n"; # https://en.wikipedia.org/wiki/Roman_numerals#Zero
} elsif ($result > 3_999) {
    die "Calculation result $result exceeds MMMCMXCIX (3,999) the maximum value of the Roman number format.\n";
} elsif ($result < 0) {
    die "Calculation result $result is negative. Roman numbers are positive integers.\n";
} else {
    $result = Roman(int $result);
    print "$result\n";
}
