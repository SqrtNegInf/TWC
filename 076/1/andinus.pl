#!/usr/bin/env perl
use v5.36;

my $input = 51;
chomp $input;

say $input and exit 0 if is_prime($input) == 1;

if ($input % 2 == 0) {
    foreach my $i (2 ... $input / 2) {
        my $diff = $input - $i;
        say "$i + $diff"
            if is_prime($i) and is_prime($diff);
    }
} elsif (is_prime($input - 2)) {
    say "2 + $input";
} else {
    foreach my $i (2 ... ($input - 3) / 2) {
        my $diff = $input - 3 - $i;
        say "3 + $i + $diff"
            if is_prime($i) and is_prime($diff);
    }
}

sub is_prime {
    my $num = shift @_;
    foreach my $i (2 ... sqrt($num)) {
        return 0 if $num % $i == 0;
    }
    return 1;
}
