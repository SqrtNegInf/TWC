#!/usr/bin/env perl
use v5.36;
use English qw/ -no_match_vars /;

my ($m, $n) = (5, 5);

my $mlength = length $m;
my $nlength = length $n;
my $mnlength = length ($m * $n);
my %terms;

say q{}, (sprintf "% ${\($mlength + 2)}s", 'x |'),
    map { sprintf "% ${\($mnlength)}s ", $_} 1 .. $n;
say q{-} x ($mlength + 1), q{+}, q{-} x ($n * ($mnlength + 1) - 1);

for my $em (1 .. $m) {
    printf "% ${\($mlength)}s |", $em;
    for my $en (1 .. $n) {
        my $term = $em * $en;
        $terms{$term}++;
        printf "% ${\($mnlength)}s ", $term;
    }
    print "\n";
}
print("\n");

say 'Distinct Terms: ', join q{, }, sort { $a <=> $b } keys %terms;
say 'Count: ', scalar keys %terms;
