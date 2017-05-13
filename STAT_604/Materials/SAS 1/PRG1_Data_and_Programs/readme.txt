 Copyright (c) 2009 SAS Institute Inc.                                       
 Cary, N.C. USA 27513-8000                                                    
 All Rights Reserved                                                          
                                                                              
 THE INFORMATION CONTAINED IN THIS DISTRIBUTION IS PROVIDED BY THE INSTITUTE  
 "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING 
 BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
 A PARTICULAR PURPOSE.  RECIPIENTS ACKNOWLEDGE AND AGREE THAT THE INSTITUTE   
 SHALL NOT BE LIABLE WHATSOEVER FOR ANY DAMAGES ARISING OUT OF THEIR USE OF   
 THIS INFORMATION.                                                            
                                                                              
 =============================================================================
                                                                              
 Instructions for SAS training class with course code PRG1              
                                                                        
 For each student, copy all of the data into a space that allows for    
 READ/WRITE access.                                                     
                                                                        
 **For more information about the course data, contact your SAS Instructor.**   
                                                                                
 =============================================================================  
                                                                                
 Windows Operating Environments                                                 
                                                                                
   Copy the data as is from the main folder.                                    
                                                                                
   Ignore all subfolders.                                                       
                                                                                
                                                                                
 UNIX Operating Environments                                                    
                                                                                
   Transfer the prg1.stc file from the main folder in BINARY format.        
       [See further details below for importing this transport file.]       
                                                                            
   Transfer .dat, .csv, and .css files from the main folder in TEXT format.        
                                                                            
   Transfer .sas files from the Unix subfolder in TEXT format.              
                                                                            
   Ignore all other files and subfolders.                                   
                                                                            
                                                                            
 z/OS Systems                                                               
                                                                            
   Transfer the prg1.stc file from the main folder in BINARY format.    
       [See further details below for importing this transport file.]   
                                                                        
   Transfer files from the zOS/rawdata subfolder in TEXT format        
   into a single PDS such as prefix.WORKSHOP.RAWDATA                  
       [Possible Settings: DSORG=PO, RECFM=FB, LRECL=117, BLKSIZE=27963]   

   Transfer files from the zOS/report subfolder in TEXT format        
   into a single PDS such as prefix.WORKSHOP.REPORT                  
       [Possible Settings: DSORG=PO, RECFM=VB, LRECL=8196, BLKSIZE=27998]      
                                                                  
   Transfer files from the zOS/sascode subfolder in TEXT format  
   into a single PDS such as prefix.WORKSHOP.SASCODE            
       [Recommended Settings: DSORG=PO, RECFM=FB, LRECL=80, BLKSIZE=8000]     
                                                                                                                                
   Ignore all other files and subfolders.                                       
                                                                                
 =============================================================================  
                                                                                
                       Importing .STC transport files                           
                       ==============================                           
 The SAS data libraries were ported using the SAS procedure CPORT into a file   
 with the extension of STC.  These files must be transferred in BINARY format.  
                                                                                
 Once on your system, use the appropriate operating system utility to check     
 the record length.                                                             
                                                                                
     z/OS TSO  SPF 3.2        Organization: PS                        
                              Record format: FS                                 
                              Record length: 6144                                 
                              Block size: 6144                                  
                                                                                
 Run the SAS procedure CIMPORT against the transport file.                      
                                                                                
     Example:       LIBNAME OUT 'prefix.WORKSHOP.SASDATA';                    
                    FILENAME IN 'prg1.stc';                           
                    PROC CIMPORT LIBRARY=OUT INFILE=IN;               
                    RUN;                                              
                                                                      
 For more information, see SAS Technical Support - Knowledge Base  
      http://support.sas.com/kb/22/688.html                          
                                                                                
 =============================================================================  
                                                                                
