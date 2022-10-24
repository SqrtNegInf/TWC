#!/usr/bin/env raku

use Test;

my @Test =
    { Foo => { :SD('12-01'), :ED('20-01'),},
      Bar => { :SD('15-01'), :ED('18-01'),}, exp => 4 },
    { Foo => { :SD('02-03'), :ED('12-03'),},
      Bar => { :SD('13-03'), :ED('14-03'),}, exp => 0 },
    { Foo => { :SD('02-03'), :ED('12-03'),},
      Bar => { :SD('11-03'), :ED('15-03'),}, exp => 2 },
    { Foo => { :SD('30-03'), :ED('05-04'),},
      Bar => { :SD('28-03'), :ED('02-04'),}, exp => 4 },
;


###################### rakuize input w/ tests ##########################


constant YEAR = 2022;           # A non-leap year
my @Date-test = { in  => '30-03',
                  exp => DateTime.new(YEAR, 3, 30, 0, 0, 0)},;

class NLY-DT is DateTime {   # Not Leap Year DateTime
    method TWEAK() { die 'Is Leap' if self.is-leap-year; }
    method from-DateTime( DateTime $dt ) { NLY-DT.new( $dt.Instant) }
}

sub dd-mm-to-DateTime( Str $dd-mm  ) {
    my ($m, $d) = reverse $dd-mm.split: '-';
    for $m, $d {  .=subst: / ^ 0 /, '';  }
    DateTime.new( YEAR, $m, $d, 0, 0,0);
}

enum Person <Foo Bar>;  # indices into the list of Pairs described below

# convert 5ish hash to { in =>( :DT(DT),:DT(DT) ), exp => Int )
# DT = DateTime
multi reform-input( @t=@Test --> Array) {
    my &ddmm2dt = &dd-mm-to-DateTime;
    my @ret = do for @t -> %t {
        { in => reform-input( %t ), exp => %t<exp> }
    };
}
multi reform-input( %h --> List ) {
    my &ddmm2dt = &dd-mm-to-DateTime;
    %h<Foo><SD>.&ddmm2dt => %h<Foo><ED>.&ddmm2dt,
            %h<Bar><SD>.&ddmm2dt => %h<Bar><ED>.&ddmm2dt;
}

# t for testing
multi sub MAIN( 't' ) {
    my @reform = reform-input;

    plan 2;

    my @bi = [Z] @Test, @reform;
    subtest 'Check munging from trad 5ish input', {
        plan 1 + 17 × @Test;
        dies-ok { NLY-DT.from-DateTime( DateTime.new(2024,2,28,10,10,10))},
                'no leap years';

        for @bi -> (%o, %r) {
            lives-ok { NLY-DT.from-DateTime( %r<in>[Foo].key)},   'NLY-DT ok';
            lives-ok { NLY-DT.from-DateTime( %r<in>[Foo].value)}, 'NLY-DT ok';
            lives-ok { NLY-DT.from-DateTime( %r<in>[Bar].key)},   'NLY-DT ok';
            lives-ok { NLY-DT.from-DateTime( %r<in>[Bar].value)}, 'NLY-DT ok';

            is %r<exp>, %o<exp>, 'expectation converted';

            for %r<in>.keys -> $i {
                is %r<in>[$i].key.year, YEAR,   "key   $i year converted";
                is %r<in>[$i].value.year, YEAR, "value $i year converted";
            }
            is %r<in>[Foo].key.month,   %o<Foo><SD>.substr( 3).Int,
                'key   Foo month converted';
            is %r<in>[Foo].value.month, %o<Foo><ED>.substr( 3).Int,
                'value Foo month converted';
            is %r<in>[Bar].key.month,   %o<Bar><SD>.substr( 3).Int,
                'key   Bar month converted';
            is %r<in>[Bar].value.month, %o<Bar><ED>.substr( 3).Int,
                'value Bar month converted';

            is %r<in>[Foo].key.day,    %o<Foo><SD>.substr(0,2).Int,
                'key   Foo day converted';
            is %r<in>[Foo].value.day,  %o<Foo><ED>.substr( 0,2).Int,
                'value Foo day converted';
            is %r<in>[Bar].key.day,    %o<Bar><SD>.substr( 0,2).Int,
                'key   Bar day converted';
            is %r<in>[Bar].value.day,  %o<Bar><ED>.substr( 0,2).Int,
                'value Bar day converted';
        }
        done-testing;
    }


######################## process rakuized input & test #################


    subtest 'Test code that processes converted input', {
        plan +@Date-test + +@Test;
        for @Date-test -> %t {
            is dd-mm-to-DateTime( %t<in>), %t<exp>, 'mm-dd-to-DateTime()';
        }
        for @reform -> %t {
            is  (   (%t<in>[Foo].key.Date … %t<in>[Foo].value.Date)
                  ∩ (%t<in>[Bar].key.Date … %t<in>[Bar].value.Date)
                ).elems,
                        %t<exp>, 'overlap of duration';
        }
        done-testing;
    }
    done-testing;
}

multi sub MAIN( %in = { Foo => {:SD('30-03'), :ED('05-04')},
                        Bar => {:SD('28-03'), :ED('02-04')}}) {
    my @in = reform-input( %in);
    my $overlap =  (    (@in[Foo].key.Date … @in[Foo].value.Date)
                      ∩ (@in[Bar].key.Date … @in[Bar].value.Date)
                   ).elems;
    say "  Input: Foo => SD: '%in<Foo><SD>' ED: '%in<Foo><ED>'\n"
      ~ "         Bar => SD: '%in<Bar><SD>' ED: '%in<Bar><ED>'\n\n"
      ~ "  Output: ", n-day( $overlap);
}

sub n-day( $n where * ≥ 0--> Str) {
    given $n {
        when  0 { "0 days" }
        when  1 { "1 day" }
        default { "$n days" }
    }
}
