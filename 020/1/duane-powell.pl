#!/usr/bin/env perl
use Modern::Perl;

# Write a script to accept a string from command
# line and split it on change of character.
# For example, if the string is “ABBCDEEF”, then it
# should split like “A”, “BB”, “C”, “D”, “EE”, “F”.

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
