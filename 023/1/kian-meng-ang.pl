#!/usr/bin/env perl
use v5.36;

use constant USAGE => qq|USAGE: perl $0 <order> <n1,n2,...,nN>|;
use Carp;

my $order = $ARGV[0] || 1;
my @seq = (5, 9, 2, 8, 1, 6);

my @trace;
foreach my $o (1 .. $order) {
    my @nseq;
    foreach my $s (1 .. scalar @seq - 1) {
        push @nseq, $seq[$s] - $seq[$s - 1];
    }
    push @trace, \@nseq;
    @seq = @nseq;
}

foreach (0 .. scalar @trace - 1) {
    say sprintf q|order:%s seq:%s|, $_ + 1, join q|,|, @{$trace[$_]};
}
