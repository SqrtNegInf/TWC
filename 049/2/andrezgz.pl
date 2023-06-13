#!/usr/bin/env perl
use v5.36;

my $c = 3;

print "Capacity = $c\n\n";

my @lru = ();
my %cache = ();

set(1, 3);
set(2, 5);
set(3, 7);
get(2);
get(1);
get(4);
set(4, 9);
get(3);


sub set {
    my ($k, $v) = @_;

    print "set($k, $v)\n\n";

    push @lru, $k;

    if (@lru > $c) {
        my $out = shift @lru;
        delete $cache{$out};
        print "Cache is full: pushed out key = $out\n";
    }
    else {
        print "Cache updated:\n";
    }

    $cache{$k} = $v;

    show(@lru);
}

sub get {
    my ($k) = @_;

    print "get($k)\t-> returns ";

    if (exists $cache{$k}) {
         print "$cache{$k}\n\nCache updated:\n";
         @lru = grep { $_ != $k } @lru;
         push @lru,$k;
    }
    else {
        print "-1\n\nCache unchanged:\n";
    }

    show(@lru);

}

sub show {
    my @lru = @_;
    print '[Least recently used] ';
    print join ',',@lru;
    print " [most recently used]\n\n";
}

__END__

./ch-2.pl 2
Capacity = 2

set(1, 3)

Cache updated:
[Least recently used] 1 [most recently used]

set(2, 5)

Cache updated:
[Least recently used] 1,2 [most recently used]

set(3, 7)

Cache is full: pushed out key = 1
[Least recently used] 2,3 [most recently used]

get(2)  -> returns 5

Cache updated:
[Least recently used] 3,2 [most recently used]

get(1)  -> returns -1

Cache unchanged:
[Least recently used] 3,2 [most recently used]

get(4)  -> returns -1

Cache unchanged:
[Least recently used] 3,2 [most recently used]

set(4, 9)

Cache is full: pushed out key = 3
[Least recently used] 2,4 [most recently used]

get(3)  -> returns -1

Cache unchanged:
[Least recently used] 2,4 [most recently used]
