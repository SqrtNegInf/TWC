#!/usr/bin/env raku

# Example 1
my @arr1 = ("ab", "c");
my @arr2 = ("a", "bc");
check_equality(join('', @arr1), join('', @arr2));

# Example 2
@arr1 = ("ab", "c");
@arr2 = ("ac", "b");
check_equality(join('', @arr1), join('', @arr2));

# Example 3
@arr1 = ("ab", "cd", "e");
@arr2 = ("abcde");
check_equality(join('', @arr1), join('', @arr2));

sub check_equality {
    my ($arr1, $arr2) = @_;
    say($arr1 eq $arr2);
}

