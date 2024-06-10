#!/usr/bin/env perl
use v5.36;
my $ip=join '\.', ('\d{1,3}') x 4;
my @A = "1.1.1.1";
for(@A){
    my $original=$_;
    warn "Not a valid IP: $_", next unless /^$ip$/;
    s/\./[.]/g;
    say "$original -> $_";
}
