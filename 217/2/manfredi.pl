#!/usr/bin/env perl
use v5.36;

sub max_number {
    my @list = @{+shift};
    $" = ', ';
    say "Input: \@list = (@list)";
    my $out = join "", sort { $b cmp $a } @list;  
    say "Output: $out\n";
}

while (<DATA>) {
    chomp;
    my @list = split /\s*,\s*/;
    max_number(\@list);
}


__DATA__
1, 23
10, 3 ,2
31, 2 , 4, 10
5, 11, 4, 1, 2
1, 10
