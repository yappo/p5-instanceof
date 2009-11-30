package instanceof;
use strict;
use warnings;
use base 'Exporter';
our $VERSION = '0.01';
our @EXPORT = 'instanceof';

use Scalar::Util 'blessed';

sub instanceof {
    my($obj, $class) = @_;
    return unless blessed $obj;
    return unless $obj->isa($class);
    return 1;
}

1;
__END__

=encoding utf8

=head1 NAME

instanceof -

=head1 SYNOPSIS

  use instanceof;

  { package Foo; sub { bless {} shift } }
  { package Bar; our @ISA = 'Foo' }

  my $x = Foo->new;
  if (instanceof $x => 'Foo') {
      print "OK";
  }
  unless (instanceof $x => 'Bar') {
      print "NG";
  }

  my $x = Bar->new;
  if (instanceof $x => 'Foo') {
      print "OK";
  }
  unless (instanceof $x => 'Bar') {
      print "OK";
  }

=head1 DESCRIPTION

instanceof is

=head1 AUTHOR

Kazuhiro Osawa E<lt>yappo <at> shibuya <döt> plE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
