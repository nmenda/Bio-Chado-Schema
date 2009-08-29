package Bio::Chado::Schema::Stock::Stock;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stock");
__PACKAGE__->add_columns(
  "stock_id",
  {
    data_type => "integer",
    default_value => "nextval('stock_stock_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "organism_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_obsolete",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
);
__PACKAGE__->set_primary_key("stock_id");
__PACKAGE__->add_unique_constraint("stock_c1", ["organism_id", "uniquename", "type_id"]);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
);
__PACKAGE__->has_many(
  "stockcollection_stocks",
  "Bio::Chado::Schema::Stock::StockcollectionStock",
  { "foreign.stock_id" => "self.stock_id" },
);
__PACKAGE__->has_many(
  "stock_cvterms",
  "Bio::Chado::Schema::Stock::StockCvterm",
  { "foreign.stock_id" => "self.stock_id" },
);
__PACKAGE__->has_many(
  "stock_dbxrefs",
  "Bio::Chado::Schema::Stock::StockDbxref",
  { "foreign.stock_id" => "self.stock_id" },
);
__PACKAGE__->has_many(
  "stock_genotypes",
  "Bio::Chado::Schema::Stock::StockGenotype",
  { "foreign.stock_id" => "self.stock_id" },
);
__PACKAGE__->has_many(
  "stockprops",
  "Bio::Chado::Schema::Stock::Stockprop",
  { "foreign.stock_id" => "self.stock_id" },
);
__PACKAGE__->has_many(
  "stock_pubs",
  "Bio::Chado::Schema::Stock::StockPub",
  { "foreign.stock_id" => "self.stock_id" },
);
__PACKAGE__->has_many(
  "stock_relationship_subject_ids",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "foreign.subject_id" => "self.stock_id" },
);
__PACKAGE__->has_many(
  "stock_relationship_object_ids",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "foreign.object_id" => "self.stock_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RmbyJHAOyAgKGeA4sLN06g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
