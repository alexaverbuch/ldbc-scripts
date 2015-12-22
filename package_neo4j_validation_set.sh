#!/bin/sh
# Copy files from Neo4j DLBC connector resources directory to validation set repository, ready to be pushed to github
validation_set_dir=/Users/alexaverbuch/IdeaProjects/ldbc_snb_bi_validation/neo4j
connector_dir=/Users/alexaverbuch/IdeaProjects/ldbc-load-generator/ldbc_snb_workload_interactive_neo4j/data-import/src/test/resources/validation_sets/business_intelligence/neo4j

rm -rf neo4j--validation_set/
mkdir neo4j--validation_set/
rm -rf neo4j--validation_set/*

cp -r ${connector_dir}/* neo4j--validation_set/
cd neo4j--validation_set/
tar -czvf neo4j--validation_set.tar.gz *
cd ..
rm ${validation_set_dir}/neo4j--validation_set.tar.gz
cp neo4j--validation_set/neo4j--validation_set.tar.gz ${validation_set_dir}/

rm -rf neo4j--validation_set*