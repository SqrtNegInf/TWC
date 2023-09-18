#!/usr/bin/env perl
use v5.36;

my @wordlist = (["java", "javascript", "julia"],["bella", "label", "roller"],["cool", "lock", "cook"]);

for my $wds ( @wordlist) {
    my $wordnum = scalar @$wds;
    say "wordnum = $wordnum";
    my %seen = ();
    my $charlist = "";
    say "Input: \@words = (@$wds)";
    my $cnt = 0;
    while($cnt < 3) {
        $charlist .= @$wds[$cnt];
        $cnt++;
    }
    my @arr = split("",$charlist);
    for my $c ( @arr) {
        $seen{$c} += 1;
    }
    print "Output: (";
    for my $key (keys %seen) {
        if ($seen{$key} == ($wordnum * 2)) {
            print "$key $key ";
        } elsif (( $seen{$key} >= $wordnum) && ( $seen{$key} < ($wordnum * 2))) {
            print "$key ";
        }
    }
    print ")\n\n";
}
