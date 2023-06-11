#!/usr/bin/env perl
use v5.36;

++$|;

sub msgExit {
    print $FindBin::Script, " requires one positive integer as an argument (or extracredit).\n";
    exit(1);
}

my %high = ();

sub checkHighKeys {
    my $key = $_[0];
    my $keyCount = $_[1];
    my $highKeys = $_[2];

    if (keys %$highKeys == 20) {
        my $keyToLowest = (sort {$highKeys->{$a} <=> $highKeys->{$b} or $a <=> $b } keys %$highKeys)[0];
        if ($highKeys->{$keyToLowest} < $keyCount) {
            delete $highKeys->{$keyToLowest};
            $highKeys->{$key} = $keyCount;
        } elsif ($highKeys->{$keyToLowest} == $keyCount) {
            if ($keyToLowest < $key) {
                delete $highKeys->{$keyToLowest};
                $highKeys->{$key} = $keyCount;
            }
        }
    } else {
        $highKeys->{$key} = $keyCount;
    }
}

my $n = 23;
my $extraCredit = 1;

if ($n =~ m{-{0,2}extra[-~`!@#$%^&*=+|\\;:'",.?/ ]?credit}i) {
    $n = 2;
    $extraCredit = 1;
    print STDERR "Allow time for calculations.\n";
    print STDERR "        They finish when '#'s reach this point-> |\n";
} elsif ($n =~ m{\A\d+\Z}) {
    msgExit if $n < 1;
} else {
    msgExit;
}

my $MAX = 10_000;
my $i = $n;

OUTER_LOOP:
while ($i <= $MAX) {
    my $count = 0;

    while ($n != 1) {

        if ($extraCredit) {
            $count++;
        } else {
            print "$n -> ";
        }

        if ($n % 2 == 0) {          # EVEN
            $n /= 2;
        } else {                    # ODD
            $n = 3*$n + 1;
        }
    }

    if ($extraCredit) {
        checkHighKeys( $i, $count, \%high);
        $n = ++$i;
        if ($n % 20_000 == 0) {
            print STDOUT "#";
        }
    } else {
        print "1\n";
        last OUTER_LOOP;
    }
}

if ($extraCredit) {
    print STDERR "\n\n";
    foreach my $key (sort { $high{$b} <=> $high{$a} or $b <=> $a } keys %high) {
        print "Starting number: ", $key, " with sequence length: ",  $high{$key}, "\n";
    }
}
