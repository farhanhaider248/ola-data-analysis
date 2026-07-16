create database ola;
use ola;

-- retrieve all successful bookings.
create view Successful_Bookings as SELECT 
    *
FROM
    ola.bookings
WHERE
    Booking_Status = 'success';

select * from Successful_Bookings;
    
-- find average ride distance for each vehicle type.

create view Ride_distance_for_each_vehicle as SELECT 
    Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM
    bookings
GROUP BY Vehicle_Type;

select * from Ride_distance_for_each_vehicle;

-- get the total number of canceled rides by customers.

CREATE VIEW Ride_canceled_by_customer AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        Booking_Status = 'Canceled by Customer';
        
select * from Ride_canceled_by_customer;


-- list the top 5 customers who booked the highest number of rides.

create view highest_booking_from_customers as select Customer_ID , count(Booking_ID) as total_rides
from bookings group by Customer_ID order by total_rides desc limit 5;

select * from highest_booking_from_customers;

-- get the number of rides canceled by drivers due to personal and car related issues.

create view ride_canceled_by_driver_personal_issue as 
select count(*) from bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from ride_canceled_by_driver_personal_issue;
-- find the maximum and minimum driver ratings for prime sedan bookings.

create view Max_min_Driver_rating as select max(Customer_Rating) as max_rating, min(Driver_ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

select * from  Max_min_Driver_rating;

-- retrieve all rides where payment was made using UPI.

create view all_payments_by_upi as select * from bookings where Payment_Method = 'UPI';
select * from all_payments_by_upi;

-- find the average customer rating per vehicle type.

create view avg_customer_rating_vehicle_type as 
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating from bookings  group by Vehicle_Type;

select * from avg_customer_rating_vehicle_type;

-- calculate the booking value of rides completed successfully.

create view value_of_completed_rides as
select sum(Booking_Value) as booking_value from bookings where Booking_Status = 'Success';

select * from value_of_completed_rides;

-- list all incomplete rides along with the reason.

create view incomplete_rides_with_reason as
select Booking_ID, incomplete_Rides_Reason from bookings where Incomplete_Rides = 'Yes';

select * from incomplete_rides_with_reason;

-- all work done end --