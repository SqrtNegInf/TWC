#!/usr/bin/env perl
use 5.36.0;

sub isSubset {
    my @subset = @{$_[0]};
    my %set = map { $_ => 1 } @{$_[1]};

    return (scalar grep { exists $set{$_} } @subset) == (scalar @subset);
}

my @rows = map { [split //] } qw/ qwertyuiop asdfghjkl zxcvbnm /;
my @output;

for my $word (<Hello Alaska Dad Peace>) {
    my @letters = split //, lc $word;
    for my $row (@rows) {
        if (isSubset(\@letters, $row)) {
            push @output, $word;
            last;
        }
    }
}

say q{(}, (join q{,}, map { q{"} . $_ . q{"} } @output), q{)};
