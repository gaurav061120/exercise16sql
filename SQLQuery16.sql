create database Exercise16Db
use Exercise16Db
drop table student
create table Student 
(sid int primary key , 
sname  nvarchar(50) , 
semail nvarchar(50) , 
scontact nvarchar(15)
);
insert into Student(sid , sname , semail , scontact) 
values 
 (1 , 'gaurav mishra' , 'gauravmishra11@mail.com'  , '+919567895432'),
 (2  ,'abhay' , 'abhayg1@mail.com ' , '+919648903666' ),
 (3 , 'aryan' , 'aryan2@mail.com' , '+919891695644');

 create table Fee
 (fid int primary key , 
 sid int , 
 sfee decimal(10,2) ,
 smonth nvarchar(20),
 syear int , 
 foreign key (sid) references Student(sid)
 );
 Create table PayConfirmation 
 (sid int ,
 name nvarchar(50) , 
 email nvarchar(50) , 
 fee float , 
 paidondate date )
 create trigger trgFeePayConfirmation 
 on Fee
 after insert 
 as
  declare @id int 
   declare @fee float 
    declare @month int 
	declare @year int 
	 declare @email nvarchar(50) 
	 declare @name nvarchar(50)  


	 select @id =sid from inserted 
	  select @name =s.sname from inserted i join Student s on s.sid = i.sid where i.sid = @id
	  
	  select @email = s.semail from inserted i join Student s on s.sid = i.sid where i.sid = @id 
	  select @fee =sfee from inserted 
	   select @month =smonth from inserted 
	   select @year = syear from inserted 
	     insert into PayConfirmation (sid , name , email , fee , paidondate) values 
		 (@id , @name , @email , @fee , convert(date , convert(nvarchar(50) , @month ) + '/1/' + convert (nvarchar(50) ,@year )))
		 print 'pay details added ' 

		 drop trigger trgFeePayConfirmation 
		 insert into Fee values (1,1000,10 ,2022)
		 	 insert into Fee values (2,2000,1 ,2023)
			 	 insert into Fee values (3,1800,8 ,2020)
				 	 insert into Fee values (1,5000,6 ,2023)
					 select * from PayConfirmation 


		 

	 


 

