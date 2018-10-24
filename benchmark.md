Each test consists in creating a triangle and a point and check if the point is
inside or outside the triangle. All the points and triangles are generated at the
beginning so that this step is not measured. The same set of triangles and points
is sent to the JS solver and to the WASM solver.

triangle intersection on Chrome:
nb of triangles       JS (ms)       WASM (ms)
10e1                   0.3           0
10e2                   1             0.09
10e3                   6.2           0.3
10e4                   8.7           2.6
10e5                   278           30
10e6                   2510          331

triangle intersection on Firefox:
nb of triangles       JS (ms)       WASM (ms)
10e1                   0.3           0
10e2                   1             0
10e3                   4             1
10e4                   6             2
10e5                   181           32
10e6                   1632          492
