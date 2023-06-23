#!/usr/bin/env perl
use v5.36;

use Math::BigFloat; 

Math::BigFloat->precision(-60);

say substr(Math::BigFloat->new('1')->bexp()->bpow(Math::BigFloat->bpi()->bmul(Math::BigFloat->new('163')->bsqrt())->bround(60)),0,52);
