#!/usr/bin/env raku

my @lists = ([1, 0, 3, 0, 0, 5],[1, 6, 4],[0, 1, 0, 2, 0]);

for (@lists) -> @list {

                my $i = 0;

                my @left = ();

                my @right = ();

                print("Input: \@list = \(" ~ @list ~ "\) \n");

                while $i < @list.elems {

                                if @list[$i] > 0 {

                                                @left.push: @list[$i];

                                } else {

                                                @right.push: @list[$i];

                                }

                               

                                $i++;

                }

                print("Output: (",@left," ",@right,")\n\n");

}
