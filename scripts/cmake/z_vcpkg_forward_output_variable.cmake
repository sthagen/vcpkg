#[===[.md:
# z_vcpkg_forward_output_variable

This macro helps with forwarding values from inner function calls,
through a local function scope, into pointer out parameters.

```cmake
z_vcpkg_forward_output_variable(ptr_to_parent_var var_to_forward)
```

is equivalent to

```cmake
if(DEFINED ptr_to_parent_var)
    if(DEFINED value_var)
        set("${ptr_to_parent_var}" "${value_var}" PARENT_SCOPE)
    else()
        unset("${ptr_to_parent_var}" PARENT_SCOPE)
    endif()
endif()
```

Take note that the first argument should be a local variable that has a value of the parent variable name.
Most commonly, this local is the result of a pointer-out parameter to a function.
If the variable in the first parameter is not defined, this function does nothing,
simplifying functions with optional out parameters.
Most commonly, this should be used in cases like:

```cmake
function(my_function out_var)
    file(SHA512 "somefile.txt" local_var)
    z_vcpkg_forward_output_variable(out_var local_var)
endfunction()
```
#]===]

macro(z_vcpkg_forward_output_variable ptr_to_parent_var var_to_forward)
    if("${ARGC}" GREATER "2")
        message(FATAL_ERROR "z_vcpkg_forward_output_variable was passed extra arguments: ${ARGN}")
    endif()
    if(DEFINED "${ptr_to_parent_var}")
        if(DEFINED "${var_to_forward}")
            set("${${ptr_to_parent_var}}" "${${var_to_forward}}" PARENT_SCOPE)
        else()
            unset("${${ptr_to_parent_var}}" PARENT_SCOPE)
        endif()
    endif()
endmacro()
