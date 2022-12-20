#!/usr/bin/env raku

use Test;

sub most-freqy-even( @l where * !~~ () --> Int) {
    my %h = Bag.new( @l.grep( * %% 2));
    %h = grep { .key == %h.keys.min}, %h.=grep( { .value ~~ %h.values.max});
    return (Int) if %h ~~ {};
    %h.keys[0].Int;
}

#multi MAIN ( 'test' ) {
    my @Die = { in => (),  exp => (Int),   }, ;

    my @Test =
        { in => (1,1,2,2,6,6),      exp => 2,       },
        { in => (1,1,2,6,2),        exp => 2,       },
        { in => (1,3,5,7),          exp => (Int),   },
        { in => (6,4,4,6,1),        exp => 4,       },
        { in => (6,6,6,6,6),        exp => 6,       },
        { in => (1,2,3,4,5),        exp => 2,       },
        { in => (2,2,3,3,6,6),      exp => 2,       },
        { in => (2,4,4,6,6),        exp => 4,       },
    ;
    plan +@Test + @Die;
    for @Die  -> %t {
        dies-ok { most-freqy-even( @(%t<in>))},
                "most-freqy-even("~  (%t<exp>//"(Int)")  ~") dies.";
   }
   for @Test -> %t {
        quietly is most-freqy-even( @(%t<in>) ), %t<exp>,
            (%t<exp> // '(Int)')  ~" <- %t<in>";
    }
    done-testing;
#}

#multi MAIN() {
#    my @list = (1,2,2,2,2,2,3,6,6,6,6,6);
#    say "Input: \@list = @list.join(', ');\nOutput: ",
#            &most-freqy-even(@list) // -1;
#}
