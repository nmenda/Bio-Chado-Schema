package Bio::Chado::Schema::NaturalDiversity::NdExperiment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperiment

=cut

__PACKAGE__->table("nd_experiment");

=head1 ACCESSORS

=head2 nd_experiment_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_experiment_nd_experiment_id_seq'

=head2 nd_geolocation_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "nd_experiment_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_experiment_nd_experiment_id_seq",
  },
  "nd_geolocation_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_experiment_id");

=head1 RELATIONS

=head2 nd_geolocation

Type: belongs_to

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdGeolocation>

=cut

__PACKAGE__->belongs_to(
  "nd_geolocation",
  "Bio::Chado::Schema::NaturalDiversity::NdGeolocation",
  { nd_geolocation_id => "nd_geolocation_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 nd_experiment_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentContact>

=cut

__PACKAGE__->has_many(
  "nd_experiment_contacts",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentContact",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentDbxref>

=cut

__PACKAGE__->has_many(
  "nd_experiment_dbxrefs",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentDbxref",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_genotype

Type: might_have

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype>

=cut

__PACKAGE__->might_have(
  "nd_experiment_genotype",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_phenotype

Type: might_have

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype>

=cut

__PACKAGE__->might_have(
  "nd_experiment_phenotype",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_projects

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentProject>

=cut

__PACKAGE__->has_many(
  "nd_experiment_projects",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentProject",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experimentprops

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentprop>

=cut

__PACKAGE__->has_many(
  "nd_experimentprops",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentprop",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_protocols

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentProtocol>

=cut

__PACKAGE__->has_many(
  "nd_experiment_protocols",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentProtocol",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentPub>

=cut

__PACKAGE__->has_many(
  "nd_experiment_pubs",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentPub",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentStock>

=cut

__PACKAGE__->has_many(
  "nd_experiment_stocks",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentStock",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:H4F2iw3eRmVfBOU+Ncb3Ew


=head2 create_nd_experimentprops
    
  Usage: $set->create_nd_experimentprops({ baz => 2, foo => 'bar' });
  Desc : convenience method to create experiment properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given experimentprop name.  Default false.

            cv_name => cv.name to use for the given experimentprops.
                       Defaults to 'stock_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms

             rank => force numeric rank. Be careful not to pass ranks that already exist
                     for the property type. The function will die in such case.

             allow_duplicate_values => default false.
                If true, allow duplicate instances of the same experiment
                and types in the properties of the experiment.  Duplicate
                types will have different ranks.
          }
  Ret  : hashref of { propname => new experimentprop object }

=cut

sub create_nd_experimentprops {
    my ($self, $props, $opts) = @_;

    # process opts
    $opts->{cv_name} = 'nd_experiment_property'
        unless defined $opts->{cv_name};
    return Bio::Chado::Schema::Util->create_properties
        ( properties => $props,
          options    => $opts,
          row        => $self,
          prop_relation_name => 'nd_experimentprops',
        );
}

1;
