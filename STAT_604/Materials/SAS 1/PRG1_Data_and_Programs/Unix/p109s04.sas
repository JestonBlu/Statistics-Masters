data work.region;
   set orion.supplier;
   length Region $ 17;
   if Country in ('CA','US') then do;
      Discount=0.10;
      DiscountType='Required';
      Region='North America';
   end;
   else do;
      Discount=0.05;
	  DiscountType='Optional';
      Region='Not North America';
   end;
   keep Supplier_Name Country 
        Discount DiscountType Region ;
run;

proc print data=work.region;
run;
