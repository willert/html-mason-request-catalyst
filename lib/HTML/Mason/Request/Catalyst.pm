package HTML::Mason::Request::Catalyst;

use Moose;
use MooseX::NonMoose;

use namespace::autoclean;

extends 'HTML::Mason::Request';
with 'MasonX::TraitFor::Request::Catalyst::Context';

=head1 NAME

HTML::Mason::Request::Catalyst - Catalyst-aware HTML::Mason::Request object

=head1 DESCRIPTION

B<HTML::Mason::Request::Catalyst> provides a Catalyst-aware request object
for L<HTML::Mason> resp. L<HTML::Mason>-based L<Catalyst::View> classes.

=cut

sub FOREIGNBUILDARGS {
  my ( $class, %args ) = @_;

  # remove attributes from base class constructor because
  # Mason applies strict attribute checking and will bail
  # out on unknown options

  delete $args{ $_ } for map{ $_->init_arg || $_->name }
    grep{ $_->has_init_arg } $class->meta->get_all_attributes;

  return %args;
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

Sebastian Willert, C<willert@gmail.com>

=head1 COPYRIGHT

This program soley owned by its author. Redistribution is prohibited.

=cut

