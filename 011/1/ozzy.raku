#!/usr/bin/env raku

sub T_F ( Num $T_C ) {  $T_C * (212-32)/100 + 32  }
sub T_C ( Num $T_F ) { ($T_F - 32) * 100/(212-32) }

sub MAIN (
    Str $T = '-40'
)
{
    my $Tn = $T.Num;

    printf("%7.2f degrees Celcius    is equal to %7.2f degrees Fahrenheit.\n", $Tn, T_F($Tn));
    printf("%7.2f degrees Fahrenheit is equal to %7.2f degrees Celcius.\n", $Tn, T_C($Tn));
}
