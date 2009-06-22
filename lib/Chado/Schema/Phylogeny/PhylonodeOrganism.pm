package Chado::Schema::Phylogeny::PhylonodeOrganism;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phylonode_organism");
__PACKAGE__->add_columns(
  "phylonode_organism_id",
  {
    data_type => "integer",
    default_value => "nextval('phylonode_organism_phylonode_organism_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "phylonode_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "organism_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("phylonode_organism_id");
__PACKAGE__->add_unique_constraint("phylonode_organism_phylonode_id_key", ["phylonode_id"]);
__PACKAGE__->add_unique_constraint("phylonode_organism_pkey", ["phylonode_organism_id"]);
__PACKAGE__->belongs_to(
  "phylonode_id",
  "Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "phylonode_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xX/KBnZZh794jBJrtQx2OQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
