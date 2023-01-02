#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;

my @lists = ([1, 0, 3, 0, 0, 5],[1, 6, 4],[0, 1, 0, 2, 0]);

for my $list (@lists) {

                my $i = 0;

                my @left = ();

                my @right = ();

                print("Input: \@list = \(@$list\) \n");

                while($i < scalar @$list){

                                if ($list->[$i] > 0){

                                                push(@left, $list->[$i]);

                                } else {

                                                push(@right, $list->[$i]);

                                }

                                $i++;

                }

                print("Output: ");

                say ("(@left @right)");

                print("\n");

}
