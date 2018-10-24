#include <stdlib.h>
#include <time.h>
#include <emscripten.h>

extern "C" {
  int isArrayAllocated = 0;
  float *arr;
  long arrSize = 0;


  void EMSCRIPTEN_KEEPALIVE allocateArray(long size) {
    arrSize = size;
    float * fakeArr = (float *)malloc(size * sizeof(float));
    arr = fakeArr;
    isArrayAllocated = 1;
  }


  void EMSCRIPTEN_KEEPALIVE freeArray() {
    if (!isArrayAllocated)
      return;
    free(arr);
  }

  double EMSCRIPTEN_KEEPALIVE getArraySum() {
    double s = 0;
    for (long i = 0; i < arrSize; i++){
      s += arr[i];
    }
    return s;
  }



  void EMSCRIPTEN_KEEPALIVE setArrayValue(int index, float value) { arr[index] = value; }


  float EMSCRIPTEN_KEEPALIVE getArrayValue(int index) { return arr[index]; }


  double EMSCRIPTEN_KEEPALIVE sum(float *array, long length){
    double ret = 0;
    for (long i = 0; i < length; i++){
      ret += array[i];
    }
    return ret;
  }




  float * EMSCRIPTEN_KEEPALIVE getArray(long length) {
    srand (time(NULL));
    float values[length];

    for (long i=0; i<length; i++) {
      values[i] = i + 40 + (rand() % 1000)/1000.;
    }
    float * p = values;
    return p;
  }




  char EMSCRIPTEN_KEEPALIVE isInTriangle (float px, float py, float ax, float ay, float bx, float by, float cx, float cy){
    float v0x = cx-ax;
    float v0y = cy-ay;
    float v1x = bx-ax;
    float v1y = by-ay;
    float v2x = px-ax;
    float v2y = py-ay;

    float dot00 = (v0x*v0x) + (v0y*v0y);
    float dot01 = (v0x*v1x) + (v0y*v1y);
    float dot02 = (v0x*v2x) + (v0y*v2y);
    float dot11 = (v1x*v1x) + (v1y*v1y);
    float dot12 = (v1x*v2x) + (v1y*v2y);

    float invDenom = 1.0 / (dot00 * dot11 - dot01 * dot01);

    float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
    float v = (dot00 * dot12 - dot01 * dot02) * invDenom;

    return (u >= 0) && (v >= 0) && (u + v < 1);
  }

  char * EMSCRIPTEN_KEEPALIVE makeInsideList(float* vertices, float* points, int numberOfTriangles) {
    char insideArray[numberOfTriangles];

    for (int i=0; i<numberOfTriangles; i++) {
      insideArray[i] = isInTriangle(
        points[i*2],
        points[i*2+1],
        vertices[i*6],
        vertices[i*6+1],
        vertices[i*6+2],
        vertices[i*6+3],
        vertices[i*6+4],
        vertices[i*6+5]
      );
    }
    //return insideArray;

    char * p = insideArray;
    return p;
  }


}
