#!/usr/bin/env perl
use v5.36.0;

my @out = ();

sub GetIntervals {
                my $slice = shift;

                return -1 if (scalar @$slice < 3);

                my $x = 0;


                while ( $x < scalar @$slice ) {

                                if ( $x > 0 ) {

                                                my $interval = $slice->[$x] - $slice->[$x-1];

                                                push(@out, $interval );

                                }

                                $x++;

                }

                my $testval = $out[0];

                for my $arrint (@out) {

                                if ( $arrint != $testval ){

                                                return -1;

                                }

                }

                return 1;

}


my @lists = ([1,2,3,4],[2]);


for my $list (@lists) {

                my $cnt = 0;

                print("Input: \@array = \[@$list\]\n");

                my @slice = ();

                print("Output: ");

                while( $cnt < scalar @$list - 2) {

                                @slice = @$list[$cnt..$cnt+2];

                                if (scalar @slice == 3) {

                                                my $retval = GetIntervals(\@slice);

                                                if ($retval == 1 ) { print("[@slice] ")};

                                }

                                $cnt++;

                                @slice = ();

                }

                my $ret = GetIntervals(\@$list);

                $ret == 1 ? print("[@$list]\n") : print("()\n");

                print("\n");

}
