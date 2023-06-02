#!/usr/bin/env perl
use v5.36;

# read matrix from input
my @m;
my $ncols;
while (<DATA>) {
    my @cols = split(' ', s/\D/ /gr);       # ignore all but numbers
    die "invalid matrix\n" if defined($ncols) && $ncols != scalar(@cols);
    $ncols = scalar(@cols);
    push @m, \@cols;
}

say count_squares(@m);


# count squares larger than 1
sub count_squares {
    my(@m) = @_;
    my $nrows = scalar(@m);
    return 0 if $nrows < 2;
    my $ncols = scalar(@{$m[0]});
    return 0 if $ncols < 2;

    my $count = 0;
    for my $row (0 .. $nrows-1) {
        for my $col (0 .. $ncols-1) {
            if ($m[$row][$col]) {
                for (my $d = 1; $row+$d < $nrows && $col+$d < $ncols; $d++) {
                    if ($m[$row+$d][$col] && $m[$row][$col+$d] && $m[$row+$d][$col+$d]) {
                        $count++;
                    }
                }
            }
        }
    }
    return $count;
}

__END__
0 1 0 1
0 0 1 0
1 1 0 1
1 0 0 1
