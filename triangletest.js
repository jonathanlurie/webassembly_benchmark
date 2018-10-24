
function isInTriangle_JS (px, py, ax, ay, bx, by, cx, cy) {
  let v0x = cx-ax;
  let v0y = cy-ay;
  let v1x = bx-ax;
  let v1y = by-ay;
  let v2x = px-ax;
  let v2y = py-ay;

  let dot00 = (v0x*v0x) + (v0y*v0y);
  let dot01 = (v0x*v1x) + (v0y*v1y);
  let dot02 = (v0x*v2x) + (v0y*v2y);
  let dot11 = (v1x*v1x) + (v1y*v1y);
  let dot12 = (v1x*v2x) + (v1y*v2y);

  let invDenom = 1.0 / (dot00 * dot11 - dot01 * dot01);

  let u = (dot11 * dot02 - dot01 * dot12) * invDenom;
  let v = (dot00 * dot12 - dot01 * dot02) * invDenom;

  let ret = (u >= 0) && (v >= 0) && (u + v < 1);
  return ret;
}


// takes an array of vertices, and arrays of points and output an array of Uint8Array
// where each element is 0 (points is outside triangle) or 1 (point is inside triangle).
function makeInsideList(vertices, points) {
  let numberOfTriangles = points.length / 2;
  let insideArray = new Uint8Array(numberOfTriangles);

  for (let i=0; i<numberOfTriangles; i++) {
    insideArray[i] = isInTriangle_JS(
      points[i*2],
      points[i*2+1],
      vertices[i*6],
      vertices[i*6+1],
      vertices[i*6+2],
      vertices[i*6+3],
      vertices[i*6+4],
      vertices[i*6+5]
    )
  }
  return insideArray
}

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

  let numberOfTriangles = 10e3;
  let vertices = _getHeapSpace(Float32Array, numberOfTriangles * 3 * 2 ) // 3 vertices * 2 dimensions
  let points = _getHeapSpace(Float32Array, numberOfTriangles*2)

  for (let i=0; i<numberOfTriangles; i++) {
    vertices[i*6] = Math.random() * 10 // x0
    vertices[i*6+1] = Math.random() * 10 // y0
    vertices[i*6+2] = Math.random() * 10 // x1
    vertices[i*6+3] = Math.random() * 10 // y1
    vertices[i*6+4] = Math.random() * 10 // x2
    vertices[i*6+5] = Math.random() * 10 // y2

    points[i*2] = Math.random() * 10 // x
    points[i*2+1] = Math.random() * 10 // y
  }

  //console.log(vertices);
  //console.log(points);
  let t0JS= performance.now()
  let isInsideArray = makeInsideList(vertices, points)
  let t1JS= performance.now()
  console.log("js inside triangle", t1JS-t0JS, "ms");
  //console.log(isInsideArray);

  let t0WASM= performance.now()
  let pointerToIsInsideArray = Module._makeInsideList(vertices.byteOffset, points.byteOffset, numberOfTriangles)
  let t1WASM = performance.now()
  let isInsideArray_WASM = _heapToArray(Uint8Array, pointerToIsInsideArray, numberOfTriangles)

  console.log("wasm inside triangle", t1WASM-t0WASM, "ms");
  //console.log(isInsideArray_WASM);
}
