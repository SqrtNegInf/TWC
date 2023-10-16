#!/usr/bin/env raku

sub multiplicative_persistence ( UInt $n --> UInt ) {
    return +( $n, { [*] .comb } …^ * ≤ 9 );
}

sub task2 ( @ns --> Seq ) {
    return @ns.sort: { .&multiplicative_persistence, +$_ };
}


my @tests =
    ( (15, 99,  1, 34), ( 1, 15, 34, 99) ),
    ( (50, 25, 33, 22), (22, 33, 50, 25) ),
;

my @extra_mp_tests =
    (  1, 15,  ),
    (  2, 99,  ),
    (  0,  1,  ),
    (  2, 34,  ),
    (  1, 50,  ),
    (  2, 25,  ),
    (  1, 33,  ),
    (  1, 22,  ),
    ( 10, 3778888999 ),
    (  5, 727326941773824 ),
    ( 11, 277777788888899 ),
    (  2, 178386658538295513713958762968116392387493785516745792296688932765391655266284942626953125 ),

    ( 2, 562318632859679855289331646522997886831855623192182784 ),
    ( 2, 12151143337464821992947167549715461336549568161559877779456 ),
    ( 2, 18435713845192486722383596795942583379932926181376 ),
    ( 2, 13724786862127444188937452487684244436928942477814457294743666688 ),
    ( 2, 4462962956566344184479896717619137627557843421379439726952448 ),
    ( 2, 12868547594791955486675932659813344351587327356238952341715971366453248 ),
    ( 2, 1866189371733893397377192583777623324574273185286979584 ),
    ( 2, 822989512934646988243341929445931886137254474711557996544 ),
    ( 2, 13495647188632316526943959516551949283964534956612386816 ),
    ( 2, 9416973845731461565833251291923823345369796391634196479122543849173417984 ),
    ( 2, 2364437774737867825525656351173976496343274729927677266157156517738971136 ),
    ( 2, 183614247464385258869985843762611554883871223899488256 ),

    # https://oeis.org/A046149
    (  4, 77 ),
    (  5, 679 ),
    (  6, 6788 ),
    (  7, 68889 ),
    (  7, 168889 ),
    (  8, 2677889 ),
    (  9, 26888999 ),
    (  9, 126888999 ),
    ( 10,         3778888999 ),
    ( 10,        13778888999 ),
    ( 10,       113778888999 ),
    ( 10,      1113778888999 ),
    ( 10,     11113778888999 ),
    ( 11,    277777788888899 ),
    ( 11,   1277777788888899 ),
    ( 11,  11277777788888899 ),
    ( 11, 111277777788888899 ),

    ( 11,                       277777788888899 ),
    ( 11,                    22227777778888899  ),
    ( 11,                 2222222777777888899   ),
    ( 11,              222222222277777788899    ),
    ( 11,           22222222222227777778899     ),
    ( 11,        2222222222222222777777899      ),
    ( 11,     222222222222222222277777799       ),
    ( 11,   2222222222222222222337777779        ),
    ( 11, 22222222222222222223333777777         ),
;

use Test; plan +@tests + 1;
for @tests -> ( @in, @expected ) {
    is-deeply task2(@in), @expected;
}

{
    my $passed = + @extra_mp_tests.grep: {
        multiplicative_persistence(.[1]) == .[0]
    }
    is $passed, +@extra_mp_tests,
          "All {+@extra_mp_tests} multiplicative_persistence tests passed";
}
