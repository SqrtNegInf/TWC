#!/usr/bin/env perl
use v5.36;

use Time::Piece;
use Time::Seconds;

sub days_together{
    my($together) = @_;
    my $days_together = 0;
    my($start, $end);
    my $foo_start = Time::Piece->strptime($together->{Foo}->{SD}, q/%d-%m/);
    my $bar_start = Time::Piece->strptime($together->{Bar}->{SD}, q/%d-%m/);
    my $foo_end = Time::Piece->strptime($together->{Foo}->{ED}, q/%d-%m/);
    my $bar_end = Time::Piece->strptime($together->{Bar}->{ED}, q/%d-%m/);
    $start = $foo_start;
    $start = $bar_start if $bar_start > $foo_start;
    $end = $foo_end;
    $end = $bar_end if $bar_end < $foo_end;
    {
        $days_together++ if $start <= $end;
        $start += ONE_DAY;
        redo if $start <= $end;
    }
    return $days_together;
}


MAIN:{
    my $days;
    $days = days_together({Foo => {SD => q/12-01/, ED => q/20-01/},
                           Bar => {SD => q/15-01/, ED => q/18-01/}});
    say $days;
    $days = days_together({Foo => {SD => q/02-03/, ED => q/12-03/},
                           Bar => {SD => q/13-03/, ED => q/14-03/}});
    say $days;
    $days = days_together({Foo => {SD => q/02-03/, ED => q/12-03/},
                           Bar => {SD => q/11-03/, ED => q/15-03/}});
    say $days;
    $days = days_together({Foo => {SD => q/30-03/, ED => q/05-04/},
                           Bar => {SD => q/28-03/, ED => q/02-04/}});
    say $days;        
}
