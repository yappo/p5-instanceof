use inc::Module::Install;
name 'instanceof';
all_from 'lib/instanceof.pm';

requires 'Scalar::Util';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
