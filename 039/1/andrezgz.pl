#!/usr/bin/env perl
use v5.36;

my %log;

open my $fh, '<', 'guest-book.txt';
while(<$fh>){
    chomp;

    # line format
    next unless (/\d+\)\s+\w+\s+IN:\s+(\d{2}:\d{2})\s+OUT:\s+(\d{2}:\d{2})/);
    my ($new_in,$new_out) = ($1,$2);

    # in-time lesser than out-time
    die "in-time $new_in is greater than out-time $new_out" if $new_in gt $new_out;

    # flag to add the new period to the log
    my $add = 1;

    # check existent periods against the new one
    foreach my $in (keys %log){
        if ($new_in lt $in && $new_out gt $log{$in}) {
            # completely contains an existent period
            $log{$new_in} = $new_out;
            delete $log{$in};
            $add = 0;
        }
        elsif ($new_in lt $in && $new_out gt $in && $new_out le $log{$in}) {
            # extends in-time for an existent period
            $log{$new_in} = $log{$in};
            delete $log{$in};
            $add = 0;
        }
        elsif ($new_in ge $in && $new_in le $log{$in} && $new_out gt $log{$in}) {
            # extends out-time for an existent period
            $log{$in} = $new_out;
            $add = 0;
        }
        elsif ($new_in ge $in && $new_out le $log{$in}) {
            # completely contained in an existent period
            $add = 0;
        }
        last unless $add;
    }
    # add the new period if none of the existent ones were modified
    # or it is completely contained in one of them
    $log{$new_in} = $new_out if $add;
}
close($fh);

my $total_min = 0;
print "Periods with lights ON:\n";
foreach my $in (sort keys %log ) {
    my ( $hour_in, $min_in ) = split /:/, $in;
    my ($hour_out, $min_out) = split /:/, $log{$in};
    my $minutes = ($hour_out - $hour_in) * 60 + $min_out - $min_in;
    printf "* %s to %s (%d minutes) \n", $in, $log{$in}, $minutes;
    $total_min += $minutes;
}
print "Light ON for $total_min minutes\n";
