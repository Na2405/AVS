use AVS_Database_Final

create table Jobs (
job_ID int primary key not null identity(1,1),
job_Name nvarchar(100)
)

create table Users (
user_ID int primary key not null identity(1,1),
user_Name nvarchar(300) not null,
user_Password nvarchar(300) not null,
user_RoleNum int not null,
user_Age int,
user_Workplaces nvarchar(1000),
user_Gender int,
user_Mail nvarchar(300),
user_Phone nvarchar(20),
job_ID int not null,
FOREIGN KEY(job_ID) REFERENCES Jobs(job_ID)
)


create table Roles(
role_ID int primary key not null identity(1,1),
role_Name nvarchar(200)
)

create table UserRoles (
userRole_ID int primary key not null identity(1,1),
role_ID int not null,
user_ID int not null,
FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
FOREIGN KEY(role_ID) REFERENCES Roles(role_ID)
)

create table Category(
category_ID int primary key not null identity(1,1),
category_Name nvarchar(200)
)

create table News (
new_ID int primary key not null identity(1,1),
new_Tittles nvarchar(300),
new_Content nvarchar(MAX),
new_DateRealease datetime,
new_Resource nvarchar(300),
user_ID int not null,
FOREIGN KEY(user_ID) REFERENCES Users(user_ID)
)

create table Comments (
comment_ID int primary key not null identity(1,1),
comment_Content nvarchar(MAX),
comment_Datetime datetime,
user_ID int not null,
new_ID int not null,
FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
FOREIGN KEY(new_ID) REFERENCES News(new_ID)
)

create table Algorithm (
algo_ID int primary key not null identity(1,1),
algo_Name nvarchar(200),
algo_CodeJava nvarchar(MAX),
algo_CodeCplus nvarchar(MAX),
algo_CodeJS nvarchar(MAX),
algo_Description nvarchar(MAX),
category_ID int not null,
algo_DateTime datetime,
algo_Resource nvarchar(MAX),
FOREIGN KEY(category_ID) REFERENCES Category(category_ID)
)

create table Notifications (
noti_ID int primary key not null identity(1,1),
noti_Content nvarchar(MAX),
user_ID int not null,
FOREIGN KEY(user_ID) REFERENCES Users(user_ID)
)

create table ModifyAlgorithm (
mod_ID int primary key not null identity(1,1),
user_ID int not null,
algo_ID int not null,
modalgo_Time datetime,
FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
FOREIGN KEY(algo_ID) REFERENCES Algorithm(algo_ID)
)


create table Example (
example_ID int primary key not null identity(1,1),
example_Content nvarchar(MAX),
algo_ID int not null,
FOREIGN KEY(algo_ID) REFERENCES Algorithm(algo_ID)
)

create table ModifyNew (
modnew_ID int primary key not null identity(1,1),
user_ID int not null,
new_ID int not null,
modnew_Time datetime,
FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
FOREIGN KEY(new_ID) REFERENCES News(new_ID),
)

create table VoteComment (
user_ID int  not null,
comment_ID int  not null,
FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
FOREIGN KEY(comment_ID) REFERENCES Comments(comment_ID),
Status int
Primary Key(user_ID,comment_ID)
)


create table Settings (
web_theme int not null,
web_credit nvarchar(MAX),
web_font int not null	
)

create table History (
history_ID int primary key not null identity(1,1),
history_Description nvarchar(MAX),
user_ID int not null,
algo_ID int not null,
history_Time datetime,
FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
FOREIGN KEY(algo_ID) REFERENCES Algorithm(algo_ID)
)

create table ShortDescription (
shortDescription_ID int primary key not null identity(1,1),
algo_ID int not null,
algo_resource nvarchar(MAX),
short_Time datetime,
FOREIGN KEY(algo_ID) REFERENCES Algorithm(algo_ID)
)

insert into Jobs(job_Name)
values('Teacher')
insert into Jobs(job_Name)
values('Student')
insert into Jobs(job_Name)
values('Employee')
insert into Jobs(job_Name)
values('Manager')

insert into Users(user_Name,user_Password,user_RoleNum,user_Age,user_Workplaces,user_Gender,user_Mail,user_Phone,job_ID)
values ('anhmn','123456',1,22,'FPT Uniersity',1,'anhmn@gmail.com','0123456789',2)
insert into Users(user_Name,user_Password,user_RoleNum,user_Age,user_Workplaces,user_Gender,user_Mail,user_Phone,job_ID)
values ('duongph','123456',1,22,'FPT Uniersity',1,'duongph@gmail.com','0936219916',2)
insert into Users(user_Name,user_Password,user_RoleNum,user_Age,user_Workplaces,user_Gender,user_Mail,user_Phone,job_ID)
values ('binhnt','123456',2,22,'FPT Uniersity',1,'binhnt@gmail.com','0987654321',2)



insert into Roles(role_Name)
values('Admin')
insert into Roles(role_Name)
values('User')

insert into UserRoles(role_ID,user_ID)
values(1,1)
insert into UserRoles(role_ID,user_ID)
values(1,2)
insert into UserRoles(role_ID,user_ID)
values(2,3)

insert into Notifications(noti_Content,user_ID)
values('You have finished reading this algorithm !!','3')

insert into News(new_Tittles,new_Content,new_DateRealease,new_Resource,user_ID)
values ('Every child needs a personalised learning plan','If I had to pick between an amazing teacher and amazing technology, I’d pick the teacher every time. But we need to empower these teachers with better tools to engage in the task of serving a population of students with diverse needs. In 2020, they will have tools that allow each student to work on what is most appropriate for their needs in an environment of fast-cycle, continual improvement. This will help put education, which has had decades of little improvement in countries such as the US or UK, finally on track to accelerate student learning.','20200223 10:34:09 AM','W3School',1);

insert into ModifyNew(user_ID,new_ID,modnew_Time)
values(2,1,'20200227 07:40:00 PM');

insert into Category(category_Name)
values ('Sort Algorithm')
insert into Category(category_Name)
values ('Search Algorithm')

insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Bubble Sort','null','null','null','Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order.',2,'20200224 09:48:00 AM','null')
insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Quick Sort','null','null','null','Quicksort is a divide and conquer algorithm. It first divides a large list into two smaller sub-lists and then recursively sort the two sub-lists.',2,'20200224 09:48:00 AM','null')
insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Simple Selection Sort','null','null','null','The selection sort algorithm sorts an array by repeatedly finding the minimum element (considering ascending order) from unsorted part and putting it at the beginning.',2,'20200224 09:48:00 AM','null')
insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Heap Sort','null','null','null','Heap sort is a comparison based sorting technique based on Binary Heap data structure.',2,'20200224 09:48:00 AM','null')
insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Simple Insertion Sort','null','null','null','Insertion sort is a simple sorting algorithm that works the way we sort playing cards in our hands.',2,'20200224 09:48:00 AM','null')
insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Merge Sort','null','null','null','Like QuickSort, Merge Sort is a Divide and Conquer algorithm. It divides input array in two halves, calls itself for the two halves and then merges the two sorted halves.',2,'20200224 09:48:00 AM','null')
insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Radix Sort','null','null','null','Radix sort is an integer sorting algorithm that sorts data with integer keys by grouping the keys by individual digits that share the same significant position and value (place value).',2,'20200224 09:48:00 AM','null')

insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Linear Search','null','null','null','In computer science, a linear search or sequential search is a method for finding an element within a list.',1,'20200224 09:48:00 AM','null')
insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Binary Search','null','null','null','Binary search is an efficient algorithm for finding an item from a sorted list of items.',1,'20200224 09:48:00 AM','null')
insert into Algorithm(algo_Name,algo_CodeJava,algo_CodeCplus,algo_CodeJS,algo_Description,category_ID,algo_DateTime,algo_Resource)
values ('Interpolation Search','null','null','null','Interpolation search is an algorithm similar to Binary Search for searching for a given target value in a sorted array.',1,'20200224 09:48:00 AM','null')

insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(1,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(2,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(3,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(4,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(5,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(6,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(7,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(8,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(9,'null','20200224 10:00:00 AM')
insert into ShortDescription(algo_ID,algo_resource,short_Time)
values(10,'null','20200224 10:00:00 AM')

insert ModifyAlgorithm(user_ID,algo_ID,modalgo_Time)
values (1,1,'20200224 10:00:00 PM')

