create database p3;
use p3;
# Display the book with the most checkouts:
select b.book_id, b.title, count(bh.borrowing_id) 
as no_of_checkouts from books b
join borrowing_history bh on b.book_id=bh.book_id
group by b.book_id,b.title
order by no_of_checkouts desc
limit 1;

#Display patrons with overdue fines greater than the average:
select p.patron_id, p.patron_name, p.account_balance,
avg(bh.overdue_fine) as average_overdue_fine
from patron p
join borrowing_history bh on p.patron_id=bh.patron_id
where bh.overdue_fine>avg(bh.overdue_fine)
group by p.patron_id, p.patron_name,p.account_balance;

# List books with more than one copy available:
SELECT b.*
FROM books b
WHERE b.available_copies > 1;

#Find patrons who have checked out books by a specific author:
select p.patron_name, a.author_name
 from patron p
join borrowing_history b on p.patron_id=b.patron_id
join books bk on b.book_id=bk.book_id
join authors a on bk.author_id=a.author_id
where a.author_name='Jane Austen';
# Show the book with the highest average overdue fine:
select b.book_id,b.title, avg(bh.overdue_fine) as avg_overdue_fine
from books b
join borrowing_history bh on b.book_id=bh.book_id
group by b.book_id,b.title
order by avg_overdue_fine desc
limit 1;
# Retrieve the titles of books that are currently checked out by patrons:
select b.title
from books b
join borrowing_history bh on b.book_id=bh.book_id
where bh.return_date is null;

select * from books;
select * from borrowing_history;
select * from patron;
select * from authors;
