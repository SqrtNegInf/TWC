#!/usr/bin/env perl
use v5.36;

my $member = '3/5'; #shift || die "Argument member is missing e.g. 5/3 \n";

my $ftree = {
    v => '1/1',
    l => {
            v => '1/2',
            l => { v => '1/3', l => { v=> '1/4' }, r => { v=> '4/3' } },
            r => { v => '3/2', l => { v=> '3/5' }, r => { v=> '5/2' } }
        },
    r => {
            v => '2/1',
            l => { v => '2/3', l => { v=> '2/5' }, r => { v=> '5/3' } },
            r => { v => '3/1', l => { v=> '3/4' }, r => { v=> '4/1' } }
        }
};

travel($ftree);

exit 0;

sub travel {
    my $node = shift;
    my $parent = shift // 'N/A';
    my $grandparent = shift // 'N/A';

    if ($member eq $node->{v}) {
        say "parent = $parent and grandparent = $grandparent";
    }
    else {
        travel($node->{l},$node->{v},$parent) if exists $node->{l};
        travel($node->{r},$node->{v},$parent) if exists $node->{r};
    }
}

__END__

./ch-2.pl 4/1
parent = 3/1 and grandparent = 2/1

$ ./ch-2.pl 2/1
parent = 1/1 and grandparent = N/A

$./ch-2.pl 1/1
parent = N/A and grandparent = N/A
