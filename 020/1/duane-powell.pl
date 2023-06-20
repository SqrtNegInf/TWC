#!/usr/bin/env perl
use v5.36;

my $str = 'bookkeeper';
my @str = split(//,$str);

my ($a, $b) = splice(@str,0,2);
my $out = $a;
while (defined($b)) {
    if ($a eq $b) {
    	$out .= $b;
    } else {
    	print "$out,";
    	$out = $b;
    }
    $a = $b;
    $b = shift(@str);
}
say $out;
