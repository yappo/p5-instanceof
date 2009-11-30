use strict;
use warnings;
use Test::More tests => 8;
use instanceof;

{
    package Foo;
    sub new { bless {}, shift }
}
{
    package Bar;
    our @ISA = 'Foo';
}

my $foo = Foo->new;
ok(instanceof($foo => 'Foo'), 'Foo');
ok(!instanceof($foo => 'Bar'), 'not Bar');

my $bar = Bar->new;
ok(instanceof($bar => 'Foo'), 'Foo');
ok(instanceof($bar => 'Bar'), 'Bar');

ok(!instanceof({}    => 'HASH'), 'HASH');
ok(!instanceof([]    => 'ARRAY'), 'ARRAY');
ok(!instanceof(sub{} => 'CODE'), 'CODE');
ok(!instanceof(\''   => 'SCALAR'), 'SCALAR');
