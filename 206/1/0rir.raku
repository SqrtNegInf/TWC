#!/usr/bin/env raku

use Test;

enum Test-idx <IN EXP NIGHT>;
my @Test =
    #           IN                                       EXP    NIGHT
    [ ("00:00", "23:55", "20:00"),                       235,    5],
    [ ("00:15", "23:55", "00:35"),                       20,    20],
    [ ("00:15", "23:55", "00:36"),                       21,    20],
    [ ("00:15", "11:55", "23:15"),                       680,   60],
    [ ("00:15", "23:55", "00:35"),                        20,   20],
    [ ("01:01", "00:50", "00:57"),                         4,    4],
    [ ("10:10", "09:30", "09:00", "09:55"),               15,   15],
    [ ("12:00", "00:00"),                                720,  720],
    [ ("09:00", "17:00", "00:00"),                       480,  420],
    [ ("12:00", "12:00"),                                  0,    0],
    [ ("22:00", "01:00"),                               1260,  180],
;

sub smallest-time-span( @t, Bool :$night = False --> Int) {
    
    my $offset = $night ?? -24*60*60 !! 0;

    constant midday = 24*60*60÷2;

    return
        map( { .[1] - .[0] }, 
            @t.map({
                die "bad food \"$_\"" unless /^ \d \d ':' \d \d $/;
                my $t = .substr(0,2).Int×60×60 + .substr(3,2).Int×60;
                $t = $t > midday ?? $t + $offset !! $t;
            }).sort.rotor( 2 => -1)
      ).min.Int div 60
}
say smallest-time-span( @Test[2][0]);

plan 2 × @Test;

for @Test -> ( @in, $exp, $night) {
    is smallest-time-span( @in),        $exp,  "$exp\t<- @in[]";
    is smallest-time-span( @in, :night), $night, "$night\t<- @in[]  :night";
}
done-testing;

my @time =("00:00", "23:55", "20:00");
say "\nInput: @time = @time.raku()\nOutput: &smallest-time-span( @time)";

