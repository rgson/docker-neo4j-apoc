FROM neo4j:3.5

ARG APOC_URI=https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.5.0.4/apoc-3.5.0.4-all.jar

RUN mkdir -p "$NEO4J_HOME"/plugins "$NEO4J_HOME"/conf \
    && cd "$NEO4J_HOME"/plugins \
    && curl --fail --silent --show-error --location --remote-name "$APOC_URI" \
    && echo 'dbms.security.procedures.unrestricted=apoc.*' >>"$NEO4J_HOME"/conf/neo4j.conf \
    && chown -R neo4j:neo4j "$NEO4J_HOME"/plugins "$NEO4J_HOME"/conf
