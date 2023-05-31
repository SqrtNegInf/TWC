#!/usr/bin/env perl
use v5.36;

my $input = "101";

my @array = split('', $input);
my $lastField = @array - 1;

if ($array[0] eq '-') {
    print "Output: 0\n";
        exit;
}

for (my $i = 0; $i<@array; $i++) {
    if ($array[$i] != $array[$lastField]) {
        print "Output: 0\n";
        exit;
    }
    $lastField = $lastField - 1;

}

print "Output: 1\n";
