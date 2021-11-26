# Interpreter Formula Documentation

## Syntax

| Element                        | Syntax                                        | Example
|--------------------------------|-----------------------------------------------|------------------------------------------------------------------------------------------------
| Simulation path                | `@'simulation/path'`                          | `@'ClassEmpire/ClassSystem,Sophons'`
| Brackets                       | `()`                                          | `(A + B) / C`
| Explicit string                | `'string value'`                              | `'3.4'    'this previous number is a string value'`

## Operators

|Token   | Name                  | Syntax                                        | Example
|--------|-----------------------|-----------------------------------------------|------------------------------------------------------------------------------------------------
| `-`    | Negation              | `- param (float)`                             | `-2 = -2`  
| `*`    | Multiplication        | `param1 * param2 (float)`                     | `2 * 5 = 10`
| `/`    | Division              | `param1 / param2 (float)`                     | `2 / 4 = 0.5`
| `^`    | Power                 | `param1 ^ param2 (float)`                     | `2 ^ 4 = 16`
| `+`    | Addition              | `param1 + param2 (float or string)`           | `2 + 2 = 4      'Pre' + 'fix' = 'Prefix'`
| `-`    | Subtraction           | `param1 - param2 (float)`                     | `5 - 2 = 3`
| `%`    | Modulo                | `param1 % param2 (float)`                     | `5 % 2 = 1`
| `not`  | Logic not             | `not param (bool)`                            | `not true = false`
| `and`  | Logic and             | `param1 and param2 (bool)`                    | `true and false = false`
| `or`   | Logic or              | `param1 or param2 (bool)`                     | `true or false = true`
| `xor`  | Logic exclusive or    | `param1 xor param2 (bool)`                    | `true xor true = false`
| `gt`   | Greater than          | `param1 gt param2 (float)`                    | `2 gt 3 = false`
| `ge`   | Greater or equal than | `param1 ge param2 (float)`                    | `2 ge 2 = true`
| `lt`   | Lower than            | `param1 lt param2 (float)`                    | `2 lt 3 = true`
| `le`   | Lower or equal than   | `param1 le param2 (float)`                    | `2 le 3 = true`
| `eq`   | Equals                | `param1 eq params2 (float, bool or string)`   | `2 eq 2 = true`   or   `'toto' eq 'tata' = false`  or   `false eq false = true`
| `ne`   | Not equals            | `param1 ne params2 (float, bool or string)`   | `2 ne 2 = false`  or   `'toto' ne 'tata' = true`   or   `false ne false = false`

## Functions

|Token                                                   | Result                                                                                    
|--------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------
| `Min(arg1, arg2, ...)`                                 | Return the argument with the lower value 
| `Max(arg1, arg2, ...)`                                 | Return the argument with the higher value
| `Clamp(value, min, max)`                               | Return Min(Max(value, min), max)
| `Clamp01(value)`                                       | Return Clamp(value, 0, 1)
| `Sqrt(value)`                                          | Square root function
| `Round(value)`                                         | Returns value rounded to the nearest integer
| `Floor(value)`                                         | Returns value rounded to the lowest integer
| `Ceil(value)`                                          | Returns value rounded to the highest integer
| `Log(number, base)`                                    | Return the logarithm of number in the given base
| `Logn(number)`                                         | Return the natural logarithm of number (base e)
| `Exp(number)`                                          | Return the Exponential of number.
| `$(ContextKey)`                                        | Return the object assotiated to ContextKey in the interpreter context 
| `Registry(RegistryPath)`                               | Return the value stored in game registry at path RegistryPath
| `Format(expression, arg1, arg2, ...)`                  | Format the string expression with arguments
| `Path(Object, @Path)`                                  | Return true if the path @Path is verified from Object
| `Property(Object, [@Path], PropertyName, [Silent])`    | Return the property value located at @Path from Object (@Path argument is optionnal). This function throw an error if the property is not found unless if the optionnal argument silent is set to true. In that case the returned value is 0.
| `Descriptor(Object, [@Path], DescriptorType)`          | Return the descriptor name of type DescriptorType located at @Path from Object (@Path argument is optionnal)
| `SumProperty(Object, @Path, PropertyName)`             | Return the sum of property value located at @Path from Object.
| `MaxProperty(Object, @Path, PropertyName)`             | Return the maximum property value located at @Path from Object.
| `MinProperty(Object, @Path, PropertyName)`             | Return the minimum property value located at @Path from Object.
| `Count(Object, @Path)`                                 | Count the number of simulation object that verify the path @Path from Object
| `Count(Object, @Path, PropertyName, operator, value)`  | Count the number of simulation object that verify the path @Path and the condition (Propery operator value) from Object. For example "Count(Army, @'ClassGarrisonFleet/ClassShip', Level, gt, 4)" count the ship with a level greater than 4.


[Markdown syntax](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)