/*******favorite*******
이름          널?       유형            
----------- -------- ------------- 
FAVORITE_NO NOT NULL NUMBER        
BOOK_NO     NOT NULL NUMBER        
USER_ID     NOT NULL VARCHAR2(100) 
*/

desc favorite;
desc book;


--insert--
insert into favorite values(SEQ_favorite_favorite_no.nextval,1,'yeji');
insert into favorite values(SEQ_favorite_favorite_no.nextval,1,'soyoon');
insert into favorite values(SEQ_favorite_favorite_no.nextval,1,'hyeonjeong');
insert into favorite values(SEQ_favorite_favorite_no.nextval,2,'junghyun');
insert into favorite values(SEQ_favorite_favorite_no.nextval,3,'woohyuk');


--select--
/*즐겨찾기목록에 이미 있는지확인*/
select count(*) from favorite where user_id='yeji' and book_no=3;
/*즐겨찾기 상세보기*/
select * from favorite f join book b on f.book_no=b.book_no where favorite_no=1;   
/*'yeji'의 즐겨찾기 목록*/
select f.favorite_no,b.isbn,b.book_title,b.book_author from favorite f join book b on f.book_no=b.book_no where user_id='yeji';

--delete--
/*즐겨찾기 일부삭제*/
delete from favorite where favorite_no=1;
/*즐겨찾기 전체삭제*/
delete from favorite where user_id='yeji';
