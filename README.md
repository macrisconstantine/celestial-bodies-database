# celestial-bodies-database
The first required project of the Relational Database Certification from freeCodeCamp.
- This database was created entirely in bash using PostgreSQL. 
- The database is composed of the following tables: `galaxy`, `star`, `planet`, `moon`, `planet_type`.
- Using a foreign key, each star is related to its galaxy, each planet to its star, and each moon to its planet.
- The `planet_type` table contains some planet types and their descriptions--each of which is used to describe one or more of the planets in the `planets` table. 
