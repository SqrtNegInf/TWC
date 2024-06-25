#!/usr/bin/env perl
use v5.36;

sub BafterA {

 # 'b' in $_[0]?
 return(0) if(index($_[0], "b") == -1);
 # 'ba' at the beginning of $_[0]
 return(0) if(index($_[0], "ba") == 0);
 # 'bba'? 'aba' not allowed
 return(0) if ((index($_[0], "ba") > 0) && (substr($_[0], (index($_[0], "ba")-1), 1) ne "b"));
 1;
}

# TESTS

my $str;

# Example 1
$str = "aabb";
print(BafterA($str), "\n"); # Output: 1

# Example 2
$str = "abab";
print(BafterA($str), "\n"); # Output: 0

# Example 3
$str = "aaa";
print(BafterA($str), "\n"); # Output: 0

# Example 4
$str = "bbb";
print(BafterA($str), "\n"); # Output: 1

# Own tests

# Example 5
$str = "b";
print(BafterA($str), "\n"); # Output: 1

# Example 6
$str = "a";
print(BafterA($str), "\n"); # Output: 0

# Example 7
$str = "ba";
print(BafterA($str), "\n"); # Output: 0

# Example 8
$str = "ab";
print(BafterA($str), "\n"); # Output: 1

# Example 9
$str = "bba";
print(BafterA($str), "\n"); # Output: 1

# Example 10
$str = "aba";
print(BafterA($str), "\n"); # Output: 0

# Example 11
$str = "abba";
print(BafterA($str), "\n"); # Output: 1

# Example 12
$str = "babba";
print(BafterA($str), "\n"); # Output: 0
