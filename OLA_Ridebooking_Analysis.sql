create table booking (

Date date,                                                               
Booking_ID varchar(60),                                                
Booking_Status varchar(60),
Customer_ID varchar(60),
Vehicle_Type varchar(60),
Pickup_Location varchar(100),
Drop_Location varchar(100),
V_TAT numeric,
C_TAT numeric,
Cancelled_Rides_by_Customer varchar(80),
Cancelled_Rides_by_Driver varchar(80),
Incomplete_Rides varchar(80),
Incomplete_Rides_Reason varchar(80),
Booking_Value numeric,
Payment_Method varchar(90),
Ride_Distance numeric,
Driver_Ratings decimal(2,1),
Customer_Rating decimal(2,1)																								

);

select * from booking;
drop table booking;

--retrive all successful bookings 

select * from booking 
where booking_status = 'Success';

-- fint the avg ride distance for each vehicle type

select vehicle_type, avg(ride_distance) as avg_distance
 from booking 
 group by vehicle_type;

--get the total no. of canceled rides by customers

select  count(*) from booking
where booking_status = 'Canceled by Customer';
--group by customer_id;


--list the top 5 customers who booked the highest no. of rides

select customer_id, count(booking_id) as top5_customers from booking 
group by customer_id
order by top5_customers desc limit 5;

--get the no. of rides canceled by drivers due to personal and car related issue

select count (*) as canceled_by_driver from booking 
where cancelled_rides_by_driver = 'Personal & Car related issues';

--fint the max & min driver rating for prime sedan bookings

select max(driver_ratings) as max_rating,
min(driver_ratings) as min_rating from booking
where vehicle_type = 'Prime Sedan';

--retrive all rides where payment was made using UPI

select * from booking 
where payment_method = 'UPI';

--find the avg customer rating per vehicle type

select vehicle_type, avg(customer_rating) as avg_customer_rating from booking
group by vehicle_type;

--calculate the total booking value of rides completed successfully

select sum(booking_value) as total_of_successfull_rides from booking
where booking_status = 'Success';

--list all incomplete rides along with the reason

select booking_id, incomplete_rides_reason from booking 
where incomplete_rides = 'Yes';

















