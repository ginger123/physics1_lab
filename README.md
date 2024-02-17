# physics1_lab
code (and perhaps results) useful for the physics1_lab in the Technion

# error analysis

The file `error_calc.m` is a matlab class that assits with error analysis and error propagation. The usage explains it much better than I can.
All errors are assumed to be non systematic (i.e. random)
## A small disclaimer
error_calc should not be used where systematic errors are involved, only where random errors occur.
Support for systematic errors is not yet implemented, though it is planned
## usage
An example is the best way to understnd the usage (and also motiviation)
```Matlab
l = 127;
l_err = 1;
h = 2.5;
h_err = 0.1;
% construct class objects
l = error_calc(l,l_err) / error_calc.accu(1000);
h = error_calc(h,h_err) / error_calc.accu(1000);

% in prompt
>> h/l

ans = 

  error_calc with properties:

    meas: 0.0197
     err: 8.0251e-04

>> h+l

ans = 

  error_calc with properties:

    meas: 0.1295
     err: 0.0010

```

Note the difference between creating values with error (just constructing `error_calc`) and creating values which are assumed to be accurate (for example, meter to milimeter conversion, multiplication by a number etc..).

## Theoretical basis
All equations are taken/derived from:  
* Taylor, J.R. (1997) An Introduction to Error Analysis: The Study of 
Uncertainties in Physical Measurements. 2nd Edition, University Science Books, Sausalito.  

Specifically, chapter 3, where formulas for error propagation of random errors are done.
# tasks and improvements for the future

* Add more capabilities to error_calc (such as sin function, getting a derivative in a point etc..)
* De-dplucating code for the various ways matlab does division and multiplication
* Add support for systematic errors, i.e. implement different structs/ different operators such that using them uses a different formula
for errors
