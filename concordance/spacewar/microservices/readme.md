### microservices


The idea here is that the nodejs process should have as only concern the websockets connection, the database connections (redis at first), and the microservices connections.  All the expensive computations will be handled by microservices; when I implement these will be in Rust as a POC and learning opportunity with that language.
