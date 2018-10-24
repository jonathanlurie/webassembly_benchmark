
    // compiled with
    // em++ array.cpp -o array.js -Oz -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -g



    Module['onRuntimeInitialized'] = onRuntimeInitialized;


    function onRuntimeInitialized() {

      function _getHeapSpace(arrayType, length) {
        let numBytes = length * arrayType.BYTES_PER_ELEMENT;
        let ptr = Module._malloc(numBytes);
        let heapSpaceArray = new arrayType(Module.HEAPU8.buffer, ptr, length);
        return heapSpaceArray;
      }

      function _heapToArray(arrayType, pointer, length) {
        return new arrayType(Module.HEAPU8.buffer, pointer, length)
      }

      console.log(Module);

      // allocate, use and retrieve values from the wasm
      // Module._allocateArray(10e1);
      // Module._setArrayValue(12, 59.65)
      // console.log(Module._getArrayValue(11));
      // console.log(Module._getArrayValue(12));
      // console.log(Module._getArrayValue(13));



      /*
      // Comparing summing on WASM and summing on JS: comparable.
      // This example is almost the same as before except the malloc is not followed
      // by a copy of the data, but returns an array that we use directly.
      let numberArray = _getHeapSpace(Float32Array, 50e7)
      for (let i=0; i<numberArray.length; i++) {
        numberArray[i] = Math.round(Math.random() * 100);
      }

      let t0WASM= performance.now()
      let ret = Module._sum(numberArray.byteOffset, numberArray.length);
      let t1WASM = performance.now()
      console.log("wasm", t1WASM - t0WASM, "ms");
      console.log(ret);

      let t0JS= performance.now()
      let sumJS = 0
      for (let i=0; i<numberArray.length; i++) {
        sumJS += numberArray[i];
      }
      let t1JS = performance.now()
      console.log("js", t1JS - t0JS, "ms");
      console.log("sumJS:", sumJS);
      */


      // Call a webass method that returns a pointer to an allocated array, and get this array in JS
      let sizeOfArrayToCreate = 10;
      let pointer = Module._getArray(sizeOfArrayToCreate); // returns float*
      let returnedData = _heapToArray(Float32Array, pointer, sizeOfArrayToCreate)
      console.log(returnedData)




    }
