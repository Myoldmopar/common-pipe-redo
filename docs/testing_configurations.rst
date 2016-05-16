**********************
Testing Configurations
**********************

The current list of test configurations are presented in the following table.  Notes:

* The common pipe type in this table is either "None", "Uncontrolled", or "Controlled".  These correspond to the EnergyPlus inputs of "None", "One-way", and "Two-way".  

* Other options here  

+--------+-------------------------------+---------------------------------+-------------------+------------------+
| Case # | Primary Pumping Configuration | Secondary Pumping Configuration | Load Distribution | Common Pipe Type |
+========+===============================+=================================+===================+==================+
| 1      | Constant Loop Pump            | No Secondary Pumping            | Uniform           | None             |
+--------+-------------------------------+---------------------------------+-------------------+------------------+ 
| 2      | Constant Loop Pump            | No Secondary Pumping            | Sequential        | None             |
+--------+-------------------------------+---------------------------------+-------------------+------------------+  
| 3      | Variable Loop Pump            | No Secondary Pumping            | Uniform           | None             |  
+--------+-------------------------------+---------------------------------+-------------------+------------------+  
| 4      | Variable Loop Pump            | No Secondary Pumping            | Sequential        | None             |  
+--------+-------------------------------+---------------------------------+-------------------+------------------+  
| 5      | Constant Branch Pumps         | No Secondary Pumping            | Uniform           | None             |  
+--------+-------------------------------+---------------------------------+-------------------+------------------+  
| 6      | Constant Branch Pumps         | No Secondary Pumping            | Sequential        | None             |  
+--------+-------------------------------+---------------------------------+-------------------+------------------+  
| 7      | Variable Branch Pumps         | No Secondary Pumping            | Uniform           | None             |  
+--------+-------------------------------+---------------------------------+-------------------+------------------+  
| 8      | Variable Branch Pumps         | No Secondary Pumping            | Sequential        | None             |  
+--------+-------------------------------+---------------------------------+-------------------+------------------+  
| 9      | Mixed Const/Var Branch Pumps  | No Secondary Pumping            | Uniform           | None             |  
+--------+-------------------------------+---------------------------------+-------------------+------------------+  
| 10     | Mixed Const/Var Branch Pumps  | No Secondary Pumping            | Sequential        | None             |  
+--------+-------------------------------+---------------------------------+-------------------+------------------+
| 11     | Constant Loop Pump            | Constant Loop Pump              | Uniform           | Uncontrolled     |
+--------+-------------------------------+---------------------------------+-------------------+------------------+
| 12     | Constant Loop Pump            | Variable Loop Pump              | Uniform           | Uncontrolled     |
+--------+-------------------------------+---------------------------------+-------------------+------------------+
| 13     | Constant Branch Pumps         | Constant Loop Pump              | Uniform           | Uncontrolled     |
+--------+-------------------------------+---------------------------------+-------------------+------------------+
| 14     | Constant Branch Pumps         | Constant Loop Pump              | Sequential        | Uncontrolled     |
+--------+-------------------------------+---------------------------------+-------------------+------------------+
| 15     | Variable Branch Pumps         | Constant Loop Pump              | Uniform           | Uncontrolled     |
+--------+-------------------------------+---------------------------------+-------------------+------------------+
| 16     | Variable Branch Pumps         | Constant Loop Pump              | Uniform           | Uncontrolled     |
+--------+-------------------------------+---------------------------------+-------------------+------------------+
| 17     | Mixed Const/Var Branch Pumps  | Constant Loop Pump              | Uniform           | Uncontrolled     |
+--------+-------------------------------+---------------------------------+-------------------+------------------+
| 18     | Mixed Const/Var Branch Pumps  | Constant Loop Pump              | Sequential        | Uncontrolled     |
+--------+-------------------------------+---------------------------------+-------------------+------------------+












