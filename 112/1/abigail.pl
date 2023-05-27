#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    chomp;
    my @parts = split /\/+/;
    my @parts2;

    foreach my $part (@parts) {
        next if $part eq "." || $part eq "";
        if ($part eq "..") {
            pop @parts2;
            next;
        }
        push @parts2 => $part;
    }

    say "/" . join "/" => @parts2;
}

__END__
/a/
/a/b/./c/
/a/b//c/
/a/b/c/../d/..
/a/b/c/../..
/a/b/c/
