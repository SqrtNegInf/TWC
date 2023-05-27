#!/usr/bin/env perl
use v5.36;

#
# We will grep the words from standard input which don't change
# if they are sorted; these are the words which match the pattern
# /^a*b*c*...z*$/i. We keep track of the longest word.
#
# If course, there does not have to be a unique word. It will depend
# on the word list used to search in. For instance, three different
# word list I used give different results:
#
#    infochimps.com     /usr/share/dict/words     enable.lst
#    --------------     ---------------------     ----------
#                                     Adelops
#          aegilops
#                                     alloquy
#                                     beefily        beefily
#                                     begorry
#                                     billowy        billowy
#                                     egilops
#
# Only one of them has a unique longest word.
#

#
# We will be reading a word list from standard input, and write
# the longest word where the letters are in alphabetical order
# to standard output. In case of ties, we print the first one found.
#


my $pat = join "" => map {"$_*"} 'a' .. 'z';

my $longest = "";

while (<DATA>) {
    $longest = $_ if /^$pat$/i && length ($_) > length ($longest)
}

print $longest;

__END__
abc
bash
demi
lawn
slud
tamp
wakf
Bibio
arjun
inken
pleny
stylo
swelp
topsl
visne
wifie
ampere
bloomy
deafen
depart
dumple
feeder
gleyde
huspil
titled
waning
billow
billowy
bugloss
caloyer
choragy
confute
corning
fugally
hyphema
