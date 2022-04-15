#!/usr/bin/env raku

use Test;
#use Math::SelfDescriptiveNumbers;


multi sub is-self-descriptive( Int $number, Int $base )  {
    is-self-descriptive( :$number, :$base );
}

multi sub is-self-descriptive( Int :$number, Int :$base )  {
    $number.base( $base ) ∈ self-descriptive-numbers-of( $base );
}

multi sub is-self-descriptive( Str $number, Int $base )  {
    is-self-descriptive( :$number, :$base );
}

multi sub is-self-descriptive( Str :$number, Int :$base )  {
    $number ∈ self-descriptive-numbers-of( $base );
}

sub self-descriptive-numbers  {
    ( 1 .. 36 ).map( -> $base { ( $base, self-descriptive-numbers-of( $base ) ) });
}

sub self-descriptive-numbers-dec  {
    ( 1 .. 36 ).map( -> $base { ( $base, self-descriptive-numbers-of( $base ).map({ parse-base($_, $base ) }) ) });
}

multi sub self-descriptive-numbers-of( Int $base where $_ ~~ 1|2|3|6 )  { () }
multi sub self-descriptive-numbers-of( Int $base where $_ == 4 )  { ('1210', '2020') }
multi sub self-descriptive-numbers-of( Int $base where $_ == 5 )  { ('21200') }
multi sub self-descriptive-numbers-of( Int $base )  { 
    ( ($base - 4).base( $base ) ~  "21" ~ ( '0' x ($base - 7) ) ~ '1000' )
}

#multi sub MAIN()
#{
#    for self-descriptive-numbers() -> ($base, $numbers)
#    {
#        say output( $base, $numbers );
#    }
#}

#multi sub MAIN( Int $base where 1 < $base < 37 )
#{
#    say output( $base, self-descriptive-numbers-of( $base ) );
#}

#multi sub MAIN( ) 
#{
    # test values from Wikipedia
    ok is-self-descriptive( :number(parse-base('21200',5)), :base(5) );
    ok is-self-descriptive( :number('21200'), :base(5) );
    ok is-self-descriptive( 'C210000000001000', 16 );
    ok is-self-descriptive( 0xC210000000001000, 16 );
    ok !is-self-descriptive( 3210001000, 10 );
#}

sub output( $base, $numbers )
{
    my $num-base = $numbers.join(',');
    my $num-dec  = $numbers.map({ parse-base( $_, $base ) }).join(',');

    "Base $base, " ~ ( $numbers.elems ?? "$num-base; $num-dec (decimal)" !! '---' );
}
