proc sort data=orion.order_fact out=order_sorted;
   by Order_Type descending Order_Date;
run;

proc print data=order_sorted;
   by Order_Type;
   var Order_ID Order_Date Delivery_Date;
   where Delivery_Date - Order_Date = 2
     and Order_Date between '01jan2005'd and '30apr2005'd;
   title1 'Orion Star Sales Details';
   title2 '2-Day Deliveries from January to April 2005';
run;
