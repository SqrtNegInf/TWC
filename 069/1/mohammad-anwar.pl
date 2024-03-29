#!/usr/bin/env perl
use v5.36;

my $A = $ARGV[0] || 1;
my $B = $ARGV[1] || 200;

print sprintf("[%s]\n", join ', ', strobogrammatic_numbers($A, $B));

sub strobogrammatic_numbers {
    my ($start, $stop) = @_;

    die "ERROR: Missing start number.\n"
        unless defined $start;
    die "ERROR: Missing stop  number.\n"
        unless defined $stop;
    die "ERROR: Invalid start number [$start].\n"
        unless ($start >= 1);
    die "ERROR: Invalid end number [$stop].\n"
        unless ($stop >= 1);
    die "ERROR: Invalid start number [$start].\n"
        unless ($start < $stop);

    my %digits = (6 => 9, 8 => 8, 9 => 6);

    my @strobogrammatic = ();
    foreach my $n ($start .. $stop) {
        next if ($n < 10);

        my $found = 1;
        my @match = ();
        foreach my $i (split //, $n) {
            if (exists $digits{$i}) {
                push @match, $digits{$i};
            }
            else {
                $found = 0;
                last;
            }
        }

        if ($found) {
            push @strobogrammatic, $n
                if ($n == join('', reverse @match));
        }
    }

    return @strobogrammatic;
}
