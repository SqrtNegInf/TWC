#!/usr/bin/env perl
use v5.36;

open DICT, "dictionary.txt" or die "unable to get the dictionary.\n";

my %abec;

# Get Words From Dictionary
my $max = 1;
foreach (<DICT>) {
    chomp($_);
    if (is_abec(lc $_)) {
        push $abec{length $_}->@*, $_;
        $max = length $_ if (length $_) > $max
    }
}


# Print Out the Result
for my $len (reverse 1..$max) {
    next if !defined($abec{$len});
    say join "\n", $abec{$len}->@*;
}



sub is_abec {
    my $word = $_[0];
    return (join "", sort split "", $word) eq $word;
}
