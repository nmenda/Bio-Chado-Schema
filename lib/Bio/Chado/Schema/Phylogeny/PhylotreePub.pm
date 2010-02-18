package Bio::Chado::Schema::Phylogeny::PhylotreePub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Phylogeny::PhylotreePub

=head1 DESCRIPTION

Tracks citations global to the tree e.g. multiple sequence alignment supporting tree construction.

=cut

__PACKAGE__->table("phylotree_pub");

=head1 ACCESSORS

=head2 phylotree_pub_id

  data_type: integer
  default_value: nextval('phylotree_pub_phylotree_pub_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 phylotree_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "phylotree_pub_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('phylotree_pub_phylotree_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "phylotree_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "pub_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("phylotree_pub_id");
__PACKAGE__->add_unique_constraint("phylotree_pub_phylotree_id_key", ["phylotree_id", "pub_id"]);

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylotree

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylotree>

=cut

__PACKAGE__->belongs_to(
  "phylotree",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { phylotree_id => "phylotree_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TWIPUE7n9LrsExLMi9W/xQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
