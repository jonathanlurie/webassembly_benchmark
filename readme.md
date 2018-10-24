[WIP]  

This is about testing Webassembly using Emscripten and `.wasm` binary file. There was mainly two points:
1. See how we can call low level code that requires arrays as argument or return arrays (typed arrays in JS, int* or float* in C)
2. Compare performance between vanilla JS and Webassembly compiled from C code.


Compile the C code:  
```bash
em++ array.cpp -o array.js -Oz -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -g
```
This generates a several files, including `array.wasm` and `array.js` which is an interface to the *wasm* file, providing all the necessary to manage the calls and memory allocation.

# What's on the C code?
`array.cpp` is more of a simple C++ source that is entirely in the scope of `extern "C"` to make sure Webassembly can get the function names exactly how they are declared and avoid C++ name mangling.  
The code has the global variables `isArrayAllocated`, `arr` and `arrSize` to test if we can allocate memory to `arr` and then call some function  to use this allocated memory. The functions to do that are:
- `allocateArray` to specify the size of the array, and allocate the memory
- `freeArray` to free the memory used by the array
- `getArraySum` will compute the sum of every element of the allocated array `arr` and return the value
- `setArrayValue` and `getArrayValue` to update and read a value at a given position in the array

The other functions of `array.cpp` are not using any of the global variables and can be considered independents (they should probably have ended in another cpp file...).
- `sum` takes an array in argument (as a pointer of float, or `float *`) and computes the sum of the elements
- `getArray` allocates an array and fills it with random floating values that are in the interval [40; 41]. This returns a `float *`
- `isInTriangle` is a function that checks if a given 2D points is inside or outside a triangle. Even though it is not using arrays, it is used by another function for computing benchmarking
- `makeInsideList` takes an array of float (`float *`) containing all the vertices of triangles as well as an array of float (`float *`) containing the points. It returns an array of char (in JS this would be an `Uint8Array` but in C it's a `char *`) containing `0` or `1` to say if the point is outside or inside the triangle.

Using primitive types as argument or return values is fairly straightforward with Webassembly but using buffers and accurately allocated shared memory is a bit more tricky to figure out, this is why those examples were developed.


# What's in the JS files?
The files `arraytest.js` is loaded by `arraytest.html` and the file `triangletest.js` is loaded by the file `triangletest.html`. Both JS files contain the functions `_getHeapSpace(...)` and `_heapToArray(...)`, those functions are complementary helper function to interact with the memory allocation. This buffer act as shared memory between the JS scope and the Webassembly scope and using those function prevents from having to copy too much data from one scope to the other.
