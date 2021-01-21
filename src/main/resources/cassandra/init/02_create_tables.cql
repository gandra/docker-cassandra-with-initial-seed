CREATE TABLE myspace.Book (
     id uuid,
     title text,
     PRIMARY KEY ((id), title)
) WITH CLUSTERING ORDER BY (title desc);

insert into myspace.book(id, title) values(c5b4ed75-0000-4c2e-8347-ae7a723574d3, 'Book 1');
insert into myspace.book(id, title) values(c5b4ed75-1111-4c2e-8347-ae7a723574d3, 'Book 2');
insert into myspace.book(id, title) values(c5b4ed75-2222-4c2e-8347-ae7a723574d3, 'Book 3');
