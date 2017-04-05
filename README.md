Create new myrecipes app

Minitest

Layout of the application

Integration testing- makes sure a feature works

Model tests- unit testing: ex. making sure a user has less than 50 characters

TBD - design the app functionality based on a test-first approach
Write the test for the functionality
Build the minimum code necessary to make each test work

Re-factor the code = "code doesn't smell" - clean code, confidence

Look at some sample layouts for homepage, and come up with a homepage design

-create a mockup

Database and 1:m associations

-Relational Databases
-SQL - Structured Query Language
- ActiveRecord - abstraction layer - Ruby - translated to 	SQL

Understand database layer, Associations

1:m, m:m

Object Relational Mapper - ORM - uses ruby code to interact with database - Relational database

has_many- 1 side

belongs_to- many side

Recipe- 
	-Recipe should be valid
	-Name should be present
	-Description should be present
	-chef_id should be present**
	-maximum length for name and description

Chef-
	-chefname and email should be present
	-size restrictions on name and email
	email address should be in valid format
	email should be unique, case insensitive