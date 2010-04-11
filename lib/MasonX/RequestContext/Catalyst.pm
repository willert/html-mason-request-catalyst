package MasonX::RequestContext::Catalyst;
# ABSTRACT: Catalyst context for Mason

use Moose::Role;
use namespace::autoclean;

=head1 SYNOPSIS

    # In your Mason plugin

    package MyApp::Mason::Plugin::Log;
    use base qw(HTML::Mason::Plugin);

    sub start_component_hook {
        my ($self, $context) = @_;
        my ( $m, $comp, $args ) = @{ $context };

        my $meta = eval{ Class::MOP::class_of( $m ) } or return;
        return unless $meta->does_role(
            'MasonX::RequestContext::Catalyst
        );

        $m->catalyst_ctx->log->debug( "Rendering $comp" );
    }


=head1 DESCRIPTION

B<MasonX::RequestContext::Catalyst> is a L<Moose::Role> that provides
a standard interface to access the catalyst context from within mason
requests. However, it does not try to discover the context, the Catalyst
view itself is responsible for passing it to C<$interp->make_request>.

=attr catalyst_ctx

The Catalyst context object associated with the current request

=cut

has catalyst_ctx => (
  is       => 'ro',
  isa      => 'Catalyst',
  required => 1,
  weak_ref => 1,
);

# this seems to be needed because of a bug in MooseX::NonMoose
around FOREIGNBUILDARGS => sub{
  my ( $orig, $class, %args ) = @_;
  delete $args{catalyst_ctx};
  return $class->$orig( %args );
};

no Moose::Role;

1;

