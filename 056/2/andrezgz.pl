#!/usr/bin/env perl
use v5.36;

my $sum = shift || 22;

my $tree = {
            v => 5,
            l => {
                v => 4,
                l => {
                    v => 11,
                    l => { v => 7 },
                    r => { v => 2 }
                }
            },
            r => {
                v => 8,
                l => { v=> 13 },
                r => {
                    v => 9,
                    r => { v => 1}
                }
            }
};

travel($tree);

sub travel {
    my $node = shift;
    my $path = shift // [];

    push @$path, $node->{v};

    if (1 == scalar keys %$node) {
        my $s = 0;
        $s += $_ for @$path;
        print join(' -> ',@$path).$/ if $s == $sum;
    }
    else {
        foreach my $k ('l','r'){
            next unless exists $node->{$k};
            travel($node->{$k},$path);
            pop @$path;
        }
    }

}

__END__

./ch-2.pl 22
5 -> 4 -> 11 -> 2

./ch-2.pl 26
5 -> 8 -> 13
