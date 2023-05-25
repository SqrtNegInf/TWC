#!/usr/bin/env perl
use v5.36;

sub next_num ($prev_num) {
    #
    # First, replace any trailing 3's with 1's, incrementing the
    # digit which comes before.
    # Then replace any 11 with 12 (we can only have 11s at the end)
    # Note we prepend the incoming number with "0" so we can anchor
    # against it; we remove any leading 0 at the end.
    #
    "0$prev_num" =~ s!([012])(3*)$!($1 + 1) . ($2 =~ s/3/1/rg)!re
                 =~ s!11!12!rg
                 =~ s!^0!!r
}

while (<DATA>) {
    my $n = 0;
    $n = next_num $n for 1 .. $_;
    say $n;
}

__END__
5
10
60
