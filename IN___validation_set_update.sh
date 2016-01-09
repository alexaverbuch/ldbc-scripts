#!/bin/sh
# Copy files from Neo4j DLBC connector resources directory to validation set repository, ready to be pushed to github
validation_set_dir=/Users/alexaverbuch/IdeaProjects/ldbc_snb_interactive_validation/neo4j
connector_dir=/Users/alexaverbuch/IdeaProjects/ldbc-load-generator/ldbc_snb_workload_interactive_neo4j
connector_validation_dir=${connector_dir}/data-import/src/test/resources/validation_sets/interactive/neo4j

export JAVA_HOME="`/usr/libexec/java_home -v '1.7*'`"

rm -rf /tmp/neo4j--validation_set/
mkdir /tmp/neo4j--validation_set

cd ${connector_dir}
mvn clean package -DskipTests
mvn test -Dtest=com.ldbc.snb.neo4j.interactive.integration.IntegrationValidationTest#shouldCreatePublicValidationSet -DfailIfNoTests=false
rm ${connector_validation_dir}/validation_params.csv
mv ${connector_dir}/data-import/target/test-classes/validation_sets/interactive/neo4j/validation_params.csv ${connector_validation_dir}/
rm ${connector_validation_dir}/ldbc_driver_config--validation_parameter_creation.properties
mv ${connector_dir}/data-import/target/test-classes/validation_sets/interactive/neo4j/ldbc_driver_config--validation_parameter_creation.properties ${connector_validation_dir}/

cp -r ${connector_validation_dir}/* /tmp/neo4j--validation_set/
cd /tmp/neo4j--validation_set/
tar -czvf neo4j--validation_set.tar.gz *
rm ${validation_set_dir}/neo4j--validation_set.tar.gz
cp /tmp/neo4j--validation_set/neo4j--validation_set.tar.gz ${validation_set_dir}/

rm -rf /tmp/neo4j--validation_set

export JAVA_HOME="`/usr/libexec/java_home -v '1.8*'`"