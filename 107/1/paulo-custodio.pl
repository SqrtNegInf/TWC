#!/usr/bin/env perl
use v5.36;

print_self_descriptive(3);

sub print_self_descriptive {
    my($num) = @_;
    my $found = 0;
    for (my $base = 4; 1; $base++) {
        my @n = (1, (0) x ($base-1));
        while (@n == $base) {
            if (is_self_descriptive(@n)) {
                print ", " if $found > 0;
                print join '', @n;
                $found++;
                if ($found >= $num) {
                    print "\n";
                    return;
                }
            }
            increment(\@n, $base);
        }
    }
}

sub increment {
    my($n, $base) = @_;
    my $i = $#$n;
    while ($i >= 0) {
        $n->[$i]++;
        if ($n->[$i] < $base) {
            return;
        }
        else {
            $n->[$i] = 0;
            $i--;
        }
    }
    unshift @$n, 1;
}

sub is_self_descriptive {
    my(@n) = @_;
    for my $i (0..$#n) {
        my $count = scalar grep {$_==$i} @n;
        return if $n[$i] != $count;
    }
    return 1;
}
