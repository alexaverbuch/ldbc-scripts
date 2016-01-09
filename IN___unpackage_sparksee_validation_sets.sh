#!/bin/sh
validation_set_dir=/Users/alexaverbuch/IdeaProjects/ldbc_snb_interactive_validation/sparksee
connector_dir=/Users/alexaverbuch/IdeaProjects/ldbc-load-generator/ldbc_snb_workload_interactive_neo4j/data-import/src/test/resources/validation_sets/interactive/sparksee

rm -rf ${connector_dir}/* 

mkdir ${connector_dir}/merge/
mkdir ${connector_dir}/merge/social_network/
mkdir ${connector_dir}/social_network/
mkdir ${connector_dir}/substitution_parameters/

cd ${validation_set_dir}/
tar -xzvf readwrite_sparksee--validation_set.tar.gz

mv validation_set/validation_params.csv ${connector_dir}/
mv validation_set/query_*.txt ${connector_dir}/substitution_parameters/
mv validation_set/merge/*.csv ${connector_dir}/merge/social_network/
mv validation_set/*.csv ${connector_dir}/social_network/

rm -rf validation_set