#!/usr/bin/env perl
use v5.36;

#<<<
sub reverse_integer($N) {
    my $M = reverse abs $N, '-'x($N<0);
    $M*(-2**31<=$M<2**31);
}
#>>>

my $int = qr/-?\d+/;

    say reverse_integer( -1700    );

# Tests.
while ($_ = <DATA>) {
    if (/^($int)\s+($int)$/) {
        my $actual = reverse_integer($1);
        $2 eq $actual || die "Error for $1. Expected $2, got $actual.";
    }
}

__END__
1234 4321
-1234 -4321
1231230512 0
