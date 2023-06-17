#!/usr/bin/env perl
use v5.36;

my %hash;
for my $file ('../00-blogs') {
    open(my $fh, '<', $file);
    my @data = <$fh>;
    $hash{ +lc }++ for "@data"=~/\pL/g;
    close $fh;
    
}

for my $keys (sort keys %hash) {
    say "$keys: $hash{$keys}"
}
