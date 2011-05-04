package Mojolicious::Plugin::ZombieApocalypse;

use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = 0.01;

sub register {
    my ($plugin, $app) = @_;

    $app->hook(
        before_dispatch => sub {
            kill 11, $$ if shift->req->url->path eq '/brains';
        }
    );
}

=head1 NAME

Mojolicious::Plugin::ZombieApocalypse - Detect Zombie apocalypse

=head1 DESCRIPTION

Detect Zombie apocalypse by examining incoming requests and respond appropriately.

=head1 USAGE

    use Mojolicious::Lite;

    plugin 'zombie_apocalypse';

    get '/brains' => sub {
        # Segfault.  Don't bother serving response, there's no time.
        # Get the hell out of here
    };

    app->start;

Segfault if /brains are requested. (Zombies are dead, so they're RESTful)

=head1 METHODS

L<Mojolicious::Plugin::ZombieApocalypse> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 C<register>

    $plugin->register;

Register condition in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>

=head1 DEVELOPMENT

L<http://github.com/tempire/mojolicious-plugin-zombieapocalypse>

=head1 VERSION

0.01

=head1 AUTHOR

Glen Hinkle tempire@cpan.org

=cut
