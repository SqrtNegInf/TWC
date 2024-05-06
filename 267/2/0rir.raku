#!/usr/bin/env raku

use Test;

my @Test =
    #text           char-width      expect   max-pixels-per-line
    "",             ( 10 x 25, 1),  ('',0),   100,

    "abcdefghij",   ( 10 xx 26),    (1, 100), 100,

    "abcde",        ( 10 xx 26),    (1, 50),  100,

    "abcdefghijklmnopqrstuvwxyz",
    (10,10,10,10,10,10,10,10,10,10,10,10,10,
     10,10,10,10,10,10,10,10,10,10,10,10,10),
    (3, 60),
    100,

    "bbbcccdddaaa",
    ( 4,10,10,10,10,10,10,10,10,10,10,10,10,
     10,10,10,10,10,10,10,10,10,10,10,10,10),
    (2, 4),
    100,

    "abcdefghijklmnopqrstuvwxyz",
    ( 4,100,10,10,10,10,10,10,10,10,10,10,10,
     10,10,10,10,10,10,10,10,10,10,10,10,10),
    (5, 40),
    100,

    "abcdefghijklmnopqrstuvwxyz",
    (flat 5 xx 11, 3, 7, 5 xx 9, 7,5,5,5 ),
    (2, 32),
    100,

    "abcdefghijklmnopqrstuvwxyz",
    (flat 5 xx 11, 3, 7, 5 xx 9, 7,5,5,5 ),
    (3, 32),
    50,

    "abcdefghijklmnopqrstuvwxyz",
    (flat 5 xx 11, 3, 9, 5 xx 9, 9,5,5,5 ),
    (3, 39),
    50,
;

my @Die =
    "abcdefghijklmnopqrstuvwxyz",
    (flat 101, 5 xx 25),
    (3, 60),
    100,

    "abcdefghijklmnopqrstuvwxyz",
    (flat 5 xx 11, 3, 7, 5 xx 9, 7,5,5,101 ),
    (3, 60),
    100,
;

plan @Test ÷ 4 + @Die ÷ 4;

constant @abc = 'a'..'z';
my $line-size = 100;

multi pixel-lines-w-tail-size(       '', @char-width ) { ('', 0) }
multi pixel-lines-w-tail-size( Str:D $s, @char-width -->List) {

        # create array of widths for chars
    #  my @width = do { $s.comb.List.map: { %(@abc Z=> @char-width){ $_}}};

        # create array of IntStr( width, pixels) just for error message
    my %intstr = %( @abc Z=> @char-width.map( {IntStr.new( $_, "$_")}));
    my @width = $s.comb.List.map( { %intstr{$_} });

    my $lino        = 1;            # line number accumulator
    my $cur         = 0;            # current index into @width
    my $pixels      = 0;            # pixel accumulater found in a line

    while $cur < @width {

        die "char '@width[$cur]' exceeds line width: loop $cur"
                if @width[$cur] > $line-size;

        $pixels += @width[$cur];

        given $pixels <=> $line-size {
            when Less { ++$cur; }
            when More {
                if @width[$cur] == $line-size {
                    $pixels = 0;
                } else {
                    $pixels = @width[$cur];
                    ++$cur;
                }
                ++$lino;
            }
            when Same {
                last if $cur ==  @width.end;
                ++$lino;
                $pixels = 0;
                ++$cur;
            }
        }
    }
    return ( $lino, $pixels);
}

for @Test -> $in, @width, @exp, $ls {
    $line-size = $ls;
    is pixel-lines-w-tail-size($in, @width), @exp, "@exp.raku() <- $in";
 }
for @Die -> $in, @width, @exp, $ls {
    $line-size = $ls;
    dies-ok { pixel-lines-w-tail-size($in, @width)},
            "DIES: a char wider than line";
}

done-testing;

$line-size = 100;
my $str = "abcdefghijklmnopqrstuvwxyz";
my @width = (flat 5 xx 11, 3, 7, 5 xx 9, 7,5,5,5 );

say qq{\nInput: \$str = "$str"\n       @width = @width.raku()\nOutput: },
    pixel-lines-w-tail-size($str, @width);
