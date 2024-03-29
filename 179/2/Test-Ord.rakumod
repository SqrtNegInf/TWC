use v6.d;
unit module Test-Ord;

our @Test-Cardinal is export =
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

our %Test-Ordinal is export =
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

our @Test-Ordinal is export =
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
