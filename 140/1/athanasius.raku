#!/usr/bin/env raku

###############################################################################
=begin comment

Perl Weekly Challenge 140
=========================

TASK #1
-------
*Add Binary*

Submitted by: Mohammad S Anwar

You are given two decimal-coded binary numbers, $a and $b.

Write a script to simulate the addition of the given binary numbers.

    The script should simulate something like $a + $b. (operator overloading)

Example 1

  Input: $a = 11; $b = 1;
  Output: 100

Example 2

  Input: $a = 101; $b = 1;
  Output: 110

Example 3

  Input: $a = 100; $b = 11;
  Output: 111

=end comment
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
=begin comment

Assumptions
-----------
- "Decimal-coded binary numbers" are just binary numbers
- These binary numbers are restricted to non-negative integers
- Leading zeros are allowed, but will be trimmed.

Solution
--------
The file BinUInt.rakumod contains the implementation of classes BinUInt (for
representing binary numbers) and X::BinUInt::Invalid (for error-reporting).
Binary addition is performed by sub infix:<+>, which is overloaded for BinUInt
objects. This overloaded + operator performs binary addition using the same
logic that a human would use to add two binary numbers together manually.

=end comment
#==============================================================================

# in-line .rakumod to silence gripes from 'Code-health'
#use lib < . >;
#use BinUInt;

#use v6d;

###############################################################################
=begin comment

Perl Weekly Challenge 140, TASK #1: Add Binary

=end comment
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
=begin comment

The "+" operator is overloaded for BinUInt objects. It adds two binary numbers
digit-by-digit, moving from the least significant digits to the most signifi-
cant digits. (Leading zeros are first added to the smaller of the two binary
numbers to simplify the implementation logic.)

=end comment
#==============================================================================

class X::BinUInt::Invalid { ... }                         # Forward declaration

#==============================================================================
class BinUInt
#==============================================================================
{
    has Str $.value;

    #--------------------------------------------------------------------------
    submethod BUILD( Str:D :$!value )
    #--------------------------------------------------------------------------
    {
        $!value ~~ / ^ <[01]>+ $ /
            or X::BinUInt::Invalid.new( value => $!value ).throw;

        $!value ~~ s/ ^ 0+ <?[01]> //;                     # Trim leading zeros
    }
}

#==============================================================================
multi sub infix:<+>( BinUInt:D $a, BinUInt:D $b --> BinUInt:D ) is export
#==============================================================================
{
    my UInt $lhs-len = $a.value.chars;
    my UInt $rhs-len = $b.value.chars;
    my UInt $max-len = $lhs-len >= $rhs-len ?? $lhs-len !! $rhs-len;
    my UInt $carry   = 0;
    my Str  @lhs     = $a.value.split( '', :skip-empty ).reverse;
    my Str  @rhs     = $b.value.split( '', :skip-empty ).reverse;
    my UInt @sum;

    @lhs.push: '0' while @lhs.elems < $max-len;
    @rhs.push: '0' while @rhs.elems < $max-len;

    for 0 .. $max-len - 1 -> UInt $i
    {
        my UInt $subtotal = @lhs[ $i ] + @rhs[ $i ] + $carry;

        if    $subtotal == 3
        {
            @sum[ $i ] = 1;
            $carry     = 1;
        }
        elsif $subtotal == 2
        {
            @sum[ $i ] = 0;
            $carry     = 1;
        }
        else  # 1 or 0
        {
            @sum[ $i ] = $subtotal;
            $carry     = 0;
        }
    }

    @sum.push: 1 if $carry;

    return BinUInt.new: value => @sum.reverse.join;
}

#==============================================================================
class X::BinUInt::Invalid is Exception
#==============================================================================
{
    has Str $!value;

    #--------------------------------------------------------------------------
    submethod BUILD( Str:D :$!value )
    #--------------------------------------------------------------------------
    {
    }
 
    #--------------------------------------------------------------------------
    method message( --> Str:D )
    #--------------------------------------------------------------------------
    {
        return qq["$!value" is not a valid binary number];
    }
}

##############################################################################
#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #"\nChallenge 140, Task #1: Add Binary (Raku)\n".put;
}

#==============================================================================
sub MAIN
(
    Str:D $a='11',                 #= A non-negative binary integer
    Str:D $b='1'                  #= A non-negative binary integer
)
#==============================================================================
{
    my BinUInt $a-obj = BinUInt.new: value => $a;
    my BinUInt $b-obj = BinUInt.new: value => $b;

    "Input:  \$a = %s; \$b = %s\n".printf: $a-obj.value, $b-obj.value;

    my BinUInt $sum-obj = $a-obj + $b-obj;           # Use operator overloading

    "Output: %s\n".printf: $sum-obj.value;

    CATCH
    {
        when X::BinUInt::Invalid
        {
            ('ERROR: ' ~ .message).put;
            USAGE;
        }
    }
}

#------------------------------------------------------------------------------
sub USAGE()
#------------------------------------------------------------------------------
{
    my Str $usage = $*USAGE;

    $usage ~~ s/ ($*PROGRAM-NAME) /raku $0/;

    $usage.put;
}

##############################################################################
