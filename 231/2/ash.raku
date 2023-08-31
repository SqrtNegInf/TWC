#!/usr/bin/env raku

sub is-sinior($ticket) {
    ~($ticket ~~ / <alpha> (\d\d) /)[0] >= 75
}

my @tests = ('7868190130M7522', '5303914400F9211', '9273338290F4010'),
            ('1313579440F2036', '2921522980M5644');


for @tests -> @tickets {
    say +@tickets.grep({is-sinior($_)});
}
