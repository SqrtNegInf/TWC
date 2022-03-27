#!/usr/bin/env raku
# 
#
#       no-not-that-word-the-other-word.raku
#
#         TASK #1 › Words Length
#         Submitted by: Mohammad S Anwar
#             You are given a string $S with 3 or more words.
# 
#             Write a script to find the length of the string except the first
#             and last words ignoring whitespace.
# 
#             Example 1:
#                 Input: $S = "The Weekly Challenge"
#                 Output: 6
#                 
#             Example 2:
#                 Input: $S = "The purpose of our lives is to be happy"
#                 Output: 23
# 
#
#       2020 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN (Str $str = "Markmið lífs okkar er að vera hamingjusöm") ;

$_ = $str;
s:g/^ \s* \S+ | \S+ \s* $ | \s+//;
say $_.chars;

