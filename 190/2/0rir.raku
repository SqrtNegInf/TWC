#!/usr/bin/env raku

use Test;
use experimental :macros;

macro n64chr( $n2chr) { quasi { ( {{{ $n2chr }}} + 64).chr} };

macro two2one( $a, $b ) {
    quasi {   ( {{{$a}}} ~ {{{$b}}}).Int < 27
           ?? ( {{{$a}}} ~ {{{$b}}})
           !! Str                             }
}

# Return an array of decoded values, if $justify is set return an
# array contain the numeric values as shown above in the example,
# otherwise return the complete decoding.
sub decoder-str-NtoChar( Str:D $in, Bool:D :$justify = False --> Array ) {
    my @in = $in.comb;
    my @num;
    @num[0].push: @in.shift;
    for @in -> $n {
        for 0 .. @num.end -> $i {
            when not @num[$i][*-1].defined {
                @num[$i].push: $n;       # suffix it
            }
            if my $tabby = two2one( @num[$i][*-1], $n ) {
                my @a = | @num[$i], Str;
                @a[*-2] = $tabby;
                @num.push: @a;
            }
            @num[$i].push: $n;
        }
    }
    @num = sort do for @num -> @a { @a.=grep: *.defined; }

    return @num if $justify;

    my @ret = gather for @num -> @a {
        take @a.map( { n64chr( $_) } ).join;
    }

    return @ret;
}

multi MAIN ( Str $t where * = < T t>.any ) {

    my @Test =
        { in => '11'   , exp => [ < AA K >], },
        { in => '1115' , exp => [ < AAAE AAO AKE KAE KO >], },
        { in => '127'  , exp => [ < ABG LG >], },
        { in => '34567893' , exp => [ < CDEFGHIC > ] },
        { in => '111111' , exp => [<
            AAAAAA AAAAK AAAKA AAKAA AAKK AKAAA AKAK AKKA
            KAAAA  KAAK  KAKA  KKAA  KKK >], },
        { in => '1324152617' , exp => [ <
            ACBDAEBFAG ACBDAEBFQ ACBDAEZAG ACBDAEZQ
            ACBDOBFAG  ACBDOBFQ  ACBDOZAG  ACBDOZQ
            ACXAEBFAG  ACXAEBFQ  ACXAEZAG  ACXAEZQ
            ACXOBFAG   ACXOBFQ   ACXOZAG   ACXOZQ
            MBDAEBFAG  MBDAEBFQ  MBDAEZAG  MBDAEZQ
            MBDOBFAG   MBDOBFQ   MBDOZAG   MBDOZQ
            MXAEBFAG   MXAEBFQ   MXAEZAG   MXAEZQ
            MXOBFAG    MXOBFQ    MXOZAG    MXOZQ > ] },
        { in => '223162' , exp =>
            [< BBCAFB  BBCPB  BWAFB  BWPB  VCAFB  VCPB >], },
    ;

    plan +@Test;
    for @Test -> %t {
        is-deeply decoder-str-NtoChar( %t<in>), @(%t<exp>),
            "%t<in> -> @(%t<exp>)";
    }
    done-testing;
}

multi MAIN( $d = '223162' ) {
    my @answer = decoder-str-NtoChar( $d);
    my @num = decoder-str-NtoChar( $d, :justify);
    die "Wrong! @answer"
        unless @answer  ~~ [< BBCAFB BBCPB BWAFB BWPB VCAFB VCPB >];
    say "Input: \$s = $d\nOutput: @answer[].join(', ')\n\nThe decoded data:";
    for ^@answer.elems -> $i {
        printf "(%-11s) => %-7s\n",  @num[$i], @answer[$i];
    }
}
