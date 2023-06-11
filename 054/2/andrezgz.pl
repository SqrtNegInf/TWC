#!/usr/bin/env perl
use v5.36;

use constant TOP_SEQ => 5;

my $n = 23;
#if (defined $n) {
    die "USAGE: $0 <positive-integer>" unless $n && $n =~ /^\d+$/;
    print collatz_seq($n);
#}
#else{
    top_seq();
#}

sub collatz_seq {
    my $n = shift;
    my $s;
    while ($n != 1) {
        $s .= $n . ' -> ';
        if ($n % 2 == 0) { $n = $n / 2;   }
        else             { $n = 3*$n + 1; }
    }
    return $s . 1;
}

sub top_seq {

    my @long_seq;
    my $min = 0;

    # reversing the order to check bigger numbers first
    # there are less unnecessary pushing/shifting elements
    # from @long_seq array
    for (reverse 1 .. 10000) {
        my $l = seq_length($_);

        # Add sequence
        next if ($l < $min);
        push @long_seq, {'n' => $_, 'l' => $l};
        @long_seq = sort { $a->{l} <=> $b->{l} } @long_seq;

        # Adjust minimum sequence
        next if (@long_seq <= TOP_SEQ);
        shift @long_seq;
        $min = $long_seq[0]->{l};

    }

    print $_->{n} . ': ' . $_->{l}.$/ for (reverse @long_seq);

    return;
}

sub seq_length {
    my $n = shift;
    my $l = 0;
    while ($n != 1) {
        ++$l;
        if ($n % 2 == 0) { $n = $n / 2;   }
        else             { $n = 3*$n + 1; }
    }
    return ++$l;
}
