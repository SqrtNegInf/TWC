#!/usr/bin/env raku

# changed input to leave just 'LERP' missing
my $given_perm = set(qw/
    PELR PREL PERL PRLE PLER PLRE EPRL EPLR ERPL
    ERLP ELPR ELRP RPEL RPLE REPL RELP RLPE RLEP
    LPER LPRE LEPR LRPE LREP /);
my $perms = set($given_perm.keys[0].comb.permutations>>.join(""));
say "Missing: ", ~($perms (-) $given_perm);
