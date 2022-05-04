#!/usr/bin/env raku

subset K of Real:D where * >= 0;
subset C of Str:D where * ~~ /'-'? \d */; 
subset R of Int:D where * > 0;
subset F of C;

#`{{
multi sub MAIN (
    K $kelvin #= Kelvin Value
) {
    convert($kelvin);
}
multi sub MAIN ( 
    K :$kelvin #= Kelvin Value
) {
    convert ($kelvin);
}
multi sub MAIN ( 
    C :$celsius  #= Celsius Value
) {
    convert($celsius + 273.15);
}
multi sub MAIN (
    R :$rankine #= Rankine value
) {
    convert($rankine / 1.8);
}
multi sub MAIN (
    F :$fahrenheit #= Fahrenheit value
) {
    convert(($fahrenheit + 459.67) / 1.8);
}
}}

my $f = -40;
convert(($f + 459.67) / 1.8);

sub convert ( K $kelvin is copy ) {
    say "  { $kelvin }K";
    say "  { $kelvin- 273.15 }C";
    say "  { $kelvin * 1.8 - 459.67 }F";
    say "  { $kelvin* 1.8 }R";
}
