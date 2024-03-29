#!/usr/bin/env perl
use v5.36;

my $arg = 28;

print sprintf("%s => %s\n", $arg, excel_column($arg));

sub excel_column {
    my ($arg) = @_;

    if ($arg =~ /^\d+$/) {
        my $name = '';
        my @name = (0, 'A' .. 'Z');
        while ($arg > 26) {
            my $i = int $arg / 26;
            $name .= $name[$i];
            $arg  -= ($i * 26);
        }
        $name .= $name[$arg];

        return $name;
    }
    elsif ($arg =~ /^[A-Z]+$/i) {
        my $i = 0;
        my $b = 26;
        my $d = 0;
        foreach my $c (split //, scalar(reverse(uc $arg))) {
            $d += (ord($c) - ord("A") + 1) * ($b ** $i++);
        }

        return $d;
    }
    else {
        die "ERROR: Invalid column [$arg].\n";
    }
}
