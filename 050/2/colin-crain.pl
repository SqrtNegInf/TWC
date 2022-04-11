#!/usr/bin/env perl
#
#       ch-2.pl
#
#       PWC 50 - TASK #2
#         Noble Integer
#             You are given a list, @L, of three or more random integers between 1
#             and 50. A Noble Integer is an integer N in @L, such that there are
#             exactly N integers greater than N in @L. Output any Noble Integer
#             found in @L, or an empty list if none were found.
#
#             An interesting question is whether or not there can be multiple
#             Noble Integers in a list.
#
#             For example,
#
#             Suppose we have list of 4 integers [2, 6, 1, 3].
#
#             Here we have 2 in the above list, known as Noble Integer, since
#             there are exactly 2 integers in the list i.e.3 and 6, which are
#             greater than 2.
#
#             Therefore the script would print 2.
#
#         analysis:
#             "Listen -- strange women lying in ponds distributing swords is no
#             basis for a system of government."
#
#             First off, just to get it out of the way, we can address the open
#             question: whether or not there can be multiple Noble Integers in a
#             list. To do this we first need to decide the unspecified criteria
#             of whether or not to allow multiple instances of any integer in
#             the random list, and if we do, whether we count these instances as
#             different candidates. If we accept both of these then trivially
#             duplicating any element that satifies the criteria will produce
#             another Noble Integer. Aside from this somewhat pathological case,
#             it turns out that duplication does not otherwise affect the
#             outcome. Elements of the list are only evaluated as to whether
#             they are greater than a given item or not; their precise value is
#             irrelevant beyond this scope. Whether or not they are the same as
#             another element makes no difference.
#
#             As it seems a stretch to consider different instances of the
#             number 2 under evaluation for Nobility as different integers, we
#             will not, and move on. The given term 'random' in the challenge
#             put forward implies freedom from constraints, to be any value; we
#             will not impose such a constraint here.
#
#             def: Given a list of integers (l, m, n, a, b, c...), the integer
#               n is a Noble Integer if and only if the quantity of elements in
#               the list greater than n is equal to n.
#
#             so:
#                 given the two elements {m, n} : m ≠ n,
#                     these can be arbitrarily reordered such that n > m
#                 m ∈ ℤ'    --> |{n, p, q, s...}| : (n,p,q,s,... > m)      = m
#
#              1. ∀ n > m ,
#                 n ≯ n     --> |{   p, q, s...}| : (  p,q,s,... > n)      < m < n
#                 ∴   n ∉ ℤ'
#
#              2. ∀ l < m ,
#                 m > l     --> |{m, n, p, q, s...}| : (m,n,p,q,s,... > n) > m > l
#                 ∴   l ∉ ℤ'
#
#             the contradiction is that n is contained within the set of
#             elements > m, yet not contained within the set of elements greater
#             than itself. Therefore the set of elements greater than n is
#             always smaller than the set of elements greater than m. Yet n > m,
#             and the number of elements greater than n must be larger than m
#             for n to be Noble. So if m is Noble, no number n > m can also
#             satisfy the criterium that the number of list elements greater
#             than the number is equal to that number. Similarly, for any l < m,
#             the number of list elements greater than l will contain m, and as
#             such be greater than the list for m (which will not contain
#             itself), and therefore be greater than l. So for any Noble Integer
#             m, no number n greater than m can be Noble, and no number l less
#             than m can be Noble.
#
#             Thus, for any set that contains a Noble Integer, in the words
#             of the Highlander, "There can be only one." All Hail our Monarch
#             King Int, most Regal, Finite in Quantity yet Infinite in Wisdom,
#             Singular and Omnipotent Ruler of his Domain!
#
#             It is not exactly clear _why_ satisfying the given criteria allows
#             the Noble Integer to reign alone, but all in all this is not
#             uncommon throughout history, which is riddled with obtuse
#             justifcations and backformation rationalizations by rulers. If
#             looking for a reason, it may be best to consider the words:
#             "That's why I'm up on the truck and you're down there digging the
#             ditch." Such is life.
#
#         method:
#             Because it is known there can be only 1 or 0 Noble integers, we
#             can create a new list using grep, comparing the topic to the
#             length of a list of items greater than the topic, using grep
#             again. The result list if populated will only have one element.
#             This can be done in one line:
#
#         my ($noble) = grep { my $ele = $_; scalar( grep { $ele < $_ } @list ) == $ele } @list;
#
#             but with a separate validate() subroutine the nested greps are
#             easier to follow.
#
#             We will also decide "integers between 1 and 50" to mean 1..50
#             inclusive. It is not specified how long the list is, so we will
#             pick a random length less than 100 elements, or twice the top
#             bound.
#
#       2020 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



use warnings;
use strict;
use feature ":5.26";

## ## ## ## ## MAIN

## prepare a random list
my @list = (19,11,9,7,20,3,17,16,2,14,1);

## there is only one Noble Integer if present, so the list of solutions will
## have at maximum one element
my ($noble) = grep { validate($_, @list) } @list;

## output
say scalar @list, " elements generated";
say join ', ', @list;
say $noble ? "the number $noble is the Noble Integer"
           : "there is no Noble Integer for this list";


## ## ## ## ## SUBS

sub validate {
## given a scalar and a list, returns true if the number of list elements greater than the
## scalar is equal to the scalar
    my ($candidate, @list) = @_;
    return scalar( grep { $candidate < $_ } @list ) == $candidate ? 1 : 0;
}

sub make_list {
## makes a list of between three to 100 random integers between 1 and 50 inclusive

    my @list;
    my $elems = int (rand(98)) + 3;
    for (1..$elems) {
        push @list, int rand(50) + 1;
    }

    return @list;
}
