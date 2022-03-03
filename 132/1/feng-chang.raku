#!/usr/bin/env raku

my method dstr(Date:D $dt: --> Str:D) {
    $dt.Str.trans('-' => '/')
}

sub MAIN(Str:D $birth-date-str  = '1975/10/10') {
    my Date \birth-date = $birth-date-str.trans('/' => '-').Date;
    my UInt \age = '2022-09-22'.Date - birth-date;
    put "{ (birth-date - age).&dstr }, { ('2022-09-22'.Date + age).&dstr }";
}
