
Created by: Christopher Le Compte

Project name: The H.S.M.S. (hair salon management system)

Description: This project manages a small hair salon by keeping track of clients and stylists, adding clients to stylists, and allowing their information to be changed and deleted.

Instructions:run bundle, run ruby app.rb, and navigate to localhost:4567.

Copyright: This project is the exclusive intellectual property of Christopher Le Compte, silver II.

Database info:

# psql
username=# CREATE DATABASE hair_salon;
username=# \c hair_salon;
hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
