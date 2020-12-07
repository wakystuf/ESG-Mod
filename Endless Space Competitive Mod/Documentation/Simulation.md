# Simulation Documentation

##    Simulation descriptor

The name of the descriptor must be unique and must follow the rule: Name = Type + Unique identifier.
In the descriptor content define the simulation properties, then simulation modifiers. Properties have to be defined before the first modifier.

Example:
```xml
<SimulationDescriptor Name="ClassCity" Type="Class">
    <Property Name="BaseFood" />
    <Property Name="Food" />
    <Property Name="Population" BaseValue="1" />

    <BinaryModifier TargetProperty="Food" Operation="Addition" Left="$(Population)" Operation="Multiplication" Right="$(BaseFood)" />
</SimulationDescriptor>
```

## Simulation property

| Attribute name     | Default value     | Description
|--------------------|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------
| Name               | `<Required>`      | The name of the property. It must be unique.
| BaseValue          | `0`               | The start value of the property (before the computing of modifiers)
| MinValue           | `0`               | Minimum value of the property. Set it to "Negative" to set it to float.MinValue.
| MaxValue           | `float.MaxValue`  | Maximum value of the property.
| Composition        | `None`            | Define if the property must be computed from the simulation object children property values (by name). Available composition methods: Maximum, Minimum, Sum. 
| RoundingFunction   | `None`            | Define the rounding method of the property. Available rounding methods: Ceil, Floor, Round.
| IsSealed           | `false`           | If a property is sealed, its value can't be modified by any modifier (generaly its value is set by code).
| IsSerializable     | `false`           | Define if a property value must be serialized in game saves (generaly used for sealed property).

Example:
```xml
<Property Name="Money" Value="0" Composition="Sum" MinValue="Negative"/>
```

## Simulation modifiers - Simple modifier

| Attribute name      | Default value     | Description
|---------------------|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------
| TargetProperty      | `<Required>`      | The name of the property which will receives the result.
| Operation           | `<Required>`      | The modifier's operation. Available operations: Force, Addition, Subtraction, Multiplication, Division, Power, Percent.
| Value               | `<Required>`      | The value needed to compute the operation. (It can be a float value or another property value using $(PropertyName) syntax)
| Path                | `""`              | Dertermine where to find the target property (By default the source object).
| Priority            | `0`               | The computation priority value of the modifier (used to change the default operation order).
| SearchValueFromPath | `false`           | If the value attribute reference a property, it will be retrieved from the same path as the target property.

Example:
```xml
<!-- Money += NetDust -->
<Modifier TargetProperty="Money" Operation="Addition" Value="$(NetDust)"/>
```

## Simulation modifiers - Binary modifier

| Attribute name      | Default value     | Description
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| TargetProperty      | `<Required>`      | The name of the property which will receives the result.
| Operation           | `<Required>`      | The modifier's operation. Available operations: Force, Addition, Subtraction, Multiplication, Division, Power, Percent.
| Left                | `<Required>`      | The left value of the binary operation. (It can be a float value or another property value using $(PropertyName) syntax)
| BinaryOperation     | `<Required>`      | The operation to apply with left and right values. Available operations: Force, Addition, Subtraction, Multiplication, Division, Power, Percent.
| Right               | `<Required>`      | The right value of the binary operation. (It can be a float value or another property value using $(PropertyName) syntax)
| Path                | `""`              | Dertermine where to find the target property (By default the source object).
| Priority            | `0`               | The computation priority value of the modifier (used to change the default operation order).
| SearchValueFromPath | `false`           | If the left and/or right attribute reference a property, it will be retrieved from the same path as the target property.

Example:
```xml
<!-- Money += Population * NetDust -->
<BinaryModifier TargetProperty="Money" Operation="Addition" Left="$(Population)" BinaryOperation="Multiplication" Right="$(NetDust)" />
```

## Simulation modifiers - Count modifier

**WARNING! Cost a lot of resources to be computed**

| Attribute name      | Default value     | Description
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| TargetProperty      | `<Required>`      | The name of the property which will receives the result.
| Operation           | `<Required>`      | The modifier's operation. Available operations: Force, Addition, Subtraction, Multiplication, Division, Power, Percent.
| Multiplier          | `1`               | An optional multiplier of the count value. (It can be a float value or another property value using $(PropertyName) syntax)
| CountPath           | `<Required>`      | The path who describe the type/location of objects you want to count (this path start to the target object, be aware of that when you change the Path attribute).
| Path                | `""`              | Dertermine where to find the target property (By default the source object).
| Priority            | `0`               | The computation priority value of the modifier (used to change the default operation order).
| SearchValueFromPath | `false`           | If the multiplier attribute reference a property, it will be retrieved from the same path as the target property.

Example:
```xml
<!-- Money += 2 * CityCount-->
<CountModifier TargetProperty="Money" Operation="Addition" Multiplier= "2" CountPath="ClassEmpire/ClassCity" />
```

## Operations precedence

1. Value = Base value
2. Value += Composition
3. For each priority from min to max priority value
   1. Value += Addition/Subtraction
   2. Value *= Multiplication/Division
   3. Value ^= Power
   4. FinalValue += Percent * Value
   5. FinalValue = Force

[Markdown syntax](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)