#!/usr/bin/env raku

use lib $?FILE.IO.parent;
use Test;
#use Test-Ord;

#unit module Test-Ord;

our @Test-Cardinal  =
     [ 0,  'Zero', ],
     [ 1,  'One', ],
     [ 9,  'Nine', ],
     [ 10,  'Ten', ],
     [ 11,  'Eleven', ],
     [ 20,  'Twenty', ],
     [ 23,  'Twenty-Three', ],
     [ 99,  'Ninety-Nine', ],
     [ 100,  'One Hundred', ],
     [ 101,  'One Hundred One', ],
     [ 113,  'One Hundred Thirteen', ],
     [ 999,  'Nine Hundred Ninety-Nine', ],
     [ 1000,  'One Thousand', ],
     [ 1001,  'One Thousand One', ],
     [ 1999,  'One Thousand Nine Hundred Ninety-Nine', ],
     [ 9000,  'Nine Thousand', ],
     [ 9900, 'Nine Thousand Nine Hundred', ],
     [ 9901, 'Nine Thousand Nine Hundred One', ],
     [ 9999,  'Nine Thousand Nine Hundred Ninety-Nine', ],
     [ 900901, 'Nine Hundred Thousand Nine Hundred One', ],
     [ 901901, 'Nine Hundred One Thousand Nine Hundred One', ],
     [ 99_000_900_000_000,   'Ninety-Nine Trillion Nine Hundred Million', ],
;

our %Test-Ordinal  =
     0 => [ "Zeroeth", " 0th", ],
     1 => [ "First", "1st", ],
     2 => [ "Second", "2nd", ],
     3 => [ "Third", "3rd", ],
     4 => [ "Fourth", "4th", ],
     5 => [ "Fifth", "5th", ],
     6 => [ "Sixth", "6th", ],
     7 => [ "Seventh", " 7th", ],
     8 => [ "Eighth", "8th", ],
     9 => [ "Ninth", " 9th", ],
    10 => [ "Tenth", " 9th", ],
    11 => [ "Eleventh", " 10th", ],
    12 => [ "Twelfth", "12th", ],
    13 => [ "Thirteenth", " 13th", ],
    14 => [ "Fourteenth", "14th", ],
    15 => [ "Fifteenth", "15th", ],
    16 => [ "Sixteenth", "16th", ],
    17 => [ "Seventeenth", " 17th", ],
    18 => [ "Eighteenth", " 18th", ],
    19 => [ "Nineteenth", "19th", ],
    20 => [ "Twentieth", "20th", ],
    21 => [ "Twenty-First", "21st", ],
    22 => [ "Twenty-Second", "22nd", ],
    23 => [ "Twenty-Third", "23rd", ],
    24 => [ "Twenty-Fourth", "24th", ],
    25 => [ "Twenty-Fifth", "25th", ],
    26 => [ "Twenty-Sixth", "26th", ],
    27 => [ "Twenty-Seventh", "27th", ],
    28 => [ "Twenty-Eighth", "28th", ],
    29 => [ "Twenty-Ninth", "29th", ],
    30 => [ "Thirtieth", "30th", ],
    31 => [ "Thirty-First", "31st", ],
    32 => [ "Thirty-Second", "32nd", ],
    33 => [ "Thirty-Third", " 33rd", ],
    36 => [ "Thirty-Sixth", "34th", ],
    40 => [ "Fortieth", "40th", ],
    50 => [ "Fiftieth", "50th", ],
    60 => [ "Sixtieth", "60th", ],
    70 => [ "Seventieth", "70th", ],
    80 => [ "Eightieth", "80th", ],
    90 => [ "Ninetieth", "90th", ],
    100 => [ "One Hundredth", "100th", ],
    1000 => [ "One Thousandth", "1000th", ],
    1000000 => [ "One Millionth", "1000000th" ],
;

our @Test-Ordinal  =
    [ 0,  'Zeroeth', ],
    [ 1,  'First', ],
    [ 9,  'Ninth', ],
    [ 10, 'Tenth', ],
    [ 11, 'Eleventh', ],
    [ 12, 'Twelfth', ],
    [ 13, 'Thirteenth', ],
    [ 14, 'Fourteenth', ],
    [ 15, 'Fifteenth', ],
    [ 16, 'Sixteenth', ],
    [ 17, 'Seventeenth', ],
    [ 18, 'Eighteenth', ],
    [ 19, 'Nineteenth', ],
    [ 20,  'Twentieth', ],
    [ 21,  'Twenty-First', ],
    [ 32,  'Thirty-Second', ],
    [ 43,  'Forty-Third', ],
    [ 44,  'Forty-Fourth', ],
    [ 97,  'Ninety-Seventh', ],
    [ 98,  'Ninety-Eighth', ],
    [ 99,  'Ninety-Ninth', ],
    [ 100,  'One Hundredth', ],
    [ 101,  'One Hundred First', ],
    [ 113,  'One Hundred Thirteenth', ],
    [ 999,  'Nine Hundred Ninety-Ninth', ],
    [ 1000,  'One Thousandth', ],
    [ 1001,  'One Thousand First', ],
    [ 1999,  'One Thousand Nine Hundred Ninety-Ninth', ],
    [ 9000,  'Nine Thousandth', ],
    [ 9900, 'Nine Thousand Nine Hundredth', ],
    [ 9901, 'Nine Thousand Nine Hundred First', ],
    [ 9990,  'Nine Thousand Nine Hundred Ninetieth', ],
    [ 99_000_900_000_000, 'Ninety-Nine Trillion Nine Hundred Millionth', ],
;

sub MAIN( @n = ( 99943201, )) {
    for @n -> $n { say "$n -> ", ordinal( $n.Int); }
}

constant @cardinal = < Zero One Two Three Four Five Six
    Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen
    Fifteen Sixteen Seventeen Eighteen Nineteen
    Twenty Twenty-One Twenty-Two Twenty-Three Twenty-Four
    Twenty-Five Twenty-Six Twenty-Seven Twenty-Eight Twenty-Nine
    Thirty Thirty-One Thirty-Two Thirty-Three Thirty-Four
    Thirty-Five Thirty-Six Thirty-Seven Thirty-Eight Thirty-Nine
    Forty Forty-One Forty-Two Forty-Three Forty-Four
    Forty-Five Forty-Six Forty-Seven Forty-Eight Forty-Nine
    Fifty Fifty-One Fifty-Two Fifty-Three Fifty-Four Fifty-Five
    Fifty-Six Fifty-Seven Fifty-Eight Fifty-Nine
    Sixty Sixty-One Sixty-Two Sixty-Three Sixty-Four Sixty-Five
    Sixty-Six Sixty-Seven Sixty-Eight Sixty-Nine
    Seventy Seventy-One Seventy-Two Seventy-Three Seventy-Four Seventy-Five
    Seventy-Six Seventy-Seven Seventy-Eight Seventy-Nine
    Eighty Eighty-One Eighty-Two Eighty-Three Eighty-Four Eighty-Five
    Eighty-Six Eighty-Seven Eighty-Eight Eighty-Nine
    Ninety Ninety-One Ninety-Two Ninety-Three Ninety-Four Ninety-Five
    Ninety-Six Ninety-Seven Ninety-Eight Ninety-Nine >;

constant TEST=True;
if TEST {
    plan @Test-Cardinal.elems + @Test-Ordinal + %Test-Ordinal.keys;

    for @Test-Cardinal -> @t { is cardinal( @t[0]), @t[1]; }
    for @Test-Ordinal -> @t { is ordinal( @t[0]), @t[1]; }
    for %Test-Ordinal.keys -> $k { is ordinal( $k), %Test-Ordinal{$k}[0]; }

    done-testing;
    exit;
}

# Create a cardinal phrase name for an pos. Int
sub cardinal( Int $n is copy where * ≥ 0 --> Str) {
    return 'Zero' if $n == 0;

    my @triad = $n.Str.flip.comb( 3).reverse;
    @triad.=map: *.flip;
    my $period = @triad.end;
    my $ret;

    while @triad {
        $ret ~= _generation( @triad.shift.Str, $period--);
    }
    return $ret.=trim-trailing;
}

# Create the ordinal phrase for 3 digits: hundreds, tens, ones, with suffix.
sub _generation( Str $digits is copy, $period) {

    constant @suffix =  ' ', ' Thousand ', ' Million ', ' Billion ',
        ' Trillion ', ' Quadrillion ', ' Quintillion ', ' Sextillion ',
        ' Septillion ', ' Octillion ';

    $digits.=subst: / ^ 0 + / ;
    return '' if $digits eq '';

    return @cardinal[ $digits] ~ @suffix[$period] if $digits < 100;
    my $h = @cardinal[ $digits.substr( 0, 1)] ~ ' Hundred';
    return $h  ~ @suffix[$period] if '00' == $digits.substr( 1, 2);
    return $h ~= " " ~ @cardinal[ $digits.substr( 1, 2)] ~ @suffix[$period];
}

# Convert a cardinal number's name-phrase to ordinal.
sub ordinal( $n --> Str) {
    my $ret = cardinal( $n.Int);

    constant  %suffix = One => 'First', Two => 'Second', ree => 'ird',
        ive => 'ifth',  ght => 'ghth', ine => 'inth',    lve => 'lfth',
        ety => 'etieth', fty => 'ftieth', hty => 'htieth', nty => 'ntieth',
        rty => 'rtieth', xty => 'xtieth',
        red => 'redth',  and => 'andth', ion => 'ionth', ero => 'eroeth';

    if %suffix{ $ret.substr($ret.chars -3)}:exists {
        $ret.substr-rw($ret.chars -3) = %suffix{$ret.substr( $ret.chars -3 )};
        return $ret;
   } 
   return $ret ~ 'th';
}
