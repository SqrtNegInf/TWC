#!/usr/bin/env perl
use v5.36;

run() unless caller();

sub run() {

    # For the current challenge we start by getting the two input words from the
    # argument list.
    #my ( $a, $b ) = @ARGV;
    my ($a, $b) = (1234, 5678);

    # Afterwards we ensure both strings have equal lengths. We will not check
    # that both words only contain digits as it doesn't matter for the algorithm
    # wether we restrict the input to be only digits or allow arbitrary
    # characters. (Actually it doesn't even matter that they are of the same
    # length, but I will work with that restriction)
    die "Expect two input words of equal length!\n"
      unless length($a) && length($a) == ( length($b) // 0 );

    # Now we pass both words to the meat of this solution, the `fibonacci_word`
    # routine. We additionaly pass the minimum length of 51 charachters up to
    # which we will build the fibonnaci word
    my $fibonacci_word = fibonacci_word( $a, $b, 51 );

    # Finally we extract the 51st charachter (at index 50) from the build word
    # and print it out as our result.
    my $target = substr( $fibonacci_word, 50, 1 );
    say $target;

}

sub fibonacci_word ( $a, $b, $length ) {

    # The actual fibonacci_word routine cries for a recursive solution. As
    # always with a recursive solution we start with defining the exit
    # condition, which is fullfilled as soon as the $a string reaches at least
    # the requested length $length. In that case $a is the final fibonacci word
    # and we return it to the caller
    return $a if length($a) >= $length;

    # Otherwise we continue the process, by passing $b as the new $a to the
    # fibonacci_word routine and accumulating the next fibonacci word (the
    # concatenation of $a and $b) into $b
    return fibonacci_word( $b, $a . $b, $length );
}
