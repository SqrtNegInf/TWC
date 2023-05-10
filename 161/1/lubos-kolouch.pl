#!/usr/bin/env perl
use v5.36;
# glory for best belly boy!

sub is_abcd {
    my $what = shift;

    return $what eq join( '', sort( split //, $what ) );
}

open my $file, '<', 'dictionary.txt';

while (<$file>) {
    chomp;

    print "$_ is abcdrian \n" if is_abcd($_);
}
close $file;
