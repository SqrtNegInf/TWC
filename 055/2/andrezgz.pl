#!/usr/bin/env perl
use v5.36;

my @initial = grep { /^\d+$/ } (1,2,3,4);

my %waves;#hash for unique solutions when array has non-unique numbers
populate_waves( \@initial );
for (sort keys %waves) {
    print '[', join( ',', @{ $waves{$_} } ) ,']' . $/;
}

sub populate_waves {
    my $numbers = shift;
    my $perm = shift // [];

    if (!@$numbers){
        my $key = join '-',@$perm;
        $waves{$key} = [@$perm] if is_wave($perm);
        return;
    }

    foreach (0 .. @$numbers-1) {
        my $c = splice @$numbers, $_, 1;
        push @$perm, $c;
        populate_waves($numbers, $perm);
        pop @$perm;
        splice @$numbers, $_, 0, $c;
    }
    return;
}

sub is_wave {
    my $p = shift;
    for (1 .. @$p -1) {
        if ($_ % 2 == 1) {
            return if $p->[$_] > $p->[$_-1];
        }
        else {
            return if $p->[$_] < $p->[$_-1];
        }
    }
    return 1;
}

__END__

./ch-2.pl 1 2 3 4
[2,1,4,3]
[3,1,4,2]
[3,2,4,1]
[4,1,3,2]
[4,2,3,1]

./ch-2.pl 1 3 3 4
[3,1,4,3]
[3,3,4,1]
[4,1,3,3]
[4,3,3,1]
