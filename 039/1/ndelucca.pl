#!/usr/bin/env perl
use v5.36;

@ARGV = 'guest-book.txt';

my @gb = ();
my $guests = 0;

# We process the file line by line, and create a cleaned up hash with time and action
while(<>){
    chomp;
    my ( $i, $guest, $in, $in_time, $out, $out_time ) = split;
    my %record = ();

    push @gb, {
        time => time_to_minutes($in_time),
        action => substr($in,0,-1)
    };

    push @gb, {
        time => time_to_minutes($out_time),
        action => substr($out,0,-1)
    };

}

my $timer_start = 0;
my $timer = 0;

for ( sort { $a->{time} <=> $b->{time} } @gb ){

    if ($_->{action} eq 'IN'){
        $guests++;
        # We need to check if there was someone before
        # If so we don't care about that action
        $timer_start = $_->{time} if $guests == 1;
    }else{
        $guests--;
        # When the last person checks out, we sum up the time
        $timer += $_->{time} - $timer_start if $guests == 0;
    }

}
print "The lights where on for $timer minutes\n";

sub time_to_minutes {
    my $time = shift;
    my ($h, $m) = split /:/, $time;
    return $h * 60 + $m;
}
