proc format;
   value $country
      "CA"="Canada"
      "DK"="Denmark"
      "ES"="Spain"
      "GB"="Great Britain"
      "NL"="Netherlands"
      "SE"="Sweden"
      "US"="United States";
run;

proc sort data=orion.shoe_vendors out=vendors_by_country;
   by Supplier_Country Supplier_Name;
run;

proc print data=vendors_by_country;
   where Product_Line=21;
   by Supplier_Country Supplier_Name Supplier_ID;
   var Product_ID Product_Name;
   title1 'Orion Star Products: Children Sports';
run;
