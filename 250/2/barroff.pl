#!/usr/bin/env perl
use v5.36;

sub alphanumeric_string_value (@alphanumstring) {
    use List::Util qw( max );
    max( map( { $_ =~ /[a-zA-Z]/ ? length($_) : $_ + 0 } @alphanumstring ) );
}

sub MAIN() {
    if (@ARGV) {

        #| Run on command line argument
        say alphanumeric_string_value(@ARGV);
    }
    else {
        #| Run test cases
        use Test::More;

        is alphanumeric_string_value(
            ( "perl", "2", "000", "python", "r4ku" ) ), 6,
          'works for ("perl", "2", "000", "python", "r4ku")';
        is alphanumeric_string_value( ( "001", "1", "000", "0001" ) ), 1,
          'works for ("001", "1", "000", "0001")';
        done_testing;
    }
}

MAIN();
