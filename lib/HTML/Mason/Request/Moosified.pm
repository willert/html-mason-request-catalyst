package HTML::Mason::Request::Moosified;
# ABSTRACT: Moose-enabled HTML::Mason::Request object

use Moose;
use MooseX::NonMoose;

use namespace::autoclean;

extends 'HTML::Mason::Request';

=head1 SYNOPSIS

    package HTML::Mason::Request::Catalyst;
    use Moose;

    extends 'HTML::Mason::Request::Moosified';
    with 'MasonX::TraitFor::Request::Catalyst::Context';

    __PACKAGE__->meta->make_immutable;
    no Moose;
    1;

=head1 DESCRIPTION

B<HTML::Mason::Request::Moosified> provides a L<Moose>-enabled request
object for L<HTML::Mason>.

The class itself is a small wrapper around L<HTML::Mason::Request> and uses
L<MooseX::NonMoose> to moosify the request class.

=cut

use Carp;

sub FOREIGNBUILDARGS {
  my ( $class, %args ) = @_;

  # remove attributes from base class constructor because
  # Mason applies strict attribute checking and will bail
  # out on unknown options
  delete $args{ $_ } for grep{ $_ } map{
    $_->has_init_arg ? $_->init_arg : $_->name
  } $class->meta->get_all_attributes;

  return %args;
}

__PACKAGE__->meta->make_immutable;

1;
