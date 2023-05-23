#!/usr/bin/env perl
use v5.36;

while (my $n = <DATA>) {
    chomp $n;

    my $result   = 0;
    my $seen_one = 0;
    foreach my $digit (split // => $n) {
        $result *= 9;
        if    ($seen_one)   {$result += 8}
        elsif ($digit == 1) {$seen_one = 1}
        elsif ($digit)      {$result += $digit - 1}
    }
    say $result;
}

__END__
25
200
