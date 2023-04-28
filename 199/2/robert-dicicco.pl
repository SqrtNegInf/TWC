#!/usr/bin/env perl
use v5.36;
use Algorithm::Permute;
use List::MoreUtils qw/indexes/;

my %seen = ();

my @list = (3,0,1,1,9,7);

my $x = 7;

my $y = 2;

my $z = 3;


my $anchor = 0;

my $cnt = 0;



sub TestArray {

                my ($first, $second, $third) = @_;

                my @x1 = indexes { $_ == $first } (@list);

                my @x2 = indexes { $_ == $second } (@list);

                my @x3 = indexes { $_ == $third } (@list);

                if (($x1[0] > $x2[0]) || ($x2[0] > $x3[0]) || ($x1[0] > $x3[0]) ){

                                return -1;

                }

                if (abs($first - $second) > $x) { return -1};

                if (abs($second - $third) > $y) { return -1};

                if (abs($first  - $third) > $z) { return -1};

                return 1;

}

my $sz = @list;

my $p = Algorithm::Permute->new(\@list,3);

while (my @res = $p->next) {

                my $retval = TestArray(@res);

                my $combined = "$res[0]$res[1]$res[2]";

                if ($retval == 1) {

                                if (! $seen{$combined}){

                                                $seen{$combined} = 1;

                                } else {

                                                print "$res[0], $res[1], $res[2]\n";

                                }

                }

}
