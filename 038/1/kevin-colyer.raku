#!/usr/bin/env raku

use Test;

is   validate(2230120), "1923-01-20", "Example given";
is   validate(1230120), "2023-01-20", "Example";
like validate(2230229), /'Day out of range'/,"not a Leap year";
like validate(2230631), /'Day out of range'/,"only 30 days in june";
like validate(2231330), /'Month out of range'/,"only 12 months";
like validate(22313301),/'Input must be only 7'/,"only 7 digits";
done-testing;

sub validate($d where *>0) {
    my $s=$d.Str;
    return "Input must be only 7 digits in length" if $d.chars!==7;
    my ($day,$month,$year,$mill) = $d.polymod(100,100,100);
    return "First digit must be either 1 or 2" if 0 > $mill > 2;
    $year+=$mill==1 ?? 2000 !! 1900 ;
    my $date;
    try     { $date = DateTime.new(year => $year, month => $month, day => $day);
        CATCH   { return .Str }
    };
    return $date.Date;
}
