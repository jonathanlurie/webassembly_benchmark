(module
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (import "env" "memory" (memory $memory 256))
 (import "env" "DYNAMICTOP_PTR" (global $DYNAMICTOP_PTR$asm2wasm$import i32))
 (import "env" "STACKTOP" (global $STACKTOP$asm2wasm$import i32))
 (import "env" "STACK_MAX" (global $STACK_MAX$asm2wasm$import i32))
 (import "env" "enlargeMemory" (func $enlargeMemory (result i32)))
 (import "env" "getTotalMemory" (func $getTotalMemory (result i32)))
 (import "env" "abortOnCannotGrowMemory" (func $abortOnCannotGrowMemory (result i32)))
 (import "env" "___setErrNo" (func $___setErrNo (param i32)))
 (import "env" "_abort" (func $_abort))
 (import "env" "_emscripten_memcpy_big" (func $_emscripten_memcpy_big (param i32 i32 i32) (result i32)))
 (import "env" "_time" (func $_time (param i32) (result i32)))
 (global $DYNAMICTOP_PTR (mut i32) (get_global $DYNAMICTOP_PTR$asm2wasm$import))
 (global $STACKTOP (mut i32) (get_global $STACKTOP$asm2wasm$import))
 (global $STACK_MAX (mut i32) (get_global $STACK_MAX$asm2wasm$import))
 (global $__THREW__ (mut i32) (i32.const 0))
 (global $threwValue (mut i32) (i32.const 0))
 (global $tempRet0 (mut i32) (i32.const 0))
 (export "__growWasmMemory" (func $__growWasmMemory))
 (export "___errno_location" (func $___errno_location))
 (export "_allocateArray" (func $_allocateArray))
 (export "_free" (func $_free))
 (export "_freeArray" (func $_freeArray))
 (export "_getArray" (func $_getArray))
 (export "_getArraySum" (func $_getArraySum))
 (export "_getArrayValue" (func $legalstub$_getArrayValue))
 (export "_isInTriangle" (func $legalstub$_isInTriangle))
 (export "_makeInsideList" (func $_makeInsideList))
 (export "_malloc" (func $_malloc))
 (export "_memcpy" (func $_memcpy))
 (export "_memset" (func $_memset))
 (export "_sbrk" (func $_sbrk))
 (export "_setArrayValue" (func $legalstub$_setArrayValue))
 (export "_sum" (func $_sum))
 (export "establishStackSpace" (func $establishStackSpace))
 (export "getTempRet0" (func $getTempRet0))
 (export "runPostSets" (func $runPostSets))
 (export "setTempRet0" (func $setTempRet0))
 (export "setThrew" (func $setThrew))
 (export "stackAlloc" (func $stackAlloc))
 (export "stackRestore" (func $stackRestore))
 (export "stackSave" (func $stackSave))
 (func $__growWasmMemory (; 7 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (grow_memory
   (get_local $0)
  )
 )
 (func $stackAlloc (; 8 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (set_local $1
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.add
    (get_global $STACKTOP)
    (get_local $0)
   )
  )
  (set_global $STACKTOP
   (i32.and
    (i32.add
     (get_global $STACKTOP)
     (i32.const 15)
    )
    (i32.const -16)
   )
  )
  (get_local $1)
 )
 (func $stackSave (; 9 ;) (; has Stack IR ;) (result i32)
  (get_global $STACKTOP)
 )
 (func $stackRestore (; 10 ;) (; has Stack IR ;) (param $0 i32)
  (set_global $STACKTOP
   (get_local $0)
  )
 )
 (func $establishStackSpace (; 11 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32)
  (set_global $STACKTOP
   (get_local $0)
  )
  (set_global $STACK_MAX
   (get_local $1)
  )
 )
 (func $setThrew (; 12 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32)
  (if
   (i32.eqz
    (get_global $__THREW__)
   )
   (block
    (set_global $__THREW__
     (get_local $0)
    )
    (set_global $threwValue
     (get_local $1)
    )
   )
  )
 )
 (func $setTempRet0 (; 13 ;) (; has Stack IR ;) (param $0 i32)
  (set_global $tempRet0
   (get_local $0)
  )
 )
 (func $getTempRet0 (; 14 ;) (; has Stack IR ;) (result i32)
  (get_global $tempRet0)
 )
 (func $_allocateArray (; 15 ;) (; has Stack IR ;) (param $0 i32)
  ;;@ array.cpp:12:0
  (i32.store
   (i32.const 1040)
   (get_local $0)
  )
  ;;@ array.cpp:13:0
  (set_local $0
   (i32.shl
    (get_local $0)
    (i32.const 2)
   )
  )
  (set_local $0
   (call $_malloc
    (get_local $0)
   )
  )
  ;;@ array.cpp:14:0
  (i32.store
   (i32.const 1036)
   (get_local $0)
  )
  ;;@ array.cpp:15:0
  (i32.store
   (i32.const 1032)
   (i32.const 1)
  )
 )
 (func $_freeArray (; 16 ;) (; has Stack IR ;)
  (local $0 i32)
  ;;@ array.cpp:20:0
  (set_local $0
   (i32.load
    (i32.const 1032)
   )
  )
  (if
   (get_local $0)
   (block
    ;;@ array.cpp:22:0
    (set_local $0
     (i32.load
      (i32.const 1036)
     )
    )
    (call $_free
     (get_local $0)
    )
   )
  )
 )
 (func $_getArraySum (; 17 ;) (; has Stack IR ;) (result f64)
  (local $0 i32)
  (local $1 f64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f32)
  (local $6 f64)
  (set_local $2
   (i32.load
    (i32.const 1040)
   )
  )
  (set_local $3
   (i32.load
    (i32.const 1036)
   )
  )
  (loop $while-in
   (block $while-out
    ;;@ array.cpp:27:0
    (br_if $while-out
     (i32.ge_s
      (get_local $0)
      (get_local $2)
     )
    )
    ;;@ array.cpp:28:0
    (set_local $4
     (i32.add
      (get_local $3)
      (i32.shl
       (get_local $0)
       (i32.const 2)
      )
     )
    )
    (set_local $5
     (f32.load
      (get_local $4)
     )
    )
    (set_local $6
     (f64.promote/f32
      (get_local $5)
     )
    )
    (set_local $1
     (f64.add
      (get_local $1)
      (get_local $6)
     )
    )
    ;;@ array.cpp:27:0
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
    (br $while-in)
   )
  )
  ;;@ array.cpp:30:0
  (get_local $1)
 )
 (func $_setArrayValue (; 18 ;) (; has Stack IR ;) (param $0 i32) (param $1 f32)
  (local $2 i32)
  ;;@ array.cpp:35:0
  (set_local $2
   (i32.load
    (i32.const 1036)
   )
  )
  (set_local $0
   (i32.add
    (get_local $2)
    (i32.shl
     (get_local $0)
     (i32.const 2)
    )
   )
  )
  (f32.store
   (get_local $0)
   (get_local $1)
  )
 )
 (func $_getArrayValue (; 19 ;) (; has Stack IR ;) (param $0 i32) (result f32)
  (local $1 i32)
  (local $2 f32)
  ;;@ array.cpp:38:0
  (set_local $1
   (i32.load
    (i32.const 1036)
   )
  )
  (set_local $0
   (i32.add
    (get_local $1)
    (i32.shl
     (get_local $0)
     (i32.const 2)
    )
   )
  )
  (set_local $2
   (f32.load
    (get_local $0)
   )
  )
  (get_local $2)
 )
 (func $_sum (; 20 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result f64)
  (local $2 i32)
  (local $3 f64)
  (local $4 i32)
  (local $5 f32)
  (local $6 f64)
  (loop $while-in
   (block $while-out
    ;;@ array.cpp:43:0
    (br_if $while-out
     (i32.ge_s
      (get_local $2)
      (get_local $1)
     )
    )
    ;;@ array.cpp:44:0
    (set_local $4
     (i32.add
      (get_local $0)
      (i32.shl
       (get_local $2)
       (i32.const 2)
      )
     )
    )
    (set_local $5
     (f32.load
      (get_local $4)
     )
    )
    (set_local $6
     (f64.promote/f32
      (get_local $5)
     )
    )
    (set_local $3
     (f64.add
      (get_local $3)
      (get_local $6)
     )
    )
    ;;@ array.cpp:43:0
    (set_local $2
     (i32.add
      (get_local $2)
      (i32.const 1)
     )
    )
    (br $while-in)
   )
  )
  ;;@ array.cpp:46:0
  (get_local $3)
 )
 (func $_getArray (; 21 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 f64)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (set_local $6
   (get_global $STACKTOP)
  )
  ;;@ array.cpp:51:0
  (set_local $1
   (call $_time
    (i32.const 0)
   )
  )
  (call $_srand
   (get_local $1)
  )
  ;;@ array.cpp:52:0
  (set_local $1
   (i32.shl
    (get_local $0)
    (i32.const 2)
   )
  )
  (set_local $5
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.add
    (get_global $STACKTOP)
    (i32.and
     (i32.add
      (get_local $1)
      (i32.const 15)
     )
     (i32.const -16)
    )
   )
  )
  (set_local $1
   (i32.const 0)
  )
  (loop $while-in
   (block $while-out
    ;;@ array.cpp:54:0
    (br_if $while-out
     (i32.ge_s
      (get_local $1)
      (get_local $0)
     )
    )
    ;;@ array.cpp:55:0
    (set_local $2
     (i32.add
      (get_local $1)
      (i32.const 40)
     )
    )
    (set_local $3
     (f64.convert_s/i32
      (get_local $2)
     )
    )
    (set_local $2
     (call $_rand)
    )
    (set_local $2
     (i32.rem_s
      (get_local $2)
      (i32.const 1000)
     )
    )
    (set_local $4
     (f64.convert_s/i32
      (get_local $2)
     )
    )
    (set_local $4
     (f64.div
      (get_local $4)
      (f64.const 1e3)
     )
    )
    (set_local $3
     (f64.add
      (get_local $4)
      (get_local $3)
     )
    )
    (set_local $7
     (f32.demote/f64
      (get_local $3)
     )
    )
    (set_local $2
     (i32.add
      (get_local $5)
      (i32.shl
       (get_local $1)
       (i32.const 2)
      )
     )
    )
    (f32.store
     (get_local $2)
     (get_local $7)
    )
    ;;@ array.cpp:54:0
    (set_local $1
     (i32.add
      (get_local $1)
      (i32.const 1)
     )
    )
    (br $while-in)
   )
  )
  (set_global $STACKTOP
   (get_local $6)
  )
  ;;@ array.cpp:59:0
  (get_local $5)
 )
 (func $_isInTriangle (; 22 ;) (; has Stack IR ;) (param $0 f32) (param $1 f32) (param $2 f32) (param $3 f32) (param $4 f32) (param $5 f32) (param $6 f32) (param $7 f32) (result i32)
  (local $8 i32)
  (local $9 f32)
  (local $10 i32)
  ;;@ array.cpp:65:0
  (set_local $6
   (f32.sub
    (get_local $6)
    (get_local $2)
   )
  )
  ;;@ array.cpp:66:0
  (set_local $7
   (f32.sub
    (get_local $7)
    (get_local $3)
   )
  )
  ;;@ array.cpp:67:0
  (set_local $4
   (f32.sub
    (get_local $4)
    (get_local $2)
   )
  )
  ;;@ array.cpp:68:0
  (set_local $5
   (f32.sub
    (get_local $5)
    (get_local $3)
   )
  )
  ;;@ array.cpp:69:0
  (set_local $2
   (f32.sub
    (get_local $0)
    (get_local $2)
   )
  )
  ;;@ array.cpp:70:0
  (set_local $1
   (f32.sub
    (get_local $1)
    (get_local $3)
   )
  )
  ;;@ array.cpp:72:0
  (set_local $0
   (f32.mul
    (get_local $6)
    (get_local $6)
   )
  )
  (set_local $3
   (f32.mul
    (get_local $7)
    (get_local $7)
   )
  )
  (set_local $3
   (f32.add
    (get_local $0)
    (get_local $3)
   )
  )
  ;;@ array.cpp:73:0
  (set_local $0
   (f32.mul
    (get_local $4)
    (get_local $6)
   )
  )
  (set_local $9
   (f32.mul
    (get_local $5)
    (get_local $7)
   )
  )
  (set_local $0
   (f32.add
    (get_local $0)
    (get_local $9)
   )
  )
  ;;@ array.cpp:74:0
  (set_local $6
   (f32.mul
    (get_local $2)
    (get_local $6)
   )
  )
  (set_local $7
   (f32.mul
    (get_local $1)
    (get_local $7)
   )
  )
  (set_local $6
   (f32.add
    (get_local $6)
    (get_local $7)
   )
  )
  ;;@ array.cpp:75:0
  (set_local $7
   (f32.mul
    (get_local $4)
    (get_local $4)
   )
  )
  (set_local $9
   (f32.mul
    (get_local $5)
    (get_local $5)
   )
  )
  (set_local $7
   (f32.add
    (get_local $7)
    (get_local $9)
   )
  )
  ;;@ array.cpp:76:0
  (set_local $2
   (f32.mul
    (get_local $2)
    (get_local $4)
   )
  )
  (set_local $1
   (f32.mul
    (get_local $1)
    (get_local $5)
   )
  )
  (set_local $1
   (f32.add
    (get_local $2)
    (get_local $1)
   )
  )
  ;;@ array.cpp:78:0
  (set_local $2
   (f32.mul
    (get_local $7)
    (get_local $3)
   )
  )
  (set_local $4
   (f32.mul
    (get_local $0)
    (get_local $0)
   )
  )
  (set_local $2
   (f32.sub
    (get_local $2)
    (get_local $4)
   )
  )
  (set_local $2
   (f32.div
    (f32.const 1)
    (get_local $2)
   )
  )
  ;;@ array.cpp:80:0
  (set_local $4
   (f32.mul
    (get_local $7)
    (get_local $6)
   )
  )
  (set_local $5
   (f32.mul
    (get_local $1)
    (get_local $0)
   )
  )
  (set_local $4
   (f32.sub
    (get_local $4)
    (get_local $5)
   )
  )
  (set_local $4
   (f32.mul
    (get_local $4)
    (get_local $2)
   )
  )
  ;;@ array.cpp:81:0
  (set_local $1
   (f32.mul
    (get_local $1)
    (get_local $3)
   )
  )
  (set_local $0
   (f32.mul
    (get_local $0)
    (get_local $6)
   )
  )
  (set_local $0
   (f32.sub
    (get_local $1)
    (get_local $0)
   )
  )
  (set_local $0
   (f32.mul
    (get_local $0)
    (get_local $2)
   )
  )
  ;;@ array.cpp:83:0
  (set_local $8
   (f32.ge
    (get_local $4)
    (f32.const 0)
   )
  )
  (set_local $10
   (f32.ge
    (get_local $0)
    (f32.const 0)
   )
  )
  (set_local $8
   (i32.and
    (get_local $8)
    (get_local $10)
   )
  )
  (set_local $0
   (f32.add
    (get_local $4)
    (get_local $0)
   )
  )
  (set_local $10
   (f32.lt
    (get_local $0)
    (f32.const 1)
   )
  )
  (set_local $8
   (i32.and
    (get_local $8)
    (get_local $10)
   )
  )
  (set_local $8
   (i32.and
    (get_local $8)
    (i32.const 1)
   )
  )
  (get_local $8)
 )
 (func $_makeInsideList (; 23 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f32)
  (local $9 f32)
  (local $10 f32)
  (local $11 f32)
  (local $12 f32)
  (local $13 f32)
  (local $14 f32)
  (local $15 f32)
  (set_local $7
   (get_global $STACKTOP)
  )
  ;;@ array.cpp:87:0
  (set_local $6
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.add
    (get_global $STACKTOP)
    (i32.and
     (i32.add
      (get_local $2)
      (i32.const 15)
     )
     (i32.const -16)
    )
   )
  )
  (loop $while-in
   (block $while-out
    ;;@ array.cpp:89:0
    (br_if $while-out
     (i32.ge_s
      (get_local $5)
      (get_local $2)
     )
    )
    ;;@ array.cpp:91:0
    (set_local $4
     (i32.shl
      (get_local $5)
      (i32.const 1)
     )
    )
    (set_local $3
     (i32.add
      (get_local $1)
      (i32.shl
       (get_local $4)
       (i32.const 2)
      )
     )
    )
    (set_local $8
     (f32.load
      (get_local $3)
     )
    )
    ;;@ array.cpp:92:0
    (set_local $4
     (i32.or
      (get_local $4)
      (i32.const 1)
     )
    )
    (set_local $4
     (i32.add
      (get_local $1)
      (i32.shl
       (get_local $4)
       (i32.const 2)
      )
     )
    )
    (set_local $9
     (f32.load
      (get_local $4)
     )
    )
    ;;@ array.cpp:93:0
    (set_local $4
     (i32.mul
      (get_local $5)
      (i32.const 6)
     )
    )
    (set_local $3
     (i32.add
      (get_local $0)
      (i32.shl
       (get_local $4)
       (i32.const 2)
      )
     )
    )
    (set_local $10
     (f32.load
      (get_local $3)
     )
    )
    ;;@ array.cpp:94:0
    (set_local $3
     (i32.or
      (get_local $4)
      (i32.const 1)
     )
    )
    (set_local $3
     (i32.add
      (get_local $0)
      (i32.shl
       (get_local $3)
       (i32.const 2)
      )
     )
    )
    (set_local $11
     (f32.load
      (get_local $3)
     )
    )
    ;;@ array.cpp:95:0
    (set_local $3
     (i32.add
      (get_local $4)
      (i32.const 2)
     )
    )
    (set_local $3
     (i32.add
      (get_local $0)
      (i32.shl
       (get_local $3)
       (i32.const 2)
      )
     )
    )
    (set_local $12
     (f32.load
      (get_local $3)
     )
    )
    ;;@ array.cpp:96:0
    (set_local $3
     (i32.add
      (get_local $4)
      (i32.const 3)
     )
    )
    (set_local $3
     (i32.add
      (get_local $0)
      (i32.shl
       (get_local $3)
       (i32.const 2)
      )
     )
    )
    (set_local $13
     (f32.load
      (get_local $3)
     )
    )
    ;;@ array.cpp:97:0
    (set_local $3
     (i32.add
      (get_local $4)
      (i32.const 4)
     )
    )
    (set_local $3
     (i32.add
      (get_local $0)
      (i32.shl
       (get_local $3)
       (i32.const 2)
      )
     )
    )
    (set_local $14
     (f32.load
      (get_local $3)
     )
    )
    ;;@ array.cpp:98:0
    (set_local $4
     (i32.add
      (get_local $4)
      (i32.const 5)
     )
    )
    (set_local $4
     (i32.add
      (get_local $0)
      (i32.shl
       (get_local $4)
       (i32.const 2)
      )
     )
    )
    (set_local $15
     (f32.load
      (get_local $4)
     )
    )
    ;;@ array.cpp:90:0
    (set_local $4
     (call $_isInTriangle
      (get_local $8)
      (get_local $9)
      (get_local $10)
      (get_local $11)
      (get_local $12)
      (get_local $13)
      (get_local $14)
      (get_local $15)
     )
    )
    (set_local $3
     (i32.add
      (get_local $6)
      (get_local $5)
     )
    )
    (i32.store8
     (get_local $3)
     (get_local $4)
    )
    ;;@ array.cpp:89:0
    (set_local $5
     (i32.add
      (get_local $5)
      (i32.const 1)
     )
    )
    (br $while-in)
   )
  )
  (set_global $STACKTOP
   (get_local $7)
  )
  ;;@ array.cpp:105:0
  (get_local $6)
 )
 (func $_malloc (; 24 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (block $folding-inner1
   (block $folding-inner0
    (set_local $2
     (get_global $STACKTOP)
    )
    (set_global $STACKTOP
     (i32.add
      (get_global $STACKTOP)
      (i32.const 16)
     )
    )
    (set_local $14
     (get_local $2)
    )
    (set_local $3
     (block $do-once (result i32)
      (if (result i32)
       (i32.lt_u
        (get_local $0)
        (i32.const 245)
       )
       (block (result i32)
        (if
         (i32.and
          (tee_local $3
           (i32.shr_u
            (tee_local $7
             (i32.load
              (i32.const 1044)
             )
            )
            (tee_local $0
             (i32.shr_u
              (tee_local $2
               (select
                (i32.const 16)
                (i32.and
                 (i32.add
                  (get_local $0)
                  (i32.const 11)
                 )
                 (i32.const -8)
                )
                (i32.lt_u
                 (get_local $0)
                 (i32.const 11)
                )
               )
              )
              (i32.const 3)
             )
            )
           )
          )
          (i32.const 3)
         )
         (block
          (if
           (i32.eq
            (tee_local $3
             (i32.load
              (tee_local $6
               (i32.add
                (tee_local $0
                 (i32.load
                  (tee_local $4
                   (i32.add
                    (tee_local $2
                     (i32.add
                      (i32.shl
                       (tee_local $1
                        (i32.add
                         (i32.xor
                          (i32.and
                           (get_local $3)
                           (i32.const 1)
                          )
                          (i32.const 1)
                         )
                         (get_local $0)
                        )
                       )
                       (i32.const 3)
                      )
                      (i32.const 1084)
                     )
                    )
                    (i32.const 8)
                   )
                  )
                 )
                )
                (i32.const 8)
               )
              )
             )
            )
            (get_local $2)
           )
           (i32.store
            (i32.const 1044)
            (i32.and
             (get_local $7)
             (i32.xor
              (i32.shl
               (i32.const 1)
               (get_local $1)
              )
              (i32.const -1)
             )
            )
           )
           (block
            (if
             (i32.gt_u
              (i32.load
               (i32.const 1060)
              )
              (get_local $3)
             )
             (call $_abort)
            )
            (if
             (i32.eq
              (i32.load
               (tee_local $5
                (i32.add
                 (get_local $3)
                 (i32.const 12)
                )
               )
              )
              (get_local $0)
             )
             (block
              (i32.store
               (get_local $5)
               (get_local $2)
              )
              (i32.store
               (get_local $4)
               (get_local $3)
              )
             )
             (call $_abort)
            )
           )
          )
          (i32.store offset=4
           (get_local $0)
           (i32.or
            (tee_local $3
             (i32.shl
              (get_local $1)
              (i32.const 3)
             )
            )
            (i32.const 3)
           )
          )
          (i32.store
           (tee_local $0
            (i32.add
             (i32.add
              (get_local $0)
              (get_local $3)
             )
             (i32.const 4)
            )
           )
           (i32.or
            (i32.load
             (get_local $0)
            )
            (i32.const 1)
           )
          )
          (set_global $STACKTOP
           (get_local $14)
          )
          (return
           (get_local $6)
          )
         )
        )
        (if (result i32)
         (i32.gt_u
          (get_local $2)
          (tee_local $13
           (i32.load
            (i32.const 1052)
           )
          )
         )
         (block (result i32)
          (if
           (get_local $3)
           (block
            (set_local $0
             (i32.and
              (i32.shr_u
               (tee_local $3
                (i32.add
                 (i32.and
                  (tee_local $0
                   (i32.and
                    (i32.shl
                     (get_local $3)
                     (get_local $0)
                    )
                    (i32.or
                     (tee_local $0
                      (i32.shl
                       (i32.const 2)
                       (get_local $0)
                      )
                     )
                     (i32.sub
                      (i32.const 0)
                      (get_local $0)
                     )
                    )
                   )
                  )
                  (i32.sub
                   (i32.const 0)
                   (get_local $0)
                  )
                 )
                 (i32.const -1)
                )
               )
               (i32.const 12)
              )
              (i32.const 16)
             )
            )
            (if
             (i32.eq
              (tee_local $3
               (i32.load
                (tee_local $10
                 (i32.add
                  (tee_local $0
                   (i32.load
                    (tee_local $9
                     (i32.add
                      (tee_local $5
                       (i32.add
                        (i32.shl
                         (tee_local $1
                          (i32.add
                           (i32.or
                            (i32.or
                             (i32.or
                              (i32.or
                               (tee_local $1
                                (i32.and
                                 (i32.shr_u
                                  (tee_local $3
                                   (i32.shr_u
                                    (get_local $3)
                                    (get_local $0)
                                   )
                                  )
                                  (i32.const 5)
                                 )
                                 (i32.const 8)
                                )
                               )
                               (get_local $0)
                              )
                              (tee_local $3
                               (i32.and
                                (i32.shr_u
                                 (tee_local $0
                                  (i32.shr_u
                                   (get_local $3)
                                   (get_local $1)
                                  )
                                 )
                                 (i32.const 2)
                                )
                                (i32.const 4)
                               )
                              )
                             )
                             (tee_local $3
                              (i32.and
                               (i32.shr_u
                                (tee_local $0
                                 (i32.shr_u
                                  (get_local $0)
                                  (get_local $3)
                                 )
                                )
                                (i32.const 1)
                               )
                               (i32.const 2)
                              )
                             )
                            )
                            (tee_local $3
                             (i32.and
                              (i32.shr_u
                               (tee_local $0
                                (i32.shr_u
                                 (get_local $0)
                                 (get_local $3)
                                )
                               )
                               (i32.const 1)
                              )
                              (i32.const 1)
                             )
                            )
                           )
                           (i32.shr_u
                            (get_local $0)
                            (get_local $3)
                           )
                          )
                         )
                         (i32.const 3)
                        )
                        (i32.const 1084)
                       )
                      )
                      (i32.const 8)
                     )
                    )
                   )
                  )
                  (i32.const 8)
                 )
                )
               )
              )
              (get_local $5)
             )
             (i32.store
              (i32.const 1044)
              (tee_local $4
               (i32.and
                (get_local $7)
                (i32.xor
                 (i32.shl
                  (i32.const 1)
                  (get_local $1)
                 )
                 (i32.const -1)
                )
               )
              )
             )
             (block
              (if
               (i32.gt_u
                (i32.load
                 (i32.const 1060)
                )
                (get_local $3)
               )
               (call $_abort)
              )
              (if
               (i32.eq
                (i32.load
                 (tee_local $11
                  (i32.add
                   (get_local $3)
                   (i32.const 12)
                  )
                 )
                )
                (get_local $0)
               )
               (block
                (i32.store
                 (get_local $11)
                 (get_local $5)
                )
                (i32.store
                 (get_local $9)
                 (get_local $3)
                )
                (set_local $4
                 (get_local $7)
                )
               )
               (call $_abort)
              )
             )
            )
            (i32.store offset=4
             (get_local $0)
             (i32.or
              (get_local $2)
              (i32.const 3)
             )
            )
            (i32.store offset=4
             (tee_local $7
              (i32.add
               (get_local $0)
               (get_local $2)
              )
             )
             (i32.or
              (tee_local $5
               (i32.sub
                (tee_local $3
                 (i32.shl
                  (get_local $1)
                  (i32.const 3)
                 )
                )
                (get_local $2)
               )
              )
              (i32.const 1)
             )
            )
            (i32.store
             (i32.add
              (get_local $0)
              (get_local $3)
             )
             (get_local $5)
            )
            (if
             (get_local $13)
             (block
              (set_local $2
               (i32.load
                (i32.const 1064)
               )
              )
              (set_local $0
               (i32.add
                (i32.shl
                 (tee_local $3
                  (i32.shr_u
                   (get_local $13)
                   (i32.const 3)
                  )
                 )
                 (i32.const 3)
                )
                (i32.const 1084)
               )
              )
              (if
               (i32.and
                (get_local $4)
                (tee_local $3
                 (i32.shl
                  (i32.const 1)
                  (get_local $3)
                 )
                )
               )
               (if
                (i32.gt_u
                 (i32.load
                  (i32.const 1060)
                 )
                 (tee_local $1
                  (i32.load
                   (tee_local $3
                    (i32.add
                     (get_local $0)
                     (i32.const 8)
                    )
                   )
                  )
                 )
                )
                (call $_abort)
                (block
                 (set_local $6
                  (get_local $1)
                 )
                 (set_local $12
                  (get_local $3)
                 )
                )
               )
               (block
                (i32.store
                 (i32.const 1044)
                 (i32.or
                  (get_local $4)
                  (get_local $3)
                 )
                )
                (set_local $6
                 (get_local $0)
                )
                (set_local $12
                 (i32.add
                  (get_local $0)
                  (i32.const 8)
                 )
                )
               )
              )
              (i32.store
               (get_local $12)
               (get_local $2)
              )
              (i32.store offset=12
               (get_local $6)
               (get_local $2)
              )
              (i32.store offset=8
               (get_local $2)
               (get_local $6)
              )
              (i32.store offset=12
               (get_local $2)
               (get_local $0)
              )
             )
            )
            (i32.store
             (i32.const 1052)
             (get_local $5)
            )
            (i32.store
             (i32.const 1064)
             (get_local $7)
            )
            (set_global $STACKTOP
             (get_local $14)
            )
            (return
             (get_local $10)
            )
           )
          )
          (if (result i32)
           (tee_local $12
            (i32.load
             (i32.const 1048)
            )
           )
           (block
            (set_local $0
             (i32.and
              (i32.shr_u
               (tee_local $3
                (i32.add
                 (i32.and
                  (get_local $12)
                  (i32.sub
                   (i32.const 0)
                   (get_local $12)
                  )
                 )
                 (i32.const -1)
                )
               )
               (i32.const 12)
              )
              (i32.const 16)
             )
            )
            (set_local $0
             (tee_local $4
              (i32.load
               (i32.add
                (i32.shl
                 (i32.add
                  (i32.or
                   (i32.or
                    (i32.or
                     (i32.or
                      (tee_local $4
                       (i32.and
                        (i32.shr_u
                         (tee_local $3
                          (i32.shr_u
                           (get_local $3)
                           (get_local $0)
                          )
                         )
                         (i32.const 5)
                        )
                        (i32.const 8)
                       )
                      )
                      (get_local $0)
                     )
                     (tee_local $3
                      (i32.and
                       (i32.shr_u
                        (tee_local $0
                         (i32.shr_u
                          (get_local $3)
                          (get_local $4)
                         )
                        )
                        (i32.const 2)
                       )
                       (i32.const 4)
                      )
                     )
                    )
                    (tee_local $3
                     (i32.and
                      (i32.shr_u
                       (tee_local $0
                        (i32.shr_u
                         (get_local $0)
                         (get_local $3)
                        )
                       )
                       (i32.const 1)
                      )
                      (i32.const 2)
                     )
                    )
                   )
                   (tee_local $3
                    (i32.and
                     (i32.shr_u
                      (tee_local $0
                       (i32.shr_u
                        (get_local $0)
                        (get_local $3)
                       )
                      )
                      (i32.const 1)
                     )
                     (i32.const 1)
                    )
                   )
                  )
                  (i32.shr_u
                   (get_local $0)
                   (get_local $3)
                  )
                 )
                 (i32.const 2)
                )
                (i32.const 1348)
               )
              )
             )
            )
            (set_local $10
             (i32.sub
              (i32.and
               (i32.load offset=4
                (get_local $4)
               )
               (i32.const -8)
              )
              (get_local $2)
             )
            )
            (loop $while-in
             (block $while-out
              (if
               (tee_local $3
                (i32.load offset=16
                 (get_local $0)
                )
               )
               (set_local $0
                (get_local $3)
               )
               (br_if $while-out
                (i32.eqz
                 (tee_local $0
                  (i32.load offset=20
                   (get_local $0)
                  )
                 )
                )
               )
              )
              (set_local $4
               (select
                (get_local $0)
                (get_local $4)
                (tee_local $6
                 (i32.lt_u
                  (tee_local $3
                   (i32.sub
                    (i32.and
                     (i32.load offset=4
                      (get_local $0)
                     )
                     (i32.const -8)
                    )
                    (get_local $2)
                   )
                  )
                  (get_local $10)
                 )
                )
               )
              )
              (set_local $10
               (select
                (get_local $3)
                (get_local $10)
                (get_local $6)
               )
              )
              (br $while-in)
             )
            )
            (if
             (i32.gt_u
              (tee_local $15
               (i32.load
                (i32.const 1060)
               )
              )
              (get_local $4)
             )
             (call $_abort)
            )
            (if
             (i32.le_u
              (tee_local $8
               (i32.add
                (get_local $4)
                (get_local $2)
               )
              )
              (get_local $4)
             )
             (call $_abort)
            )
            (set_local $11
             (i32.load offset=24
              (get_local $4)
             )
            )
            (block $do-once4
             (if
              (i32.eq
               (tee_local $0
                (i32.load offset=12
                 (get_local $4)
                )
               )
               (get_local $4)
              )
              (block
               (if
                (i32.eqz
                 (tee_local $0
                  (i32.load
                   (tee_local $3
                    (i32.add
                     (get_local $4)
                     (i32.const 20)
                    )
                   )
                  )
                 )
                )
                (br_if $do-once4
                 (i32.eqz
                  (tee_local $0
                   (i32.load
                    (tee_local $3
                     (i32.add
                      (get_local $4)
                      (i32.const 16)
                     )
                    )
                   )
                  )
                 )
                )
               )
               (loop $while-in7
                (block $while-out6
                 (if
                  (i32.eqz
                   (tee_local $9
                    (i32.load
                     (tee_local $6
                      (i32.add
                       (get_local $0)
                       (i32.const 20)
                      )
                     )
                    )
                   )
                  )
                  (br_if $while-out6
                   (i32.eqz
                    (tee_local $9
                     (i32.load
                      (tee_local $6
                       (i32.add
                        (get_local $0)
                        (i32.const 16)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                 (set_local $3
                  (get_local $6)
                 )
                 (set_local $0
                  (get_local $9)
                 )
                 (br $while-in7)
                )
               )
               (if
                (i32.gt_u
                 (get_local $15)
                 (get_local $3)
                )
                (call $_abort)
                (block
                 (i32.store
                  (get_local $3)
                  (i32.const 0)
                 )
                 (set_local $1
                  (get_local $0)
                 )
                )
               )
              )
              (block
               (if
                (i32.gt_u
                 (get_local $15)
                 (tee_local $3
                  (i32.load offset=8
                   (get_local $4)
                  )
                 )
                )
                (call $_abort)
               )
               (if
                (i32.ne
                 (i32.load
                  (tee_local $6
                   (i32.add
                    (get_local $3)
                    (i32.const 12)
                   )
                  )
                 )
                 (get_local $4)
                )
                (call $_abort)
               )
               (if
                (i32.eq
                 (i32.load
                  (tee_local $9
                   (i32.add
                    (get_local $0)
                    (i32.const 8)
                   )
                  )
                 )
                 (get_local $4)
                )
                (block
                 (i32.store
                  (get_local $6)
                  (get_local $0)
                 )
                 (i32.store
                  (get_local $9)
                  (get_local $3)
                 )
                 (set_local $1
                  (get_local $0)
                 )
                )
                (call $_abort)
               )
              )
             )
            )
            (block $label$break$L78
             (if
              (get_local $11)
              (block
               (if
                (i32.eq
                 (get_local $4)
                 (i32.load
                  (tee_local $3
                   (i32.add
                    (i32.shl
                     (tee_local $0
                      (i32.load offset=28
                       (get_local $4)
                      )
                     )
                     (i32.const 2)
                    )
                    (i32.const 1348)
                   )
                  )
                 )
                )
                (block
                 (i32.store
                  (get_local $3)
                  (get_local $1)
                 )
                 (if
                  (i32.eqz
                   (get_local $1)
                  )
                  (block
                   (i32.store
                    (i32.const 1048)
                    (i32.and
                     (get_local $12)
                     (i32.xor
                      (i32.shl
                       (i32.const 1)
                       (get_local $0)
                      )
                      (i32.const -1)
                     )
                    )
                   )
                   (br $label$break$L78)
                  )
                 )
                )
                (if
                 (i32.gt_u
                  (i32.load
                   (i32.const 1060)
                  )
                  (get_local $11)
                 )
                 (call $_abort)
                 (block
                  (i32.store
                   (select
                    (tee_local $0
                     (i32.add
                      (get_local $11)
                      (i32.const 16)
                     )
                    )
                    (i32.add
                     (get_local $11)
                     (i32.const 20)
                    )
                    (i32.eq
                     (i32.load
                      (get_local $0)
                     )
                     (get_local $4)
                    )
                   )
                   (get_local $1)
                  )
                  (br_if $label$break$L78
                   (i32.eqz
                    (get_local $1)
                   )
                  )
                 )
                )
               )
               (if
                (i32.gt_u
                 (tee_local $3
                  (i32.load
                   (i32.const 1060)
                  )
                 )
                 (get_local $1)
                )
                (call $_abort)
               )
               (i32.store offset=24
                (get_local $1)
                (get_local $11)
               )
               (if
                (tee_local $0
                 (i32.load offset=16
                  (get_local $4)
                 )
                )
                (if
                 (i32.gt_u
                  (get_local $3)
                  (get_local $0)
                 )
                 (call $_abort)
                 (block
                  (i32.store offset=16
                   (get_local $1)
                   (get_local $0)
                  )
                  (i32.store offset=24
                   (get_local $0)
                   (get_local $1)
                  )
                 )
                )
               )
               (if
                (tee_local $0
                 (i32.load offset=20
                  (get_local $4)
                 )
                )
                (if
                 (i32.gt_u
                  (i32.load
                   (i32.const 1060)
                  )
                  (get_local $0)
                 )
                 (call $_abort)
                 (block
                  (i32.store offset=20
                   (get_local $1)
                   (get_local $0)
                  )
                  (i32.store offset=24
                   (get_local $0)
                   (get_local $1)
                  )
                 )
                )
               )
              )
             )
            )
            (if
             (i32.lt_u
              (get_local $10)
              (i32.const 16)
             )
             (block
              (i32.store offset=4
               (get_local $4)
               (i32.or
                (tee_local $0
                 (i32.add
                  (get_local $10)
                  (get_local $2)
                 )
                )
                (i32.const 3)
               )
              )
              (i32.store
               (tee_local $0
                (i32.add
                 (i32.add
                  (get_local $4)
                  (get_local $0)
                 )
                 (i32.const 4)
                )
               )
               (i32.or
                (i32.load
                 (get_local $0)
                )
                (i32.const 1)
               )
              )
             )
             (block
              (i32.store offset=4
               (get_local $4)
               (i32.or
                (get_local $2)
                (i32.const 3)
               )
              )
              (i32.store offset=4
               (get_local $8)
               (i32.or
                (get_local $10)
                (i32.const 1)
               )
              )
              (i32.store
               (i32.add
                (get_local $8)
                (get_local $10)
               )
               (get_local $10)
              )
              (if
               (get_local $13)
               (block
                (set_local $2
                 (i32.load
                  (i32.const 1064)
                 )
                )
                (set_local $0
                 (i32.add
                  (i32.shl
                   (tee_local $3
                    (i32.shr_u
                     (get_local $13)
                     (i32.const 3)
                    )
                   )
                   (i32.const 3)
                  )
                  (i32.const 1084)
                 )
                )
                (if
                 (i32.and
                  (tee_local $3
                   (i32.shl
                    (i32.const 1)
                    (get_local $3)
                   )
                  )
                  (get_local $7)
                 )
                 (if
                  (i32.gt_u
                   (i32.load
                    (i32.const 1060)
                   )
                   (tee_local $1
                    (i32.load
                     (tee_local $3
                      (i32.add
                       (get_local $0)
                       (i32.const 8)
                      )
                     )
                    )
                   )
                  )
                  (call $_abort)
                  (block
                   (set_local $5
                    (get_local $1)
                   )
                   (set_local $16
                    (get_local $3)
                   )
                  )
                 )
                 (block
                  (i32.store
                   (i32.const 1044)
                   (i32.or
                    (get_local $3)
                    (get_local $7)
                   )
                  )
                  (set_local $5
                   (get_local $0)
                  )
                  (set_local $16
                   (i32.add
                    (get_local $0)
                    (i32.const 8)
                   )
                  )
                 )
                )
                (i32.store
                 (get_local $16)
                 (get_local $2)
                )
                (i32.store offset=12
                 (get_local $5)
                 (get_local $2)
                )
                (i32.store offset=8
                 (get_local $2)
                 (get_local $5)
                )
                (i32.store offset=12
                 (get_local $2)
                 (get_local $0)
                )
               )
              )
              (i32.store
               (i32.const 1052)
               (get_local $10)
              )
              (i32.store
               (i32.const 1064)
               (get_local $8)
              )
             )
            )
            (set_global $STACKTOP
             (get_local $14)
            )
            (return
             (i32.add
              (get_local $4)
              (i32.const 8)
             )
            )
           )
           (get_local $2)
          )
         )
         (get_local $2)
        )
       )
       (if (result i32)
        (i32.gt_u
         (get_local $0)
         (i32.const -65)
        )
        (i32.const -1)
        (block (result i32)
         (set_local $4
          (i32.and
           (tee_local $0
            (i32.add
             (get_local $0)
             (i32.const 11)
            )
           )
           (i32.const -8)
          )
         )
         (if (result i32)
          (tee_local $6
           (i32.load
            (i32.const 1048)
           )
          )
          (block (result i32)
           (set_local $18
            (if (result i32)
             (tee_local $0
              (i32.shr_u
               (get_local $0)
               (i32.const 8)
              )
             )
             (if (result i32)
              (i32.gt_u
               (get_local $4)
               (i32.const 16777215)
              )
              (i32.const 31)
              (i32.or
               (i32.and
                (i32.shr_u
                 (get_local $4)
                 (i32.add
                  (tee_local $0
                   (i32.add
                    (i32.sub
                     (i32.const 14)
                     (i32.or
                      (i32.or
                       (tee_local $2
                        (i32.and
                         (i32.shr_u
                          (i32.add
                           (tee_local $1
                            (i32.shl
                             (get_local $0)
                             (tee_local $0
                              (i32.and
                               (i32.shr_u
                                (i32.add
                                 (get_local $0)
                                 (i32.const 1048320)
                                )
                                (i32.const 16)
                               )
                               (i32.const 8)
                              )
                             )
                            )
                           )
                           (i32.const 520192)
                          )
                          (i32.const 16)
                         )
                         (i32.const 4)
                        )
                       )
                       (get_local $0)
                      )
                      (tee_local $1
                       (i32.and
                        (i32.shr_u
                         (i32.add
                          (tee_local $0
                           (i32.shl
                            (get_local $1)
                            (get_local $2)
                           )
                          )
                          (i32.const 245760)
                         )
                         (i32.const 16)
                        )
                        (i32.const 2)
                       )
                      )
                     )
                    )
                    (i32.shr_u
                     (i32.shl
                      (get_local $0)
                      (get_local $1)
                     )
                     (i32.const 15)
                    )
                   )
                  )
                  (i32.const 7)
                 )
                )
                (i32.const 1)
               )
               (i32.shl
                (get_local $0)
                (i32.const 1)
               )
              )
             )
             (i32.const 0)
            )
           )
           (set_local $2
            (i32.sub
             (i32.const 0)
             (get_local $4)
            )
           )
           (block $__rjto$1
            (block $__rjti$1
             (if
              (tee_local $0
               (i32.load
                (i32.add
                 (i32.shl
                  (get_local $18)
                  (i32.const 2)
                 )
                 (i32.const 1348)
                )
               )
              )
              (block
               (set_local $1
                (i32.const 0)
               )
               (set_local $12
                (i32.shl
                 (get_local $4)
                 (select
                  (i32.const 0)
                  (i32.sub
                   (i32.const 25)
                   (i32.shr_u
                    (get_local $18)
                    (i32.const 1)
                   )
                  )
                  (i32.eq
                   (get_local $18)
                   (i32.const 31)
                  )
                 )
                )
               )
               (loop $while-in15
                (if
                 (i32.lt_u
                  (tee_local $16
                   (i32.sub
                    (i32.and
                     (i32.load offset=4
                      (get_local $0)
                     )
                     (i32.const -8)
                    )
                    (get_local $4)
                   )
                  )
                  (get_local $2)
                 )
                 (set_local $1
                  (if (result i32)
                   (get_local $16)
                   (block (result i32)
                    (set_local $2
                     (get_local $16)
                    )
                    (get_local $0)
                   )
                   (block
                    (set_local $2
                     (i32.const 0)
                    )
                    (set_local $1
                     (get_local $0)
                    )
                    (br $__rjti$1)
                   )
                  )
                 )
                )
                (set_local $5
                 (select
                  (get_local $5)
                  (tee_local $5
                   (i32.load offset=20
                    (get_local $0)
                   )
                  )
                  (i32.or
                   (i32.eqz
                    (get_local $5)
                   )
                   (i32.eq
                    (get_local $5)
                    (tee_local $0
                     (i32.load
                      (i32.add
                       (i32.add
                        (get_local $0)
                        (i32.const 16)
                       )
                       (i32.shl
                        (i32.shr_u
                         (get_local $12)
                         (i32.const 31)
                        )
                        (i32.const 2)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                )
                (set_local $12
                 (i32.shl
                  (get_local $12)
                  (i32.const 1)
                 )
                )
                (br_if $while-in15
                 (get_local $0)
                )
               )
               (set_local $0
                (get_local $1)
               )
              )
              (set_local $0
               (i32.const 0)
              )
             )
             (br_if $__rjti$1
              (tee_local $1
               (if (result i32)
                (i32.or
                 (get_local $5)
                 (get_local $0)
                )
                (get_local $5)
                (block (result i32)
                 (drop
                  (br_if $do-once
                   (get_local $4)
                   (i32.eqz
                    (tee_local $0
                     (i32.and
                      (i32.or
                       (tee_local $0
                        (i32.shl
                         (i32.const 2)
                         (get_local $18)
                        )
                       )
                       (i32.sub
                        (i32.const 0)
                        (get_local $0)
                       )
                      )
                      (get_local $6)
                     )
                    )
                   )
                  )
                 )
                 (set_local $1
                  (i32.and
                   (i32.shr_u
                    (tee_local $5
                     (i32.add
                      (i32.and
                       (get_local $0)
                       (i32.sub
                        (i32.const 0)
                        (get_local $0)
                       )
                      )
                      (i32.const -1)
                     )
                    )
                    (i32.const 12)
                   )
                   (i32.const 16)
                  )
                 )
                 (set_local $0
                  (i32.const 0)
                 )
                 (i32.load
                  (i32.add
                   (i32.shl
                    (i32.add
                     (i32.or
                      (i32.or
                       (i32.or
                        (i32.or
                         (tee_local $12
                          (i32.and
                           (i32.shr_u
                            (tee_local $5
                             (i32.shr_u
                              (get_local $5)
                              (get_local $1)
                             )
                            )
                            (i32.const 5)
                           )
                           (i32.const 8)
                          )
                         )
                         (get_local $1)
                        )
                        (tee_local $5
                         (i32.and
                          (i32.shr_u
                           (tee_local $1
                            (i32.shr_u
                             (get_local $5)
                             (get_local $12)
                            )
                           )
                           (i32.const 2)
                          )
                          (i32.const 4)
                         )
                        )
                       )
                       (tee_local $5
                        (i32.and
                         (i32.shr_u
                          (tee_local $1
                           (i32.shr_u
                            (get_local $1)
                            (get_local $5)
                           )
                          )
                          (i32.const 1)
                         )
                         (i32.const 2)
                        )
                       )
                      )
                      (tee_local $5
                       (i32.and
                        (i32.shr_u
                         (tee_local $1
                          (i32.shr_u
                           (get_local $1)
                           (get_local $5)
                          )
                         )
                         (i32.const 1)
                        )
                        (i32.const 1)
                       )
                      )
                     )
                     (i32.shr_u
                      (get_local $1)
                      (get_local $5)
                     )
                    )
                    (i32.const 2)
                   )
                   (i32.const 1348)
                  )
                 )
                )
               )
              )
             )
             (set_local $5
              (get_local $0)
             )
             (br $__rjto$1)
            )
            (set_local $5
             (get_local $0)
            )
            (set_local $0
             (get_local $2)
            )
            (loop $while-in17
             (set_local $12
              (i32.load offset=4
               (get_local $1)
              )
             )
             (if
              (i32.eqz
               (tee_local $2
                (i32.load offset=16
                 (get_local $1)
                )
               )
              )
              (set_local $2
               (i32.load offset=20
                (get_local $1)
               )
              )
             )
             (set_local $12
              (i32.lt_u
               (tee_local $16
                (i32.sub
                 (i32.and
                  (get_local $12)
                  (i32.const -8)
                 )
                 (get_local $4)
                )
               )
               (get_local $0)
              )
             )
             (set_local $0
              (select
               (get_local $16)
               (get_local $0)
               (get_local $12)
              )
             )
             (set_local $5
              (select
               (get_local $1)
               (get_local $5)
               (get_local $12)
              )
             )
             (set_local $2
              (if (result i32)
               (get_local $2)
               (block
                (set_local $1
                 (get_local $2)
                )
                (br $while-in17)
               )
               (get_local $0)
              )
             )
            )
           )
           (if (result i32)
            (get_local $5)
            (if (result i32)
             (i32.lt_u
              (get_local $2)
              (i32.sub
               (i32.load
                (i32.const 1052)
               )
               (get_local $4)
              )
             )
             (block
              (if
               (i32.gt_u
                (tee_local $17
                 (i32.load
                  (i32.const 1060)
                 )
                )
                (get_local $5)
               )
               (call $_abort)
              )
              (if
               (i32.le_u
                (tee_local $8
                 (i32.add
                  (get_local $5)
                  (get_local $4)
                 )
                )
                (get_local $5)
               )
               (call $_abort)
              )
              (set_local $15
               (i32.load offset=24
                (get_local $5)
               )
              )
              (block $do-once18
               (if
                (i32.eq
                 (tee_local $0
                  (i32.load offset=12
                   (get_local $5)
                  )
                 )
                 (get_local $5)
                )
                (block
                 (if
                  (i32.eqz
                   (tee_local $0
                    (i32.load
                     (tee_local $1
                      (i32.add
                       (get_local $5)
                       (i32.const 20)
                      )
                     )
                    )
                   )
                  )
                  (br_if $do-once18
                   (i32.eqz
                    (tee_local $0
                     (i32.load
                      (tee_local $1
                       (i32.add
                        (get_local $5)
                        (i32.const 16)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                 (loop $while-in21
                  (block $while-out20
                   (if
                    (i32.eqz
                     (tee_local $11
                      (i32.load
                       (tee_local $9
                        (i32.add
                         (get_local $0)
                         (i32.const 20)
                        )
                       )
                      )
                     )
                    )
                    (br_if $while-out20
                     (i32.eqz
                      (tee_local $11
                       (i32.load
                        (tee_local $9
                         (i32.add
                          (get_local $0)
                          (i32.const 16)
                         )
                        )
                       )
                      )
                     )
                    )
                   )
                   (set_local $1
                    (get_local $9)
                   )
                   (set_local $0
                    (get_local $11)
                   )
                   (br $while-in21)
                  )
                 )
                 (if
                  (i32.gt_u
                   (get_local $17)
                   (get_local $1)
                  )
                  (call $_abort)
                  (block
                   (i32.store
                    (get_local $1)
                    (i32.const 0)
                   )
                   (set_local $7
                    (get_local $0)
                   )
                  )
                 )
                )
                (block
                 (if
                  (i32.gt_u
                   (get_local $17)
                   (tee_local $1
                    (i32.load offset=8
                     (get_local $5)
                    )
                   )
                  )
                  (call $_abort)
                 )
                 (if
                  (i32.ne
                   (i32.load
                    (tee_local $9
                     (i32.add
                      (get_local $1)
                      (i32.const 12)
                     )
                    )
                   )
                   (get_local $5)
                  )
                  (call $_abort)
                 )
                 (if
                  (i32.eq
                   (i32.load
                    (tee_local $11
                     (i32.add
                      (get_local $0)
                      (i32.const 8)
                     )
                    )
                   )
                   (get_local $5)
                  )
                  (block
                   (i32.store
                    (get_local $9)
                    (get_local $0)
                   )
                   (i32.store
                    (get_local $11)
                    (get_local $1)
                   )
                   (set_local $7
                    (get_local $0)
                   )
                  )
                  (call $_abort)
                 )
                )
               )
              )
              (block $label$break$L176
               (if
                (get_local $15)
                (block
                 (if
                  (i32.eq
                   (get_local $5)
                   (i32.load
                    (tee_local $1
                     (i32.add
                      (i32.shl
                       (tee_local $0
                        (i32.load offset=28
                         (get_local $5)
                        )
                       )
                       (i32.const 2)
                      )
                      (i32.const 1348)
                     )
                    )
                   )
                  )
                  (block
                   (i32.store
                    (get_local $1)
                    (get_local $7)
                   )
                   (if
                    (i32.eqz
                     (get_local $7)
                    )
                    (block
                     (i32.store
                      (i32.const 1048)
                      (tee_local $3
                       (i32.and
                        (get_local $6)
                        (i32.xor
                         (i32.shl
                          (i32.const 1)
                          (get_local $0)
                         )
                         (i32.const -1)
                        )
                       )
                      )
                     )
                     (br $label$break$L176)
                    )
                   )
                  )
                  (if
                   (i32.gt_u
                    (i32.load
                     (i32.const 1060)
                    )
                    (get_local $15)
                   )
                   (call $_abort)
                   (block
                    (i32.store
                     (select
                      (tee_local $0
                       (i32.add
                        (get_local $15)
                        (i32.const 16)
                       )
                      )
                      (i32.add
                       (get_local $15)
                       (i32.const 20)
                      )
                      (i32.eq
                       (i32.load
                        (get_local $0)
                       )
                       (get_local $5)
                      )
                     )
                     (get_local $7)
                    )
                    (if
                     (i32.eqz
                      (get_local $7)
                     )
                     (block
                      (set_local $3
                       (get_local $6)
                      )
                      (br $label$break$L176)
                     )
                    )
                   )
                  )
                 )
                 (if
                  (i32.gt_u
                   (tee_local $1
                    (i32.load
                     (i32.const 1060)
                    )
                   )
                   (get_local $7)
                  )
                  (call $_abort)
                 )
                 (i32.store offset=24
                  (get_local $7)
                  (get_local $15)
                 )
                 (if
                  (tee_local $0
                   (i32.load offset=16
                    (get_local $5)
                   )
                  )
                  (if
                   (i32.gt_u
                    (get_local $1)
                    (get_local $0)
                   )
                   (call $_abort)
                   (block
                    (i32.store offset=16
                     (get_local $7)
                     (get_local $0)
                    )
                    (i32.store offset=24
                     (get_local $0)
                     (get_local $7)
                    )
                   )
                  )
                 )
                 (if
                  (tee_local $0
                   (i32.load offset=20
                    (get_local $5)
                   )
                  )
                  (if
                   (i32.gt_u
                    (i32.load
                     (i32.const 1060)
                    )
                    (get_local $0)
                   )
                   (call $_abort)
                   (block
                    (i32.store offset=20
                     (get_local $7)
                     (get_local $0)
                    )
                    (i32.store offset=24
                     (get_local $0)
                     (get_local $7)
                    )
                    (set_local $3
                     (get_local $6)
                    )
                   )
                  )
                  (set_local $3
                   (get_local $6)
                  )
                 )
                )
                (set_local $3
                 (get_local $6)
                )
               )
              )
              (block $label$break$L200
               (if
                (i32.lt_u
                 (get_local $2)
                 (i32.const 16)
                )
                (block
                 (i32.store offset=4
                  (get_local $5)
                  (i32.or
                   (tee_local $0
                    (i32.add
                     (get_local $2)
                     (get_local $4)
                    )
                   )
                   (i32.const 3)
                  )
                 )
                 (i32.store
                  (tee_local $0
                   (i32.add
                    (i32.add
                     (get_local $5)
                     (get_local $0)
                    )
                    (i32.const 4)
                   )
                  )
                  (i32.or
                   (i32.load
                    (get_local $0)
                   )
                   (i32.const 1)
                  )
                 )
                )
                (block
                 (i32.store offset=4
                  (get_local $5)
                  (i32.or
                   (get_local $4)
                   (i32.const 3)
                  )
                 )
                 (i32.store offset=4
                  (get_local $8)
                  (i32.or
                   (get_local $2)
                   (i32.const 1)
                  )
                 )
                 (i32.store
                  (i32.add
                   (get_local $8)
                   (get_local $2)
                  )
                  (get_local $2)
                 )
                 (set_local $1
                  (i32.shr_u
                   (get_local $2)
                   (i32.const 3)
                  )
                 )
                 (if
                  (i32.lt_u
                   (get_local $2)
                   (i32.const 256)
                  )
                  (block
                   (set_local $0
                    (i32.add
                     (i32.shl
                      (get_local $1)
                      (i32.const 3)
                     )
                     (i32.const 1084)
                    )
                   )
                   (if
                    (i32.and
                     (tee_local $3
                      (i32.load
                       (i32.const 1044)
                      )
                     )
                     (tee_local $1
                      (i32.shl
                       (i32.const 1)
                       (get_local $1)
                      )
                     )
                    )
                    (if
                     (i32.gt_u
                      (i32.load
                       (i32.const 1060)
                      )
                      (tee_local $1
                       (i32.load
                        (tee_local $3
                         (i32.add
                          (get_local $0)
                          (i32.const 8)
                         )
                        )
                       )
                      )
                     )
                     (call $_abort)
                     (block
                      (set_local $13
                       (get_local $1)
                      )
                      (set_local $19
                       (get_local $3)
                      )
                     )
                    )
                    (block
                     (i32.store
                      (i32.const 1044)
                      (i32.or
                       (get_local $3)
                       (get_local $1)
                      )
                     )
                     (set_local $13
                      (get_local $0)
                     )
                     (set_local $19
                      (i32.add
                       (get_local $0)
                       (i32.const 8)
                      )
                     )
                    )
                   )
                   (i32.store
                    (get_local $19)
                    (get_local $8)
                   )
                   (i32.store offset=12
                    (get_local $13)
                    (get_local $8)
                   )
                   (i32.store offset=8
                    (get_local $8)
                    (get_local $13)
                   )
                   (i32.store offset=12
                    (get_local $8)
                    (get_local $0)
                   )
                   (br $label$break$L200)
                  )
                 )
                 (set_local $0
                  (i32.add
                   (i32.shl
                    (tee_local $1
                     (if (result i32)
                      (tee_local $0
                       (i32.shr_u
                        (get_local $2)
                        (i32.const 8)
                       )
                      )
                      (if (result i32)
                       (i32.gt_u
                        (get_local $2)
                        (i32.const 16777215)
                       )
                       (i32.const 31)
                       (i32.or
                        (i32.and
                         (i32.shr_u
                          (get_local $2)
                          (i32.add
                           (tee_local $0
                            (i32.add
                             (i32.sub
                              (i32.const 14)
                              (i32.or
                               (i32.or
                                (tee_local $4
                                 (i32.and
                                  (i32.shr_u
                                   (i32.add
                                    (tee_local $1
                                     (i32.shl
                                      (get_local $0)
                                      (tee_local $0
                                       (i32.and
                                        (i32.shr_u
                                         (i32.add
                                          (get_local $0)
                                          (i32.const 1048320)
                                         )
                                         (i32.const 16)
                                        )
                                        (i32.const 8)
                                       )
                                      )
                                     )
                                    )
                                    (i32.const 520192)
                                   )
                                   (i32.const 16)
                                  )
                                  (i32.const 4)
                                 )
                                )
                                (get_local $0)
                               )
                               (tee_local $1
                                (i32.and
                                 (i32.shr_u
                                  (i32.add
                                   (tee_local $0
                                    (i32.shl
                                     (get_local $1)
                                     (get_local $4)
                                    )
                                   )
                                   (i32.const 245760)
                                  )
                                  (i32.const 16)
                                 )
                                 (i32.const 2)
                                )
                               )
                              )
                             )
                             (i32.shr_u
                              (i32.shl
                               (get_local $0)
                               (get_local $1)
                              )
                              (i32.const 15)
                             )
                            )
                           )
                           (i32.const 7)
                          )
                         )
                         (i32.const 1)
                        )
                        (i32.shl
                         (get_local $0)
                         (i32.const 1)
                        )
                       )
                      )
                      (i32.const 0)
                     )
                    )
                    (i32.const 2)
                   )
                   (i32.const 1348)
                  )
                 )
                 (i32.store offset=28
                  (get_local $8)
                  (get_local $1)
                 )
                 (i32.store offset=4
                  (tee_local $4
                   (i32.add
                    (get_local $8)
                    (i32.const 16)
                   )
                  )
                  (i32.const 0)
                 )
                 (i32.store
                  (get_local $4)
                  (i32.const 0)
                 )
                 (if
                  (i32.eqz
                   (i32.and
                    (get_local $3)
                    (tee_local $4
                     (i32.shl
                      (i32.const 1)
                      (get_local $1)
                     )
                    )
                   )
                  )
                  (block
                   (i32.store
                    (i32.const 1048)
                    (i32.or
                     (get_local $3)
                     (get_local $4)
                    )
                   )
                   (i32.store
                    (get_local $0)
                    (get_local $8)
                   )
                   (i32.store offset=24
                    (get_local $8)
                    (get_local $0)
                   )
                   (i32.store offset=12
                    (get_local $8)
                    (get_local $8)
                   )
                   (i32.store offset=8
                    (get_local $8)
                    (get_local $8)
                   )
                   (br $label$break$L200)
                  )
                 )
                 (block $label$break$L218
                  (if
                   (i32.eq
                    (i32.and
                     (i32.load offset=4
                      (tee_local $0
                       (i32.load
                        (get_local $0)
                       )
                      )
                     )
                     (i32.const -8)
                    )
                    (get_local $2)
                   )
                   (set_local $10
                    (get_local $0)
                   )
                   (block
                    (set_local $1
                     (i32.shl
                      (get_local $2)
                      (select
                       (i32.const 0)
                       (i32.sub
                        (i32.const 25)
                        (i32.shr_u
                         (get_local $1)
                         (i32.const 1)
                        )
                       )
                       (i32.eq
                        (get_local $1)
                        (i32.const 31)
                       )
                      )
                     )
                    )
                    (loop $while-in30
                     (if
                      (tee_local $3
                       (i32.load
                        (tee_local $4
                         (i32.add
                          (i32.add
                           (get_local $0)
                           (i32.const 16)
                          )
                          (i32.shl
                           (i32.shr_u
                            (get_local $1)
                            (i32.const 31)
                           )
                           (i32.const 2)
                          )
                         )
                        )
                       )
                      )
                      (block
                       (set_local $1
                        (i32.shl
                         (get_local $1)
                         (i32.const 1)
                        )
                       )
                       (if
                        (i32.eq
                         (i32.and
                          (i32.load offset=4
                           (get_local $3)
                          )
                          (i32.const -8)
                         )
                         (get_local $2)
                        )
                        (block
                         (set_local $10
                          (get_local $3)
                         )
                         (br $label$break$L218)
                        )
                        (block
                         (set_local $0
                          (get_local $3)
                         )
                         (br $while-in30)
                        )
                       )
                      )
                     )
                    )
                    (if
                     (i32.gt_u
                      (i32.load
                       (i32.const 1060)
                      )
                      (get_local $4)
                     )
                     (call $_abort)
                     (block
                      (i32.store
                       (get_local $4)
                       (get_local $8)
                      )
                      (i32.store offset=24
                       (get_local $8)
                       (get_local $0)
                      )
                      (i32.store offset=12
                       (get_local $8)
                       (get_local $8)
                      )
                      (i32.store offset=8
                       (get_local $8)
                       (get_local $8)
                      )
                      (br $label$break$L200)
                     )
                    )
                   )
                  )
                 )
                 (if
                  (i32.and
                   (i32.le_u
                    (tee_local $3
                     (i32.load
                      (i32.const 1060)
                     )
                    )
                    (tee_local $0
                     (i32.load
                      (tee_local $1
                       (i32.add
                        (get_local $10)
                        (i32.const 8)
                       )
                      )
                     )
                    )
                   )
                   (i32.le_u
                    (get_local $3)
                    (get_local $10)
                   )
                  )
                  (block
                   (i32.store offset=12
                    (get_local $0)
                    (get_local $8)
                   )
                   (i32.store
                    (get_local $1)
                    (get_local $8)
                   )
                   (i32.store offset=8
                    (get_local $8)
                    (get_local $0)
                   )
                   (i32.store offset=12
                    (get_local $8)
                    (get_local $10)
                   )
                   (i32.store offset=24
                    (get_local $8)
                    (i32.const 0)
                   )
                  )
                  (call $_abort)
                 )
                )
               )
              )
              (set_global $STACKTOP
               (get_local $14)
              )
              (return
               (i32.add
                (get_local $5)
                (i32.const 8)
               )
              )
             )
             (get_local $4)
            )
            (get_local $4)
           )
          )
          (get_local $4)
         )
        )
       )
      )
     )
    )
    (if
     (i32.ge_u
      (tee_local $1
       (i32.load
        (i32.const 1052)
       )
      )
      (get_local $3)
     )
     (block
      (set_local $0
       (i32.load
        (i32.const 1064)
       )
      )
      (if
       (i32.gt_u
        (tee_local $2
         (i32.sub
          (get_local $1)
          (get_local $3)
         )
        )
        (i32.const 15)
       )
       (block
        (i32.store
         (i32.const 1064)
         (tee_local $4
          (i32.add
           (get_local $0)
           (get_local $3)
          )
         )
        )
        (i32.store
         (i32.const 1052)
         (get_local $2)
        )
        (i32.store offset=4
         (get_local $4)
         (i32.or
          (get_local $2)
          (i32.const 1)
         )
        )
        (i32.store
         (i32.add
          (get_local $0)
          (get_local $1)
         )
         (get_local $2)
        )
        (i32.store offset=4
         (get_local $0)
         (i32.or
          (get_local $3)
          (i32.const 3)
         )
        )
       )
       (block
        (i32.store
         (i32.const 1052)
         (i32.const 0)
        )
        (i32.store
         (i32.const 1064)
         (i32.const 0)
        )
        (i32.store offset=4
         (get_local $0)
         (i32.or
          (get_local $1)
          (i32.const 3)
         )
        )
        (i32.store
         (tee_local $3
          (i32.add
           (i32.add
            (get_local $0)
            (get_local $1)
           )
           (i32.const 4)
          )
         )
         (i32.or
          (i32.load
           (get_local $3)
          )
          (i32.const 1)
         )
        )
       )
      )
      (br $folding-inner1)
     )
    )
    (if
     (i32.gt_u
      (tee_local $1
       (i32.load
        (i32.const 1056)
       )
      )
      (get_local $3)
     )
     (block
      (i32.store
       (i32.const 1056)
       (tee_local $1
        (i32.sub
         (get_local $1)
         (get_local $3)
        )
       )
      )
      (br $folding-inner0)
     )
    )
    (if
     (i32.le_u
      (tee_local $4
       (i32.and
        (tee_local $5
         (i32.add
          (tee_local $0
           (if (result i32)
            (i32.load
             (i32.const 1516)
            )
            (i32.load
             (i32.const 1524)
            )
            (block (result i32)
             (i32.store
              (i32.const 1524)
              (i32.const 4096)
             )
             (i32.store
              (i32.const 1520)
              (i32.const 4096)
             )
             (i32.store
              (i32.const 1528)
              (i32.const -1)
             )
             (i32.store
              (i32.const 1532)
              (i32.const -1)
             )
             (i32.store
              (i32.const 1536)
              (i32.const 0)
             )
             (i32.store
              (i32.const 1488)
              (i32.const 0)
             )
             (i32.store
              (i32.const 1516)
              (i32.xor
               (i32.and
                (get_local $14)
                (i32.const -16)
               )
               (i32.const 1431655768)
              )
             )
             (i32.const 4096)
            )
           )
          )
          (tee_local $6
           (i32.add
            (get_local $3)
            (i32.const 47)
           )
          )
         )
        )
        (tee_local $7
         (i32.sub
          (i32.const 0)
          (get_local $0)
         )
        )
       )
      )
      (get_local $3)
     )
     (block
      (set_global $STACKTOP
       (get_local $14)
      )
      (return
       (i32.const 0)
      )
     )
    )
    (if
     (tee_local $0
      (i32.load
       (i32.const 1484)
      )
     )
     (if
      (i32.or
       (i32.le_u
        (tee_local $10
         (i32.add
          (tee_local $2
           (i32.load
            (i32.const 1476)
           )
          )
          (get_local $4)
         )
        )
        (get_local $2)
       )
       (i32.gt_u
        (get_local $10)
        (get_local $0)
       )
      )
      (block
       (set_global $STACKTOP
        (get_local $14)
       )
       (return
        (i32.const 0)
       )
      )
     )
    )
    (set_local $10
     (i32.add
      (get_local $3)
      (i32.const 48)
     )
    )
    (block $__rjto$7
     (block $__rjti$7
      (if
       (i32.and
        (i32.load
         (i32.const 1488)
        )
        (i32.const 4)
       )
       (set_local $1
        (i32.const 0)
       )
       (block
        (block $do-once37
         (block $__rjti$3
          (block $__rjti$2
           (br_if $__rjti$2
            (i32.eqz
             (tee_local $0
              (i32.load
               (i32.const 1068)
              )
             )
            )
           )
           (set_local $2
            (i32.const 1492)
           )
           (loop $while-in34
            (block $while-out33
             (if
              (i32.le_u
               (tee_local $13
                (i32.load
                 (get_local $2)
                )
               )
               (get_local $0)
              )
              (br_if $while-out33
               (i32.gt_u
                (i32.add
                 (get_local $13)
                 (i32.load offset=4
                  (get_local $2)
                 )
                )
                (get_local $0)
               )
              )
             )
             (br_if $while-in34
              (tee_local $2
               (i32.load offset=8
                (get_local $2)
               )
              )
             )
             (br $__rjti$2)
            )
           )
           (if
            (i32.lt_u
             (tee_local $1
              (i32.and
               (i32.sub
                (get_local $5)
                (get_local $1)
               )
               (get_local $7)
              )
             )
             (i32.const 2147483647)
            )
            (block
             (set_local $5
              (i32.add
               (get_local $2)
               (i32.const 4)
              )
             )
             (br_if $__rjti$3
              (i32.ne
               (tee_local $0
                (call $_sbrk
                 (get_local $1)
                )
               )
               (i32.add
                (i32.load
                 (get_local $2)
                )
                (i32.load
                 (get_local $5)
                )
               )
              )
             )
             (br_if $__rjti$7
              (i32.ne
               (get_local $0)
               (i32.const -1)
              )
             )
            )
            (set_local $1
             (i32.const 0)
            )
           )
           (br $do-once37)
          )
          (set_local $1
           (if (result i32)
            (i32.eq
             (tee_local $0
              (call $_sbrk
               (i32.const 0)
              )
             )
             (i32.const -1)
            )
            (i32.const 0)
            (block (result i32)
             (set_local $2
              (i32.add
               (tee_local $1
                (i32.add
                 (select
                  (i32.sub
                   (i32.and
                    (i32.add
                     (tee_local $2
                      (i32.add
                       (tee_local $1
                        (i32.load
                         (i32.const 1520)
                        )
                       )
                       (i32.const -1)
                      )
                     )
                     (get_local $0)
                    )
                    (i32.sub
                     (i32.const 0)
                     (get_local $1)
                    )
                   )
                   (get_local $0)
                  )
                  (i32.const 0)
                  (i32.and
                   (get_local $2)
                   (get_local $0)
                  )
                 )
                 (get_local $4)
                )
               )
               (tee_local $5
                (i32.load
                 (i32.const 1476)
                )
               )
              )
             )
             (if (result i32)
              (i32.and
               (i32.gt_u
                (get_local $1)
                (get_local $3)
               )
               (i32.lt_u
                (get_local $1)
                (i32.const 2147483647)
               )
              )
              (block
               (if
                (tee_local $7
                 (i32.load
                  (i32.const 1484)
                 )
                )
                (if
                 (i32.or
                  (i32.le_u
                   (get_local $2)
                   (get_local $5)
                  )
                  (i32.gt_u
                   (get_local $2)
                   (get_local $7)
                  )
                 )
                 (block
                  (set_local $1
                   (i32.const 0)
                  )
                  (br $do-once37)
                 )
                )
               )
               (br_if $__rjti$7
                (i32.eq
                 (tee_local $2
                  (call $_sbrk
                   (get_local $1)
                  )
                 )
                 (get_local $0)
                )
               )
               (set_local $0
                (get_local $2)
               )
               (br $__rjti$3)
              )
              (i32.const 0)
             )
            )
           )
          )
          (br $do-once37)
         )
         (if
          (i32.eqz
           (i32.and
            (i32.gt_u
             (get_local $10)
             (get_local $1)
            )
            (i32.and
             (i32.lt_u
              (get_local $1)
              (i32.const 2147483647)
             )
             (i32.ne
              (get_local $0)
              (i32.const -1)
             )
            )
           )
          )
          (if
           (i32.eq
            (get_local $0)
            (i32.const -1)
           )
           (block
            (set_local $1
             (i32.const 0)
            )
            (br $do-once37)
           )
           (br $__rjti$7)
          )
         )
         (br_if $__rjti$7
          (i32.ge_u
           (tee_local $2
            (i32.and
             (i32.add
              (i32.sub
               (get_local $6)
               (get_local $1)
              )
              (tee_local $2
               (i32.load
                (i32.const 1524)
               )
              )
             )
             (i32.sub
              (i32.const 0)
              (get_local $2)
             )
            )
           )
           (i32.const 2147483647)
          )
         )
         (set_local $6
          (i32.sub
           (i32.const 0)
           (get_local $1)
          )
         )
         (set_local $1
          (if (result i32)
           (i32.eq
            (call $_sbrk
             (get_local $2)
            )
            (i32.const -1)
           )
           (block (result i32)
            (drop
             (call $_sbrk
              (get_local $6)
             )
            )
            (i32.const 0)
           )
           (block
            (set_local $1
             (i32.add
              (get_local $2)
              (get_local $1)
             )
            )
            (br $__rjti$7)
           )
          )
         )
        )
        (i32.store
         (i32.const 1488)
         (i32.or
          (i32.load
           (i32.const 1488)
          )
          (i32.const 4)
         )
        )
       )
      )
      (if
       (i32.lt_u
        (get_local $4)
        (i32.const 2147483647)
       )
       (block
        (set_local $0
         (call $_sbrk
          (get_local $4)
         )
        )
        (set_local $4
         (i32.gt_u
          (tee_local $6
           (i32.sub
            (tee_local $2
             (call $_sbrk
              (i32.const 0)
             )
            )
            (get_local $0)
           )
          )
          (i32.add
           (get_local $3)
           (i32.const 40)
          )
         )
        )
        (set_local $1
         (select
          (get_local $6)
          (get_local $1)
          (get_local $4)
         )
        )
        (br_if $__rjti$7
         (i32.eqz
          (i32.or
           (i32.or
            (i32.eq
             (get_local $0)
             (i32.const -1)
            )
            (i32.xor
             (get_local $4)
             (i32.const 1)
            )
           )
           (i32.xor
            (i32.and
             (i32.lt_u
              (get_local $0)
              (get_local $2)
             )
             (i32.and
              (i32.ne
               (get_local $0)
               (i32.const -1)
              )
              (i32.ne
               (get_local $2)
               (i32.const -1)
              )
             )
            )
            (i32.const 1)
           )
          )
         )
        )
       )
      )
      (br $__rjto$7)
     )
     (i32.store
      (i32.const 1476)
      (tee_local $2
       (i32.add
        (i32.load
         (i32.const 1476)
        )
        (get_local $1)
       )
      )
     )
     (if
      (i32.gt_u
       (get_local $2)
       (i32.load
        (i32.const 1480)
       )
      )
      (i32.store
       (i32.const 1480)
       (get_local $2)
      )
     )
     (block $label$break$L294
      (if
       (tee_local $6
        (i32.load
         (i32.const 1068)
        )
       )
       (block
        (set_local $2
         (i32.const 1492)
        )
        (block $__rjto$4
         (block $__rjti$4
          (loop $while-in41
           (block $while-out40
            (br_if $__rjti$4
             (i32.eq
              (get_local $0)
              (i32.add
               (tee_local $4
                (i32.load
                 (get_local $2)
                )
               )
               (tee_local $5
                (i32.load offset=4
                 (get_local $2)
                )
               )
              )
             )
            )
            (br_if $while-in41
             (tee_local $2
              (i32.load offset=8
               (get_local $2)
              )
             )
            )
           )
          )
          (br $__rjto$4)
         )
         (set_local $7
          (i32.add
           (get_local $2)
           (i32.const 4)
          )
         )
         (if
          (i32.eqz
           (i32.and
            (i32.load offset=12
             (get_local $2)
            )
            (i32.const 8)
           )
          )
          (if
           (i32.and
            (i32.gt_u
             (get_local $0)
             (get_local $6)
            )
            (i32.le_u
             (get_local $4)
             (get_local $6)
            )
           )
           (block
            (i32.store
             (get_local $7)
             (i32.add
              (get_local $5)
              (get_local $1)
             )
            )
            (set_local $0
             (i32.add
              (get_local $6)
              (tee_local $2
               (select
                (i32.and
                 (i32.sub
                  (i32.const 0)
                  (tee_local $0
                   (i32.add
                    (get_local $6)
                    (i32.const 8)
                   )
                  )
                 )
                 (i32.const 7)
                )
                (i32.const 0)
                (i32.and
                 (get_local $0)
                 (i32.const 7)
                )
               )
              )
             )
            )
            (set_local $1
             (i32.sub
              (tee_local $4
               (i32.add
                (i32.load
                 (i32.const 1056)
                )
                (get_local $1)
               )
              )
              (get_local $2)
             )
            )
            (i32.store
             (i32.const 1068)
             (get_local $0)
            )
            (i32.store
             (i32.const 1056)
             (get_local $1)
            )
            (i32.store offset=4
             (get_local $0)
             (i32.or
              (get_local $1)
              (i32.const 1)
             )
            )
            (i32.store offset=4
             (i32.add
              (get_local $6)
              (get_local $4)
             )
             (i32.const 40)
            )
            (i32.store
             (i32.const 1072)
             (i32.load
              (i32.const 1532)
             )
            )
            (br $label$break$L294)
           )
          )
         )
        )
        (if
         (i32.lt_u
          (get_local $0)
          (tee_local $2
           (i32.load
            (i32.const 1060)
           )
          )
         )
         (block
          (i32.store
           (i32.const 1060)
           (get_local $0)
          )
          (set_local $2
           (get_local $0)
          )
         )
        )
        (set_local $5
         (i32.add
          (get_local $0)
          (get_local $1)
         )
        )
        (set_local $4
         (i32.const 1492)
        )
        (block $__rjto$5
         (block $__rjti$5
          (loop $while-in43
           (block $while-out42
            (br_if $__rjti$5
             (i32.eq
              (i32.load
               (get_local $4)
              )
              (get_local $5)
             )
            )
            (br_if $while-in43
             (tee_local $4
              (i32.load offset=8
               (get_local $4)
              )
             )
            )
           )
          )
          (br $__rjto$5)
         )
         (if
          (i32.eqz
           (i32.and
            (i32.load offset=12
             (get_local $4)
            )
            (i32.const 8)
           )
          )
          (block
           (i32.store
            (get_local $4)
            (get_local $0)
           )
           (i32.store
            (tee_local $4
             (i32.add
              (get_local $4)
              (i32.const 4)
             )
            )
            (i32.add
             (i32.load
              (get_local $4)
             )
             (get_local $1)
            )
           )
           (set_local $7
            (i32.add
             (tee_local $8
              (i32.add
               (get_local $0)
               (select
                (i32.and
                 (i32.sub
                  (i32.const 0)
                  (tee_local $0
                   (i32.add
                    (get_local $0)
                    (i32.const 8)
                   )
                  )
                 )
                 (i32.const 7)
                )
                (i32.const 0)
                (i32.and
                 (get_local $0)
                 (i32.const 7)
                )
               )
              )
             )
             (get_local $3)
            )
           )
           (set_local $4
            (i32.sub
             (i32.sub
              (tee_local $1
               (i32.add
                (get_local $5)
                (select
                 (i32.and
                  (i32.sub
                   (i32.const 0)
                   (tee_local $0
                    (i32.add
                     (get_local $5)
                     (i32.const 8)
                    )
                   )
                  )
                  (i32.const 7)
                 )
                 (i32.const 0)
                 (i32.and
                  (get_local $0)
                  (i32.const 7)
                 )
                )
               )
              )
              (get_local $8)
             )
             (get_local $3)
            )
           )
           (i32.store offset=4
            (get_local $8)
            (i32.or
             (get_local $3)
             (i32.const 3)
            )
           )
           (block $label$break$L317
            (if
             (i32.eq
              (get_local $6)
              (get_local $1)
             )
             (block
              (i32.store
               (i32.const 1056)
               (tee_local $0
                (i32.add
                 (i32.load
                  (i32.const 1056)
                 )
                 (get_local $4)
                )
               )
              )
              (i32.store
               (i32.const 1068)
               (get_local $7)
              )
              (i32.store offset=4
               (get_local $7)
               (i32.or
                (get_local $0)
                (i32.const 1)
               )
              )
             )
             (block
              (if
               (i32.eq
                (i32.load
                 (i32.const 1064)
                )
                (get_local $1)
               )
               (block
                (i32.store
                 (i32.const 1052)
                 (tee_local $0
                  (i32.add
                   (i32.load
                    (i32.const 1052)
                   )
                   (get_local $4)
                  )
                 )
                )
                (i32.store
                 (i32.const 1064)
                 (get_local $7)
                )
                (i32.store offset=4
                 (get_local $7)
                 (i32.or
                  (get_local $0)
                  (i32.const 1)
                 )
                )
                (i32.store
                 (i32.add
                  (get_local $7)
                  (get_local $0)
                 )
                 (get_local $0)
                )
                (br $label$break$L317)
               )
              )
              (set_local $2
               (if (result i32)
                (i32.eq
                 (i32.and
                  (tee_local $0
                   (i32.load offset=4
                    (get_local $1)
                   )
                  )
                  (i32.const 3)
                 )
                 (i32.const 1)
                )
                (block (result i32)
                 (set_local $13
                  (i32.and
                   (get_local $0)
                   (i32.const -8)
                  )
                 )
                 (set_local $5
                  (i32.shr_u
                   (get_local $0)
                   (i32.const 3)
                  )
                 )
                 (block $label$break$L325
                  (if
                   (i32.lt_u
                    (get_local $0)
                    (i32.const 256)
                   )
                   (block
                    (set_local $3
                     (i32.load offset=12
                      (get_local $1)
                     )
                    )
                    (block $do-once46
                     (if
                      (i32.ne
                       (tee_local $6
                        (i32.load offset=8
                         (get_local $1)
                        )
                       )
                       (tee_local $0
                        (i32.add
                         (i32.shl
                          (get_local $5)
                          (i32.const 3)
                         )
                         (i32.const 1084)
                        )
                       )
                      )
                      (block
                       (if
                        (i32.gt_u
                         (get_local $2)
                         (get_local $6)
                        )
                        (call $_abort)
                       )
                       (br_if $do-once46
                        (i32.eq
                         (i32.load offset=12
                          (get_local $6)
                         )
                         (get_local $1)
                        )
                       )
                       (call $_abort)
                      )
                     )
                    )
                    (if
                     (i32.eq
                      (get_local $3)
                      (get_local $6)
                     )
                     (block
                      (i32.store
                       (i32.const 1044)
                       (i32.and
                        (i32.load
                         (i32.const 1044)
                        )
                        (i32.xor
                         (i32.shl
                          (i32.const 1)
                          (get_local $5)
                         )
                         (i32.const -1)
                        )
                       )
                      )
                      (br $label$break$L325)
                     )
                    )
                    (block $do-once48
                     (if
                      (i32.eq
                       (get_local $3)
                       (get_local $0)
                      )
                      (set_local $20
                       (i32.add
                        (get_local $3)
                        (i32.const 8)
                       )
                      )
                      (block
                       (if
                        (i32.gt_u
                         (get_local $2)
                         (get_local $3)
                        )
                        (call $_abort)
                       )
                       (if
                        (i32.eq
                         (i32.load
                          (tee_local $0
                           (i32.add
                            (get_local $3)
                            (i32.const 8)
                           )
                          )
                         )
                         (get_local $1)
                        )
                        (block
                         (set_local $20
                          (get_local $0)
                         )
                         (br $do-once48)
                        )
                       )
                       (call $_abort)
                      )
                     )
                    )
                    (i32.store offset=12
                     (get_local $6)
                     (get_local $3)
                    )
                    (i32.store
                     (get_local $20)
                     (get_local $6)
                    )
                   )
                   (block
                    (set_local $10
                     (i32.load offset=24
                      (get_local $1)
                     )
                    )
                    (block $do-once50
                     (if
                      (i32.eq
                       (tee_local $0
                        (i32.load offset=12
                         (get_local $1)
                        )
                       )
                       (get_local $1)
                      )
                      (block
                       (if
                        (tee_local $0
                         (i32.load
                          (tee_local $6
                           (i32.add
                            (tee_local $3
                             (i32.add
                              (get_local $1)
                              (i32.const 16)
                             )
                            )
                            (i32.const 4)
                           )
                          )
                         )
                        )
                        (set_local $3
                         (get_local $6)
                        )
                        (br_if $do-once50
                         (i32.eqz
                          (tee_local $0
                           (i32.load
                            (get_local $3)
                           )
                          )
                         )
                        )
                       )
                       (loop $while-in53
                        (block $while-out52
                         (if
                          (i32.eqz
                           (tee_local $5
                            (i32.load
                             (tee_local $6
                              (i32.add
                               (get_local $0)
                               (i32.const 20)
                              )
                             )
                            )
                           )
                          )
                          (br_if $while-out52
                           (i32.eqz
                            (tee_local $5
                             (i32.load
                              (tee_local $6
                               (i32.add
                                (get_local $0)
                                (i32.const 16)
                               )
                              )
                             )
                            )
                           )
                          )
                         )
                         (set_local $3
                          (get_local $6)
                         )
                         (set_local $0
                          (get_local $5)
                         )
                         (br $while-in53)
                        )
                       )
                       (if
                        (i32.gt_u
                         (get_local $2)
                         (get_local $3)
                        )
                        (call $_abort)
                        (block
                         (i32.store
                          (get_local $3)
                          (i32.const 0)
                         )
                         (set_local $9
                          (get_local $0)
                         )
                        )
                       )
                      )
                      (block
                       (if
                        (i32.gt_u
                         (get_local $2)
                         (tee_local $3
                          (i32.load offset=8
                           (get_local $1)
                          )
                         )
                        )
                        (call $_abort)
                       )
                       (if
                        (i32.ne
                         (i32.load
                          (tee_local $2
                           (i32.add
                            (get_local $3)
                            (i32.const 12)
                           )
                          )
                         )
                         (get_local $1)
                        )
                        (call $_abort)
                       )
                       (if
                        (i32.eq
                         (i32.load
                          (tee_local $6
                           (i32.add
                            (get_local $0)
                            (i32.const 8)
                           )
                          )
                         )
                         (get_local $1)
                        )
                        (block
                         (i32.store
                          (get_local $2)
                          (get_local $0)
                         )
                         (i32.store
                          (get_local $6)
                          (get_local $3)
                         )
                         (set_local $9
                          (get_local $0)
                         )
                        )
                        (call $_abort)
                       )
                      )
                     )
                    )
                    (br_if $label$break$L325
                     (i32.eqz
                      (get_local $10)
                     )
                    )
                    (block $do-once54
                     (if
                      (i32.eq
                       (i32.load
                        (tee_local $3
                         (i32.add
                          (i32.shl
                           (tee_local $0
                            (i32.load offset=28
                             (get_local $1)
                            )
                           )
                           (i32.const 2)
                          )
                          (i32.const 1348)
                         )
                        )
                       )
                       (get_local $1)
                      )
                      (block
                       (i32.store
                        (get_local $3)
                        (get_local $9)
                       )
                       (br_if $do-once54
                        (get_local $9)
                       )
                       (i32.store
                        (i32.const 1048)
                        (i32.and
                         (i32.load
                          (i32.const 1048)
                         )
                         (i32.xor
                          (i32.shl
                           (i32.const 1)
                           (get_local $0)
                          )
                          (i32.const -1)
                         )
                        )
                       )
                       (br $label$break$L325)
                      )
                      (if
                       (i32.gt_u
                        (i32.load
                         (i32.const 1060)
                        )
                        (get_local $10)
                       )
                       (call $_abort)
                       (block
                        (i32.store
                         (select
                          (tee_local $0
                           (i32.add
                            (get_local $10)
                            (i32.const 16)
                           )
                          )
                          (i32.add
                           (get_local $10)
                           (i32.const 20)
                          )
                          (i32.eq
                           (i32.load
                            (get_local $0)
                           )
                           (get_local $1)
                          )
                         )
                         (get_local $9)
                        )
                        (br_if $label$break$L325
                         (i32.eqz
                          (get_local $9)
                         )
                        )
                       )
                      )
                     )
                    )
                    (if
                     (i32.gt_u
                      (tee_local $3
                       (i32.load
                        (i32.const 1060)
                       )
                      )
                      (get_local $9)
                     )
                     (call $_abort)
                    )
                    (i32.store offset=24
                     (get_local $9)
                     (get_local $10)
                    )
                    (if
                     (tee_local $0
                      (i32.load
                       (tee_local $2
                        (i32.add
                         (get_local $1)
                         (i32.const 16)
                        )
                       )
                      )
                     )
                     (if
                      (i32.gt_u
                       (get_local $3)
                       (get_local $0)
                      )
                      (call $_abort)
                      (block
                       (i32.store offset=16
                        (get_local $9)
                        (get_local $0)
                       )
                       (i32.store offset=24
                        (get_local $0)
                        (get_local $9)
                       )
                      )
                     )
                    )
                    (br_if $label$break$L325
                     (i32.eqz
                      (tee_local $0
                       (i32.load offset=4
                        (get_local $2)
                       )
                      )
                     )
                    )
                    (if
                     (i32.gt_u
                      (i32.load
                       (i32.const 1060)
                      )
                      (get_local $0)
                     )
                     (call $_abort)
                     (block
                      (i32.store offset=20
                       (get_local $9)
                       (get_local $0)
                      )
                      (i32.store offset=24
                       (get_local $0)
                       (get_local $9)
                      )
                     )
                    )
                   )
                  )
                 )
                 (set_local $1
                  (i32.add
                   (get_local $1)
                   (get_local $13)
                  )
                 )
                 (i32.add
                  (get_local $13)
                  (get_local $4)
                 )
                )
                (get_local $4)
               )
              )
              (i32.store
               (tee_local $0
                (i32.add
                 (get_local $1)
                 (i32.const 4)
                )
               )
               (i32.and
                (i32.load
                 (get_local $0)
                )
                (i32.const -2)
               )
              )
              (i32.store offset=4
               (get_local $7)
               (i32.or
                (get_local $2)
                (i32.const 1)
               )
              )
              (i32.store
               (i32.add
                (get_local $7)
                (get_local $2)
               )
               (get_local $2)
              )
              (set_local $3
               (i32.shr_u
                (get_local $2)
                (i32.const 3)
               )
              )
              (if
               (i32.lt_u
                (get_local $2)
                (i32.const 256)
               )
               (block
                (set_local $0
                 (i32.add
                  (i32.shl
                   (get_local $3)
                   (i32.const 3)
                  )
                  (i32.const 1084)
                 )
                )
                (block $do-once58
                 (if
                  (i32.and
                   (tee_local $1
                    (i32.load
                     (i32.const 1044)
                    )
                   )
                   (tee_local $3
                    (i32.shl
                     (i32.const 1)
                     (get_local $3)
                    )
                   )
                  )
                  (block
                   (if
                    (i32.le_u
                     (i32.load
                      (i32.const 1060)
                     )
                     (tee_local $1
                      (i32.load
                       (tee_local $3
                        (i32.add
                         (get_local $0)
                         (i32.const 8)
                        )
                       )
                      )
                     )
                    )
                    (block
                     (set_local $15
                      (get_local $1)
                     )
                     (set_local $21
                      (get_local $3)
                     )
                     (br $do-once58)
                    )
                   )
                   (call $_abort)
                  )
                  (block
                   (i32.store
                    (i32.const 1044)
                    (i32.or
                     (get_local $1)
                     (get_local $3)
                    )
                   )
                   (set_local $15
                    (get_local $0)
                   )
                   (set_local $21
                    (i32.add
                     (get_local $0)
                     (i32.const 8)
                    )
                   )
                  )
                 )
                )
                (i32.store
                 (get_local $21)
                 (get_local $7)
                )
                (i32.store offset=12
                 (get_local $15)
                 (get_local $7)
                )
                (i32.store offset=8
                 (get_local $7)
                 (get_local $15)
                )
                (i32.store offset=12
                 (get_local $7)
                 (get_local $0)
                )
                (br $label$break$L317)
               )
              )
              (set_local $0
               (i32.add
                (i32.shl
                 (tee_local $3
                  (block $do-once60 (result i32)
                   (if (result i32)
                    (tee_local $0
                     (i32.shr_u
                      (get_local $2)
                      (i32.const 8)
                     )
                    )
                    (block (result i32)
                     (drop
                      (br_if $do-once60
                       (i32.const 31)
                       (i32.gt_u
                        (get_local $2)
                        (i32.const 16777215)
                       )
                      )
                     )
                     (i32.or
                      (i32.and
                       (i32.shr_u
                        (get_local $2)
                        (i32.add
                         (tee_local $0
                          (i32.add
                           (i32.sub
                            (i32.const 14)
                            (i32.or
                             (i32.or
                              (tee_local $1
                               (i32.and
                                (i32.shr_u
                                 (i32.add
                                  (tee_local $3
                                   (i32.shl
                                    (get_local $0)
                                    (tee_local $0
                                     (i32.and
                                      (i32.shr_u
                                       (i32.add
                                        (get_local $0)
                                        (i32.const 1048320)
                                       )
                                       (i32.const 16)
                                      )
                                      (i32.const 8)
                                     )
                                    )
                                   )
                                  )
                                  (i32.const 520192)
                                 )
                                 (i32.const 16)
                                )
                                (i32.const 4)
                               )
                              )
                              (get_local $0)
                             )
                             (tee_local $3
                              (i32.and
                               (i32.shr_u
                                (i32.add
                                 (tee_local $0
                                  (i32.shl
                                   (get_local $3)
                                   (get_local $1)
                                  )
                                 )
                                 (i32.const 245760)
                                )
                                (i32.const 16)
                               )
                               (i32.const 2)
                              )
                             )
                            )
                           )
                           (i32.shr_u
                            (i32.shl
                             (get_local $0)
                             (get_local $3)
                            )
                            (i32.const 15)
                           )
                          )
                         )
                         (i32.const 7)
                        )
                       )
                       (i32.const 1)
                      )
                      (i32.shl
                       (get_local $0)
                       (i32.const 1)
                      )
                     )
                    )
                    (i32.const 0)
                   )
                  )
                 )
                 (i32.const 2)
                )
                (i32.const 1348)
               )
              )
              (i32.store offset=28
               (get_local $7)
               (get_local $3)
              )
              (i32.store offset=4
               (tee_local $1
                (i32.add
                 (get_local $7)
                 (i32.const 16)
                )
               )
               (i32.const 0)
              )
              (i32.store
               (get_local $1)
               (i32.const 0)
              )
              (if
               (i32.eqz
                (i32.and
                 (tee_local $1
                  (i32.load
                   (i32.const 1048)
                  )
                 )
                 (tee_local $4
                  (i32.shl
                   (i32.const 1)
                   (get_local $3)
                  )
                 )
                )
               )
               (block
                (i32.store
                 (i32.const 1048)
                 (i32.or
                  (get_local $1)
                  (get_local $4)
                 )
                )
                (i32.store
                 (get_local $0)
                 (get_local $7)
                )
                (i32.store offset=24
                 (get_local $7)
                 (get_local $0)
                )
                (i32.store offset=12
                 (get_local $7)
                 (get_local $7)
                )
                (i32.store offset=8
                 (get_local $7)
                 (get_local $7)
                )
                (br $label$break$L317)
               )
              )
              (block $label$break$L410
               (if
                (i32.eq
                 (i32.and
                  (i32.load offset=4
                   (tee_local $0
                    (i32.load
                     (get_local $0)
                    )
                   )
                  )
                  (i32.const -8)
                 )
                 (get_local $2)
                )
                (set_local $11
                 (get_local $0)
                )
                (block
                 (set_local $1
                  (i32.shl
                   (get_local $2)
                   (select
                    (i32.const 0)
                    (i32.sub
                     (i32.const 25)
                     (i32.shr_u
                      (get_local $3)
                      (i32.const 1)
                     )
                    )
                    (i32.eq
                     (get_local $3)
                     (i32.const 31)
                    )
                   )
                  )
                 )
                 (loop $while-in64
                  (if
                   (tee_local $3
                    (i32.load
                     (tee_local $4
                      (i32.add
                       (i32.add
                        (get_local $0)
                        (i32.const 16)
                       )
                       (i32.shl
                        (i32.shr_u
                         (get_local $1)
                         (i32.const 31)
                        )
                        (i32.const 2)
                       )
                      )
                     )
                    )
                   )
                   (block
                    (set_local $1
                     (i32.shl
                      (get_local $1)
                      (i32.const 1)
                     )
                    )
                    (if
                     (i32.eq
                      (i32.and
                       (i32.load offset=4
                        (get_local $3)
                       )
                       (i32.const -8)
                      )
                      (get_local $2)
                     )
                     (block
                      (set_local $11
                       (get_local $3)
                      )
                      (br $label$break$L410)
                     )
                     (block
                      (set_local $0
                       (get_local $3)
                      )
                      (br $while-in64)
                     )
                    )
                   )
                  )
                 )
                 (if
                  (i32.gt_u
                   (i32.load
                    (i32.const 1060)
                   )
                   (get_local $4)
                  )
                  (call $_abort)
                  (block
                   (i32.store
                    (get_local $4)
                    (get_local $7)
                   )
                   (i32.store offset=24
                    (get_local $7)
                    (get_local $0)
                   )
                   (i32.store offset=12
                    (get_local $7)
                    (get_local $7)
                   )
                   (i32.store offset=8
                    (get_local $7)
                    (get_local $7)
                   )
                   (br $label$break$L317)
                  )
                 )
                )
               )
              )
              (if
               (i32.and
                (i32.le_u
                 (tee_local $3
                  (i32.load
                   (i32.const 1060)
                  )
                 )
                 (tee_local $0
                  (i32.load
                   (tee_local $1
                    (i32.add
                     (get_local $11)
                     (i32.const 8)
                    )
                   )
                  )
                 )
                )
                (i32.le_u
                 (get_local $3)
                 (get_local $11)
                )
               )
               (block
                (i32.store offset=12
                 (get_local $0)
                 (get_local $7)
                )
                (i32.store
                 (get_local $1)
                 (get_local $7)
                )
                (i32.store offset=8
                 (get_local $7)
                 (get_local $0)
                )
                (i32.store offset=12
                 (get_local $7)
                 (get_local $11)
                )
                (i32.store offset=24
                 (get_local $7)
                 (i32.const 0)
                )
               )
               (call $_abort)
              )
             )
            )
           )
           (set_global $STACKTOP
            (get_local $14)
           )
           (return
            (i32.add
             (get_local $8)
             (i32.const 8)
            )
           )
          )
         )
        )
        (set_local $2
         (i32.const 1492)
        )
        (loop $while-in66
         (block $while-out65
          (if
           (i32.le_u
            (tee_local $4
             (i32.load
              (get_local $2)
             )
            )
            (get_local $6)
           )
           (br_if $while-out65
            (i32.gt_u
             (tee_local $5
              (i32.add
               (get_local $4)
               (i32.load offset=4
                (get_local $2)
               )
              )
             )
             (get_local $6)
            )
           )
          )
          (set_local $2
           (i32.load offset=8
            (get_local $2)
           )
          )
          (br $while-in66)
         )
        )
        (set_local $2
         (i32.add
          (tee_local $4
           (i32.add
            (get_local $5)
            (i32.const -47)
           )
          )
          (i32.const 8)
         )
        )
        (set_local $4
         (i32.add
          (tee_local $2
           (select
            (get_local $6)
            (tee_local $2
             (i32.add
              (get_local $4)
              (select
               (i32.and
                (i32.sub
                 (i32.const 0)
                 (get_local $2)
                )
                (i32.const 7)
               )
               (i32.const 0)
               (i32.and
                (get_local $2)
                (i32.const 7)
               )
              )
             )
            )
            (i32.lt_u
             (get_local $2)
             (tee_local $9
              (i32.add
               (get_local $6)
               (i32.const 16)
              )
             )
            )
           )
          )
          (i32.const 8)
         )
        )
        (i32.store
         (i32.const 1068)
         (tee_local $10
          (i32.add
           (get_local $0)
           (tee_local $7
            (select
             (i32.and
              (i32.sub
               (i32.const 0)
               (tee_local $7
                (i32.add
                 (get_local $0)
                 (i32.const 8)
                )
               )
              )
              (i32.const 7)
             )
             (i32.const 0)
             (i32.and
              (get_local $7)
              (i32.const 7)
             )
            )
           )
          )
         )
        )
        (i32.store
         (i32.const 1056)
         (tee_local $7
          (i32.sub
           (tee_local $11
            (i32.add
             (get_local $1)
             (i32.const -40)
            )
           )
           (get_local $7)
          )
         )
        )
        (i32.store offset=4
         (get_local $10)
         (i32.or
          (get_local $7)
          (i32.const 1)
         )
        )
        (i32.store offset=4
         (i32.add
          (get_local $0)
          (get_local $11)
         )
         (i32.const 40)
        )
        (i32.store
         (i32.const 1072)
         (i32.load
          (i32.const 1532)
         )
        )
        (i32.store
         (tee_local $7
          (i32.add
           (get_local $2)
           (i32.const 4)
          )
         )
         (i32.const 27)
        )
        (i64.store align=4
         (get_local $4)
         (i64.load align=4
          (i32.const 1492)
         )
        )
        (i64.store offset=8 align=4
         (get_local $4)
         (i64.load align=4
          (i32.const 1500)
         )
        )
        (i32.store
         (i32.const 1492)
         (get_local $0)
        )
        (i32.store
         (i32.const 1496)
         (get_local $1)
        )
        (i32.store
         (i32.const 1504)
         (i32.const 0)
        )
        (i32.store
         (i32.const 1500)
         (get_local $4)
        )
        (set_local $0
         (i32.add
          (get_local $2)
          (i32.const 24)
         )
        )
        (loop $while-in68
         (i32.store
          (tee_local $1
           (i32.add
            (get_local $0)
            (i32.const 4)
           )
          )
          (i32.const 7)
         )
         (if
          (i32.lt_u
           (i32.add
            (get_local $0)
            (i32.const 8)
           )
           (get_local $5)
          )
          (block
           (set_local $0
            (get_local $1)
           )
           (br $while-in68)
          )
         )
        )
        (if
         (i32.ne
          (get_local $2)
          (get_local $6)
         )
         (block
          (i32.store
           (get_local $7)
           (i32.and
            (i32.load
             (get_local $7)
            )
            (i32.const -2)
           )
          )
          (i32.store offset=4
           (get_local $6)
           (i32.or
            (tee_local $4
             (i32.sub
              (get_local $2)
              (get_local $6)
             )
            )
            (i32.const 1)
           )
          )
          (i32.store
           (get_local $2)
           (get_local $4)
          )
          (set_local $1
           (i32.shr_u
            (get_local $4)
            (i32.const 3)
           )
          )
          (if
           (i32.lt_u
            (get_local $4)
            (i32.const 256)
           )
           (block
            (set_local $0
             (i32.add
              (i32.shl
               (get_local $1)
               (i32.const 3)
              )
              (i32.const 1084)
             )
            )
            (if
             (i32.and
              (tee_local $2
               (i32.load
                (i32.const 1044)
               )
              )
              (tee_local $1
               (i32.shl
                (i32.const 1)
                (get_local $1)
               )
              )
             )
             (if
              (i32.gt_u
               (i32.load
                (i32.const 1060)
               )
               (tee_local $2
                (i32.load
                 (tee_local $1
                  (i32.add
                   (get_local $0)
                   (i32.const 8)
                  )
                 )
                )
               )
              )
              (call $_abort)
              (block
               (set_local $17
                (get_local $2)
               )
               (set_local $22
                (get_local $1)
               )
              )
             )
             (block
              (i32.store
               (i32.const 1044)
               (i32.or
                (get_local $2)
                (get_local $1)
               )
              )
              (set_local $17
               (get_local $0)
              )
              (set_local $22
               (i32.add
                (get_local $0)
                (i32.const 8)
               )
              )
             )
            )
            (i32.store
             (get_local $22)
             (get_local $6)
            )
            (i32.store offset=12
             (get_local $17)
             (get_local $6)
            )
            (i32.store offset=8
             (get_local $6)
             (get_local $17)
            )
            (i32.store offset=12
             (get_local $6)
             (get_local $0)
            )
            (br $label$break$L294)
           )
          )
          (set_local $0
           (i32.add
            (i32.shl
             (tee_local $1
              (if (result i32)
               (tee_local $0
                (i32.shr_u
                 (get_local $4)
                 (i32.const 8)
                )
               )
               (if (result i32)
                (i32.gt_u
                 (get_local $4)
                 (i32.const 16777215)
                )
                (i32.const 31)
                (i32.or
                 (i32.and
                  (i32.shr_u
                   (get_local $4)
                   (i32.add
                    (tee_local $0
                     (i32.add
                      (i32.sub
                       (i32.const 14)
                       (i32.or
                        (i32.or
                         (tee_local $2
                          (i32.and
                           (i32.shr_u
                            (i32.add
                             (tee_local $1
                              (i32.shl
                               (get_local $0)
                               (tee_local $0
                                (i32.and
                                 (i32.shr_u
                                  (i32.add
                                   (get_local $0)
                                   (i32.const 1048320)
                                  )
                                  (i32.const 16)
                                 )
                                 (i32.const 8)
                                )
                               )
                              )
                             )
                             (i32.const 520192)
                            )
                            (i32.const 16)
                           )
                           (i32.const 4)
                          )
                         )
                         (get_local $0)
                        )
                        (tee_local $1
                         (i32.and
                          (i32.shr_u
                           (i32.add
                            (tee_local $0
                             (i32.shl
                              (get_local $1)
                              (get_local $2)
                             )
                            )
                            (i32.const 245760)
                           )
                           (i32.const 16)
                          )
                          (i32.const 2)
                         )
                        )
                       )
                      )
                      (i32.shr_u
                       (i32.shl
                        (get_local $0)
                        (get_local $1)
                       )
                       (i32.const 15)
                      )
                     )
                    )
                    (i32.const 7)
                   )
                  )
                  (i32.const 1)
                 )
                 (i32.shl
                  (get_local $0)
                  (i32.const 1)
                 )
                )
               )
               (i32.const 0)
              )
             )
             (i32.const 2)
            )
            (i32.const 1348)
           )
          )
          (i32.store offset=28
           (get_local $6)
           (get_local $1)
          )
          (i32.store offset=20
           (get_local $6)
           (i32.const 0)
          )
          (i32.store
           (get_local $9)
           (i32.const 0)
          )
          (if
           (i32.eqz
            (i32.and
             (tee_local $2
              (i32.load
               (i32.const 1048)
              )
             )
             (tee_local $5
              (i32.shl
               (i32.const 1)
               (get_local $1)
              )
             )
            )
           )
           (block
            (i32.store
             (i32.const 1048)
             (i32.or
              (get_local $2)
              (get_local $5)
             )
            )
            (i32.store
             (get_local $0)
             (get_local $6)
            )
            (i32.store offset=24
             (get_local $6)
             (get_local $0)
            )
            (i32.store offset=12
             (get_local $6)
             (get_local $6)
            )
            (i32.store offset=8
             (get_local $6)
             (get_local $6)
            )
            (br $label$break$L294)
           )
          )
          (block $label$break$L451
           (if
            (i32.eq
             (i32.and
              (i32.load offset=4
               (tee_local $0
                (i32.load
                 (get_local $0)
                )
               )
              )
              (i32.const -8)
             )
             (get_local $4)
            )
            (set_local $8
             (get_local $0)
            )
            (block
             (set_local $2
              (i32.shl
               (get_local $4)
               (select
                (i32.const 0)
                (i32.sub
                 (i32.const 25)
                 (i32.shr_u
                  (get_local $1)
                  (i32.const 1)
                 )
                )
                (i32.eq
                 (get_local $1)
                 (i32.const 31)
                )
               )
              )
             )
             (loop $while-in71
              (if
               (tee_local $1
                (i32.load
                 (tee_local $5
                  (i32.add
                   (i32.add
                    (get_local $0)
                    (i32.const 16)
                   )
                   (i32.shl
                    (i32.shr_u
                     (get_local $2)
                     (i32.const 31)
                    )
                    (i32.const 2)
                   )
                  )
                 )
                )
               )
               (block
                (set_local $2
                 (i32.shl
                  (get_local $2)
                  (i32.const 1)
                 )
                )
                (if
                 (i32.eq
                  (i32.and
                   (i32.load offset=4
                    (get_local $1)
                   )
                   (i32.const -8)
                  )
                  (get_local $4)
                 )
                 (block
                  (set_local $8
                   (get_local $1)
                  )
                  (br $label$break$L451)
                 )
                 (block
                  (set_local $0
                   (get_local $1)
                  )
                  (br $while-in71)
                 )
                )
               )
              )
             )
             (if
              (i32.gt_u
               (i32.load
                (i32.const 1060)
               )
               (get_local $5)
              )
              (call $_abort)
              (block
               (i32.store
                (get_local $5)
                (get_local $6)
               )
               (i32.store offset=24
                (get_local $6)
                (get_local $0)
               )
               (i32.store offset=12
                (get_local $6)
                (get_local $6)
               )
               (i32.store offset=8
                (get_local $6)
                (get_local $6)
               )
               (br $label$break$L294)
              )
             )
            )
           )
          )
          (if
           (i32.and
            (i32.le_u
             (tee_local $1
              (i32.load
               (i32.const 1060)
              )
             )
             (tee_local $0
              (i32.load
               (tee_local $2
                (i32.add
                 (get_local $8)
                 (i32.const 8)
                )
               )
              )
             )
            )
            (i32.le_u
             (get_local $1)
             (get_local $8)
            )
           )
           (block
            (i32.store offset=12
             (get_local $0)
             (get_local $6)
            )
            (i32.store
             (get_local $2)
             (get_local $6)
            )
            (i32.store offset=8
             (get_local $6)
             (get_local $0)
            )
            (i32.store offset=12
             (get_local $6)
             (get_local $8)
            )
            (i32.store offset=24
             (get_local $6)
             (i32.const 0)
            )
           )
           (call $_abort)
          )
         )
        )
       )
       (block
        (if
         (i32.or
          (i32.eqz
           (tee_local $2
            (i32.load
             (i32.const 1060)
            )
           )
          )
          (i32.lt_u
           (get_local $0)
           (get_local $2)
          )
         )
         (i32.store
          (i32.const 1060)
          (get_local $0)
         )
        )
        (i32.store
         (i32.const 1492)
         (get_local $0)
        )
        (i32.store
         (i32.const 1496)
         (get_local $1)
        )
        (i32.store
         (i32.const 1504)
         (i32.const 0)
        )
        (i32.store
         (i32.const 1080)
         (i32.load
          (i32.const 1516)
         )
        )
        (i32.store
         (i32.const 1076)
         (i32.const -1)
        )
        (i32.store
         (i32.const 1096)
         (i32.const 1084)
        )
        (i32.store
         (i32.const 1092)
         (i32.const 1084)
        )
        (i32.store
         (i32.const 1104)
         (i32.const 1092)
        )
        (i32.store
         (i32.const 1100)
         (i32.const 1092)
        )
        (i32.store
         (i32.const 1112)
         (i32.const 1100)
        )
        (i32.store
         (i32.const 1108)
         (i32.const 1100)
        )
        (i32.store
         (i32.const 1120)
         (i32.const 1108)
        )
        (i32.store
         (i32.const 1116)
         (i32.const 1108)
        )
        (i32.store
         (i32.const 1128)
         (i32.const 1116)
        )
        (i32.store
         (i32.const 1124)
         (i32.const 1116)
        )
        (i32.store
         (i32.const 1136)
         (i32.const 1124)
        )
        (i32.store
         (i32.const 1132)
         (i32.const 1124)
        )
        (i32.store
         (i32.const 1144)
         (i32.const 1132)
        )
        (i32.store
         (i32.const 1140)
         (i32.const 1132)
        )
        (i32.store
         (i32.const 1152)
         (i32.const 1140)
        )
        (i32.store
         (i32.const 1148)
         (i32.const 1140)
        )
        (i32.store
         (i32.const 1160)
         (i32.const 1148)
        )
        (i32.store
         (i32.const 1156)
         (i32.const 1148)
        )
        (i32.store
         (i32.const 1168)
         (i32.const 1156)
        )
        (i32.store
         (i32.const 1164)
         (i32.const 1156)
        )
        (i32.store
         (i32.const 1176)
         (i32.const 1164)
        )
        (i32.store
         (i32.const 1172)
         (i32.const 1164)
        )
        (i32.store
         (i32.const 1184)
         (i32.const 1172)
        )
        (i32.store
         (i32.const 1180)
         (i32.const 1172)
        )
        (i32.store
         (i32.const 1192)
         (i32.const 1180)
        )
        (i32.store
         (i32.const 1188)
         (i32.const 1180)
        )
        (i32.store
         (i32.const 1200)
         (i32.const 1188)
        )
        (i32.store
         (i32.const 1196)
         (i32.const 1188)
        )
        (i32.store
         (i32.const 1208)
         (i32.const 1196)
        )
        (i32.store
         (i32.const 1204)
         (i32.const 1196)
        )
        (i32.store
         (i32.const 1216)
         (i32.const 1204)
        )
        (i32.store
         (i32.const 1212)
         (i32.const 1204)
        )
        (i32.store
         (i32.const 1224)
         (i32.const 1212)
        )
        (i32.store
         (i32.const 1220)
         (i32.const 1212)
        )
        (i32.store
         (i32.const 1232)
         (i32.const 1220)
        )
        (i32.store
         (i32.const 1228)
         (i32.const 1220)
        )
        (i32.store
         (i32.const 1240)
         (i32.const 1228)
        )
        (i32.store
         (i32.const 1236)
         (i32.const 1228)
        )
        (i32.store
         (i32.const 1248)
         (i32.const 1236)
        )
        (i32.store
         (i32.const 1244)
         (i32.const 1236)
        )
        (i32.store
         (i32.const 1256)
         (i32.const 1244)
        )
        (i32.store
         (i32.const 1252)
         (i32.const 1244)
        )
        (i32.store
         (i32.const 1264)
         (i32.const 1252)
        )
        (i32.store
         (i32.const 1260)
         (i32.const 1252)
        )
        (i32.store
         (i32.const 1272)
         (i32.const 1260)
        )
        (i32.store
         (i32.const 1268)
         (i32.const 1260)
        )
        (i32.store
         (i32.const 1280)
         (i32.const 1268)
        )
        (i32.store
         (i32.const 1276)
         (i32.const 1268)
        )
        (i32.store
         (i32.const 1288)
         (i32.const 1276)
        )
        (i32.store
         (i32.const 1284)
         (i32.const 1276)
        )
        (i32.store
         (i32.const 1296)
         (i32.const 1284)
        )
        (i32.store
         (i32.const 1292)
         (i32.const 1284)
        )
        (i32.store
         (i32.const 1304)
         (i32.const 1292)
        )
        (i32.store
         (i32.const 1300)
         (i32.const 1292)
        )
        (i32.store
         (i32.const 1312)
         (i32.const 1300)
        )
        (i32.store
         (i32.const 1308)
         (i32.const 1300)
        )
        (i32.store
         (i32.const 1320)
         (i32.const 1308)
        )
        (i32.store
         (i32.const 1316)
         (i32.const 1308)
        )
        (i32.store
         (i32.const 1328)
         (i32.const 1316)
        )
        (i32.store
         (i32.const 1324)
         (i32.const 1316)
        )
        (i32.store
         (i32.const 1336)
         (i32.const 1324)
        )
        (i32.store
         (i32.const 1332)
         (i32.const 1324)
        )
        (i32.store
         (i32.const 1344)
         (i32.const 1332)
        )
        (i32.store
         (i32.const 1340)
         (i32.const 1332)
        )
        (i32.store
         (i32.const 1068)
         (tee_local $4
          (i32.add
           (get_local $0)
           (tee_local $2
            (select
             (i32.and
              (i32.sub
               (i32.const 0)
               (tee_local $2
                (i32.add
                 (get_local $0)
                 (i32.const 8)
                )
               )
              )
              (i32.const 7)
             )
             (i32.const 0)
             (i32.and
              (get_local $2)
              (i32.const 7)
             )
            )
           )
          )
         )
        )
        (i32.store
         (i32.const 1056)
         (tee_local $2
          (i32.sub
           (tee_local $1
            (i32.add
             (get_local $1)
             (i32.const -40)
            )
           )
           (get_local $2)
          )
         )
        )
        (i32.store offset=4
         (get_local $4)
         (i32.or
          (get_local $2)
          (i32.const 1)
         )
        )
        (i32.store offset=4
         (i32.add
          (get_local $0)
          (get_local $1)
         )
         (i32.const 40)
        )
        (i32.store
         (i32.const 1072)
         (i32.load
          (i32.const 1532)
         )
        )
       )
      )
     )
     (if
      (i32.gt_u
       (tee_local $0
        (i32.load
         (i32.const 1056)
        )
       )
       (get_local $3)
      )
      (block
       (i32.store
        (i32.const 1056)
        (tee_local $1
         (i32.sub
          (get_local $0)
          (get_local $3)
         )
        )
       )
       (br $folding-inner0)
      )
     )
    )
    (i32.store
     (call $___errno_location)
     (i32.const 12)
    )
    (set_global $STACKTOP
     (get_local $14)
    )
    (return
     (i32.const 0)
    )
   )
   (i32.store
    (i32.const 1068)
    (tee_local $2
     (i32.add
      (tee_local $0
       (i32.load
        (i32.const 1068)
       )
      )
      (get_local $3)
     )
    )
   )
   (i32.store offset=4
    (get_local $2)
    (i32.or
     (get_local $1)
     (i32.const 1)
    )
   )
   (i32.store offset=4
    (get_local $0)
    (i32.or
     (get_local $3)
     (i32.const 3)
    )
   )
  )
  (set_global $STACKTOP
   (get_local $14)
  )
  (i32.add
   (get_local $0)
   (i32.const 8)
  )
 )
 (func $_free (; 25 ;) (; has Stack IR ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (if
   (i32.eqz
    (get_local $0)
   )
   (return)
  )
  (if
   (i32.lt_u
    (tee_local $4
     (i32.add
      (get_local $0)
      (i32.const -8)
     )
    )
    (tee_local $12
     (i32.load
      (i32.const 1060)
     )
    )
   )
   (call $_abort)
  )
  (if
   (i32.eq
    (tee_local $11
     (i32.and
      (tee_local $0
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const -4)
        )
       )
      )
      (i32.const 3)
     )
    )
    (i32.const 1)
   )
   (call $_abort)
  )
  (set_local $7
   (i32.add
    (get_local $4)
    (tee_local $2
     (i32.and
      (get_local $0)
      (i32.const -8)
     )
    )
   )
  )
  (block $label$break$L10
   (if
    (i32.and
     (get_local $0)
     (i32.const 1)
    )
    (block
     (set_local $1
      (get_local $2)
     )
     (set_local $5
      (tee_local $3
       (get_local $4)
      )
     )
    )
    (block
     (set_local $9
      (i32.load
       (get_local $4)
      )
     )
     (if
      (i32.eqz
       (get_local $11)
      )
      (return)
     )
     (if
      (i32.lt_u
       (tee_local $0
        (i32.sub
         (get_local $4)
         (get_local $9)
        )
       )
       (get_local $12)
      )
      (call $_abort)
     )
     (set_local $4
      (i32.add
       (get_local $9)
       (get_local $2)
      )
     )
     (if
      (i32.eq
       (i32.load
        (i32.const 1064)
       )
       (get_local $0)
      )
      (block
       (if
        (i32.ne
         (i32.and
          (tee_local $1
           (i32.load
            (tee_local $3
             (i32.add
              (get_local $7)
              (i32.const 4)
             )
            )
           )
          )
          (i32.const 3)
         )
         (i32.const 3)
        )
        (block
         (set_local $1
          (get_local $4)
         )
         (set_local $5
          (tee_local $3
           (get_local $0)
          )
         )
         (br $label$break$L10)
        )
       )
       (i32.store
        (i32.const 1052)
        (get_local $4)
       )
       (i32.store
        (get_local $3)
        (i32.and
         (get_local $1)
         (i32.const -2)
        )
       )
       (i32.store offset=4
        (get_local $0)
        (i32.or
         (get_local $4)
         (i32.const 1)
        )
       )
       (i32.store
        (i32.add
         (get_local $0)
         (get_local $4)
        )
        (get_local $4)
       )
       (return)
      )
     )
     (set_local $2
      (i32.shr_u
       (get_local $9)
       (i32.const 3)
      )
     )
     (if
      (i32.lt_u
       (get_local $9)
       (i32.const 256)
      )
      (block
       (set_local $1
        (i32.load offset=12
         (get_local $0)
        )
       )
       (if
        (i32.ne
         (tee_local $5
          (i32.load offset=8
           (get_local $0)
          )
         )
         (tee_local $3
          (i32.add
           (i32.shl
            (get_local $2)
            (i32.const 3)
           )
           (i32.const 1084)
          )
         )
        )
        (block
         (if
          (i32.gt_u
           (get_local $12)
           (get_local $5)
          )
          (call $_abort)
         )
         (if
          (i32.ne
           (i32.load offset=12
            (get_local $5)
           )
           (get_local $0)
          )
          (call $_abort)
         )
        )
       )
       (if
        (i32.eq
         (get_local $1)
         (get_local $5)
        )
        (block
         (i32.store
          (i32.const 1044)
          (i32.and
           (i32.load
            (i32.const 1044)
           )
           (i32.xor
            (i32.shl
             (i32.const 1)
             (get_local $2)
            )
            (i32.const -1)
           )
          )
         )
         (set_local $1
          (get_local $4)
         )
         (set_local $5
          (tee_local $3
           (get_local $0)
          )
         )
         (br $label$break$L10)
        )
       )
       (if
        (i32.eq
         (get_local $1)
         (get_local $3)
        )
        (set_local $6
         (i32.add
          (get_local $1)
          (i32.const 8)
         )
        )
        (block
         (if
          (i32.gt_u
           (get_local $12)
           (get_local $1)
          )
          (call $_abort)
         )
         (if
          (i32.eq
           (i32.load
            (tee_local $3
             (i32.add
              (get_local $1)
              (i32.const 8)
             )
            )
           )
           (get_local $0)
          )
          (set_local $6
           (get_local $3)
          )
          (call $_abort)
         )
        )
       )
       (i32.store offset=12
        (get_local $5)
        (get_local $1)
       )
       (i32.store
        (get_local $6)
        (get_local $5)
       )
       (set_local $1
        (get_local $4)
       )
       (set_local $5
        (tee_local $3
         (get_local $0)
        )
       )
       (br $label$break$L10)
      )
     )
     (set_local $13
      (i32.load offset=24
       (get_local $0)
      )
     )
     (block $do-once
      (if
       (i32.eq
        (tee_local $2
         (i32.load offset=12
          (get_local $0)
         )
        )
        (get_local $0)
       )
       (block
        (if
         (tee_local $2
          (i32.load
           (tee_local $9
            (i32.add
             (tee_local $6
              (i32.add
               (get_local $0)
               (i32.const 16)
              )
             )
             (i32.const 4)
            )
           )
          )
         )
         (set_local $6
          (get_local $9)
         )
         (br_if $do-once
          (i32.eqz
           (tee_local $2
            (i32.load
             (get_local $6)
            )
           )
          )
         )
        )
        (loop $while-in
         (block $while-out
          (if
           (i32.eqz
            (tee_local $11
             (i32.load
              (tee_local $9
               (i32.add
                (get_local $2)
                (i32.const 20)
               )
              )
             )
            )
           )
           (br_if $while-out
            (i32.eqz
             (tee_local $11
              (i32.load
               (tee_local $9
                (i32.add
                 (get_local $2)
                 (i32.const 16)
                )
               )
              )
             )
            )
           )
          )
          (set_local $6
           (get_local $9)
          )
          (set_local $2
           (get_local $11)
          )
          (br $while-in)
         )
        )
        (if
         (i32.gt_u
          (get_local $12)
          (get_local $6)
         )
         (call $_abort)
         (block
          (i32.store
           (get_local $6)
           (i32.const 0)
          )
          (set_local $8
           (get_local $2)
          )
         )
        )
       )
       (block
        (if
         (i32.gt_u
          (get_local $12)
          (tee_local $6
           (i32.load offset=8
            (get_local $0)
           )
          )
         )
         (call $_abort)
        )
        (if
         (i32.ne
          (i32.load
           (tee_local $9
            (i32.add
             (get_local $6)
             (i32.const 12)
            )
           )
          )
          (get_local $0)
         )
         (call $_abort)
        )
        (if
         (i32.eq
          (i32.load
           (tee_local $11
            (i32.add
             (get_local $2)
             (i32.const 8)
            )
           )
          )
          (get_local $0)
         )
         (block
          (i32.store
           (get_local $9)
           (get_local $2)
          )
          (i32.store
           (get_local $11)
           (get_local $6)
          )
          (set_local $8
           (get_local $2)
          )
         )
         (call $_abort)
        )
       )
      )
     )
     (if
      (get_local $13)
      (block
       (if
        (i32.eq
         (i32.load
          (tee_local $6
           (i32.add
            (i32.shl
             (tee_local $2
              (i32.load offset=28
               (get_local $0)
              )
             )
             (i32.const 2)
            )
            (i32.const 1348)
           )
          )
         )
         (get_local $0)
        )
        (block
         (i32.store
          (get_local $6)
          (get_local $8)
         )
         (if
          (i32.eqz
           (get_local $8)
          )
          (block
           (i32.store
            (i32.const 1048)
            (i32.and
             (i32.load
              (i32.const 1048)
             )
             (i32.xor
              (i32.shl
               (i32.const 1)
               (get_local $2)
              )
              (i32.const -1)
             )
            )
           )
           (set_local $1
            (get_local $4)
           )
           (set_local $5
            (tee_local $3
             (get_local $0)
            )
           )
           (br $label$break$L10)
          )
         )
        )
        (if
         (i32.gt_u
          (i32.load
           (i32.const 1060)
          )
          (get_local $13)
         )
         (call $_abort)
         (block
          (i32.store
           (select
            (tee_local $2
             (i32.add
              (get_local $13)
              (i32.const 16)
             )
            )
            (i32.add
             (get_local $13)
             (i32.const 20)
            )
            (i32.eq
             (i32.load
              (get_local $2)
             )
             (get_local $0)
            )
           )
           (get_local $8)
          )
          (if
           (i32.eqz
            (get_local $8)
           )
           (block
            (set_local $1
             (get_local $4)
            )
            (set_local $5
             (tee_local $3
              (get_local $0)
             )
            )
            (br $label$break$L10)
           )
          )
         )
        )
       )
       (if
        (i32.gt_u
         (tee_local $6
          (i32.load
           (i32.const 1060)
          )
         )
         (get_local $8)
        )
        (call $_abort)
       )
       (i32.store offset=24
        (get_local $8)
        (get_local $13)
       )
       (if
        (tee_local $2
         (i32.load
          (tee_local $9
           (i32.add
            (get_local $0)
            (i32.const 16)
           )
          )
         )
        )
        (if
         (i32.gt_u
          (get_local $6)
          (get_local $2)
         )
         (call $_abort)
         (block
          (i32.store offset=16
           (get_local $8)
           (get_local $2)
          )
          (i32.store offset=24
           (get_local $2)
           (get_local $8)
          )
         )
        )
       )
       (if
        (tee_local $2
         (i32.load offset=4
          (get_local $9)
         )
        )
        (if
         (i32.gt_u
          (i32.load
           (i32.const 1060)
          )
          (get_local $2)
         )
         (call $_abort)
         (block
          (i32.store offset=20
           (get_local $8)
           (get_local $2)
          )
          (i32.store offset=24
           (get_local $2)
           (get_local $8)
          )
          (set_local $1
           (get_local $4)
          )
          (set_local $5
           (tee_local $3
            (get_local $0)
           )
          )
         )
        )
        (block
         (set_local $1
          (get_local $4)
         )
         (set_local $5
          (tee_local $3
           (get_local $0)
          )
         )
        )
       )
      )
      (block
       (set_local $1
        (get_local $4)
       )
       (set_local $5
        (tee_local $3
         (get_local $0)
        )
       )
      )
     )
    )
   )
  )
  (if
   (i32.ge_u
    (get_local $5)
    (get_local $7)
   )
   (call $_abort)
  )
  (if
   (i32.eqz
    (i32.and
     (tee_local $0
      (i32.load
       (tee_local $4
        (i32.add
         (get_local $7)
         (i32.const 4)
        )
       )
      )
     )
     (i32.const 1)
    )
   )
   (call $_abort)
  )
  (set_local $1
   (i32.shr_u
    (tee_local $5
     (if (result i32)
      (i32.and
       (get_local $0)
       (i32.const 2)
      )
      (block (result i32)
       (i32.store
        (get_local $4)
        (i32.and
         (get_local $0)
         (i32.const -2)
        )
       )
       (i32.store offset=4
        (get_local $3)
        (i32.or
         (get_local $1)
         (i32.const 1)
        )
       )
       (i32.store
        (i32.add
         (get_local $5)
         (get_local $1)
        )
        (get_local $1)
       )
       (get_local $1)
      )
      (block (result i32)
       (if
        (i32.eq
         (i32.load
          (i32.const 1068)
         )
         (get_local $7)
        )
        (block
         (i32.store
          (i32.const 1056)
          (tee_local $0
           (i32.add
            (i32.load
             (i32.const 1056)
            )
            (get_local $1)
           )
          )
         )
         (i32.store
          (i32.const 1068)
          (get_local $3)
         )
         (i32.store offset=4
          (get_local $3)
          (i32.or
           (get_local $0)
           (i32.const 1)
          )
         )
         (if
          (i32.ne
           (get_local $3)
           (i32.load
            (i32.const 1064)
           )
          )
          (return)
         )
         (i32.store
          (i32.const 1064)
          (i32.const 0)
         )
         (i32.store
          (i32.const 1052)
          (i32.const 0)
         )
         (return)
        )
       )
       (if
        (i32.eq
         (i32.load
          (i32.const 1064)
         )
         (get_local $7)
        )
        (block
         (i32.store
          (i32.const 1052)
          (tee_local $0
           (i32.add
            (i32.load
             (i32.const 1052)
            )
            (get_local $1)
           )
          )
         )
         (i32.store
          (i32.const 1064)
          (get_local $5)
         )
         (i32.store offset=4
          (get_local $3)
          (i32.or
           (get_local $0)
           (i32.const 1)
          )
         )
         (i32.store
          (i32.add
           (get_local $5)
           (get_local $0)
          )
          (get_local $0)
         )
         (return)
        )
       )
       (set_local $4
        (i32.add
         (i32.and
          (get_local $0)
          (i32.const -8)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.shr_u
         (get_local $0)
         (i32.const 3)
        )
       )
       (block $label$break$L111
        (if
         (i32.lt_u
          (get_local $0)
          (i32.const 256)
         )
         (block
          (set_local $1
           (i32.load offset=12
            (get_local $7)
           )
          )
          (if
           (i32.ne
            (tee_local $2
             (i32.load offset=8
              (get_local $7)
             )
            )
            (tee_local $0
             (i32.add
              (i32.shl
               (get_local $6)
               (i32.const 3)
              )
              (i32.const 1084)
             )
            )
           )
           (block
            (if
             (i32.gt_u
              (i32.load
               (i32.const 1060)
              )
              (get_local $2)
             )
             (call $_abort)
            )
            (if
             (i32.ne
              (i32.load offset=12
               (get_local $2)
              )
              (get_local $7)
             )
             (call $_abort)
            )
           )
          )
          (if
           (i32.eq
            (get_local $1)
            (get_local $2)
           )
           (block
            (i32.store
             (i32.const 1044)
             (i32.and
              (i32.load
               (i32.const 1044)
              )
              (i32.xor
               (i32.shl
                (i32.const 1)
                (get_local $6)
               )
               (i32.const -1)
              )
             )
            )
            (br $label$break$L111)
           )
          )
          (if
           (i32.eq
            (get_local $1)
            (get_local $0)
           )
           (set_local $16
            (i32.add
             (get_local $1)
             (i32.const 8)
            )
           )
           (block
            (if
             (i32.gt_u
              (i32.load
               (i32.const 1060)
              )
              (get_local $1)
             )
             (call $_abort)
            )
            (if
             (i32.eq
              (i32.load
               (tee_local $0
                (i32.add
                 (get_local $1)
                 (i32.const 8)
                )
               )
              )
              (get_local $7)
             )
             (set_local $16
              (get_local $0)
             )
             (call $_abort)
            )
           )
          )
          (i32.store offset=12
           (get_local $2)
           (get_local $1)
          )
          (i32.store
           (get_local $16)
           (get_local $2)
          )
         )
         (block
          (set_local $8
           (i32.load offset=24
            (get_local $7)
           )
          )
          (block $do-once6
           (if
            (i32.eq
             (tee_local $0
              (i32.load offset=12
               (get_local $7)
              )
             )
             (get_local $7)
            )
            (block
             (if
              (tee_local $0
               (i32.load
                (tee_local $2
                 (i32.add
                  (tee_local $1
                   (i32.add
                    (get_local $7)
                    (i32.const 16)
                   )
                  )
                  (i32.const 4)
                 )
                )
               )
              )
              (set_local $1
               (get_local $2)
              )
              (br_if $do-once6
               (i32.eqz
                (tee_local $0
                 (i32.load
                  (get_local $1)
                 )
                )
               )
              )
             )
             (loop $while-in9
              (block $while-out8
               (if
                (i32.eqz
                 (tee_local $6
                  (i32.load
                   (tee_local $2
                    (i32.add
                     (get_local $0)
                     (i32.const 20)
                    )
                   )
                  )
                 )
                )
                (br_if $while-out8
                 (i32.eqz
                  (tee_local $6
                   (i32.load
                    (tee_local $2
                     (i32.add
                      (get_local $0)
                      (i32.const 16)
                     )
                    )
                   )
                  )
                 )
                )
               )
               (set_local $1
                (get_local $2)
               )
               (set_local $0
                (get_local $6)
               )
               (br $while-in9)
              )
             )
             (if
              (i32.gt_u
               (i32.load
                (i32.const 1060)
               )
               (get_local $1)
              )
              (call $_abort)
              (block
               (i32.store
                (get_local $1)
                (i32.const 0)
               )
               (set_local $10
                (get_local $0)
               )
              )
             )
            )
            (block
             (if
              (i32.gt_u
               (i32.load
                (i32.const 1060)
               )
               (tee_local $1
                (i32.load offset=8
                 (get_local $7)
                )
               )
              )
              (call $_abort)
             )
             (if
              (i32.ne
               (i32.load
                (tee_local $2
                 (i32.add
                  (get_local $1)
                  (i32.const 12)
                 )
                )
               )
               (get_local $7)
              )
              (call $_abort)
             )
             (if
              (i32.eq
               (i32.load
                (tee_local $6
                 (i32.add
                  (get_local $0)
                  (i32.const 8)
                 )
                )
               )
               (get_local $7)
              )
              (block
               (i32.store
                (get_local $2)
                (get_local $0)
               )
               (i32.store
                (get_local $6)
                (get_local $1)
               )
               (set_local $10
                (get_local $0)
               )
              )
              (call $_abort)
             )
            )
           )
          )
          (if
           (get_local $8)
           (block
            (if
             (i32.eq
              (i32.load
               (tee_local $1
                (i32.add
                 (i32.shl
                  (tee_local $0
                   (i32.load offset=28
                    (get_local $7)
                   )
                  )
                  (i32.const 2)
                 )
                 (i32.const 1348)
                )
               )
              )
              (get_local $7)
             )
             (block
              (i32.store
               (get_local $1)
               (get_local $10)
              )
              (if
               (i32.eqz
                (get_local $10)
               )
               (block
                (i32.store
                 (i32.const 1048)
                 (i32.and
                  (i32.load
                   (i32.const 1048)
                  )
                  (i32.xor
                   (i32.shl
                    (i32.const 1)
                    (get_local $0)
                   )
                   (i32.const -1)
                  )
                 )
                )
                (br $label$break$L111)
               )
              )
             )
             (if
              (i32.gt_u
               (i32.load
                (i32.const 1060)
               )
               (get_local $8)
              )
              (call $_abort)
              (block
               (i32.store
                (select
                 (tee_local $0
                  (i32.add
                   (get_local $8)
                   (i32.const 16)
                  )
                 )
                 (i32.add
                  (get_local $8)
                  (i32.const 20)
                 )
                 (i32.eq
                  (i32.load
                   (get_local $0)
                  )
                  (get_local $7)
                 )
                )
                (get_local $10)
               )
               (br_if $label$break$L111
                (i32.eqz
                 (get_local $10)
                )
               )
              )
             )
            )
            (if
             (i32.gt_u
              (tee_local $1
               (i32.load
                (i32.const 1060)
               )
              )
              (get_local $10)
             )
             (call $_abort)
            )
            (i32.store offset=24
             (get_local $10)
             (get_local $8)
            )
            (if
             (tee_local $0
              (i32.load
               (tee_local $2
                (i32.add
                 (get_local $7)
                 (i32.const 16)
                )
               )
              )
             )
             (if
              (i32.gt_u
               (get_local $1)
               (get_local $0)
              )
              (call $_abort)
              (block
               (i32.store offset=16
                (get_local $10)
                (get_local $0)
               )
               (i32.store offset=24
                (get_local $0)
                (get_local $10)
               )
              )
             )
            )
            (if
             (tee_local $0
              (i32.load offset=4
               (get_local $2)
              )
             )
             (if
              (i32.gt_u
               (i32.load
                (i32.const 1060)
               )
               (get_local $0)
              )
              (call $_abort)
              (block
               (i32.store offset=20
                (get_local $10)
                (get_local $0)
               )
               (i32.store offset=24
                (get_local $0)
                (get_local $10)
               )
              )
             )
            )
           )
          )
         )
        )
       )
       (i32.store offset=4
        (get_local $3)
        (i32.or
         (get_local $4)
         (i32.const 1)
        )
       )
       (i32.store
        (i32.add
         (get_local $5)
         (get_local $4)
        )
        (get_local $4)
       )
       (if (result i32)
        (i32.eq
         (get_local $3)
         (i32.load
          (i32.const 1064)
         )
        )
        (block
         (i32.store
          (i32.const 1052)
          (get_local $4)
         )
         (return)
        )
        (get_local $4)
       )
      )
     )
    )
    (i32.const 3)
   )
  )
  (if
   (i32.lt_u
    (get_local $5)
    (i32.const 256)
   )
   (block
    (set_local $0
     (i32.add
      (i32.shl
       (get_local $1)
       (i32.const 3)
      )
      (i32.const 1084)
     )
    )
    (if
     (i32.and
      (tee_local $5
       (i32.load
        (i32.const 1044)
       )
      )
      (tee_local $1
       (i32.shl
        (i32.const 1)
        (get_local $1)
       )
      )
     )
     (if
      (i32.gt_u
       (i32.load
        (i32.const 1060)
       )
       (tee_local $5
        (i32.load
         (tee_local $1
          (i32.add
           (get_local $0)
           (i32.const 8)
          )
         )
        )
       )
      )
      (call $_abort)
      (block
       (set_local $15
        (get_local $5)
       )
       (set_local $17
        (get_local $1)
       )
      )
     )
     (block
      (i32.store
       (i32.const 1044)
       (i32.or
        (get_local $5)
        (get_local $1)
       )
      )
      (set_local $15
       (get_local $0)
      )
      (set_local $17
       (i32.add
        (get_local $0)
        (i32.const 8)
       )
      )
     )
    )
    (i32.store
     (get_local $17)
     (get_local $3)
    )
    (i32.store offset=12
     (get_local $15)
     (get_local $3)
    )
    (i32.store offset=8
     (get_local $3)
     (get_local $15)
    )
    (i32.store offset=12
     (get_local $3)
     (get_local $0)
    )
    (return)
   )
  )
  (set_local $0
   (i32.add
    (i32.shl
     (tee_local $1
      (if (result i32)
       (tee_local $0
        (i32.shr_u
         (get_local $5)
         (i32.const 8)
        )
       )
       (if (result i32)
        (i32.gt_u
         (get_local $5)
         (i32.const 16777215)
        )
        (i32.const 31)
        (i32.or
         (i32.and
          (i32.shr_u
           (get_local $5)
           (i32.add
            (tee_local $0
             (i32.add
              (i32.sub
               (i32.const 14)
               (i32.or
                (i32.or
                 (tee_local $4
                  (i32.and
                   (i32.shr_u
                    (i32.add
                     (tee_local $1
                      (i32.shl
                       (get_local $0)
                       (tee_local $0
                        (i32.and
                         (i32.shr_u
                          (i32.add
                           (get_local $0)
                           (i32.const 1048320)
                          )
                          (i32.const 16)
                         )
                         (i32.const 8)
                        )
                       )
                      )
                     )
                     (i32.const 520192)
                    )
                    (i32.const 16)
                   )
                   (i32.const 4)
                  )
                 )
                 (get_local $0)
                )
                (tee_local $1
                 (i32.and
                  (i32.shr_u
                   (i32.add
                    (tee_local $0
                     (i32.shl
                      (get_local $1)
                      (get_local $4)
                     )
                    )
                    (i32.const 245760)
                   )
                   (i32.const 16)
                  )
                  (i32.const 2)
                 )
                )
               )
              )
              (i32.shr_u
               (i32.shl
                (get_local $0)
                (get_local $1)
               )
               (i32.const 15)
              )
             )
            )
            (i32.const 7)
           )
          )
          (i32.const 1)
         )
         (i32.shl
          (get_local $0)
          (i32.const 1)
         )
        )
       )
       (i32.const 0)
      )
     )
     (i32.const 2)
    )
    (i32.const 1348)
   )
  )
  (i32.store offset=28
   (get_local $3)
   (get_local $1)
  )
  (i32.store offset=20
   (get_local $3)
   (i32.const 0)
  )
  (i32.store offset=16
   (get_local $3)
   (i32.const 0)
  )
  (block $label$break$L197
   (if
    (i32.and
     (tee_local $4
      (i32.load
       (i32.const 1048)
      )
     )
     (tee_local $2
      (i32.shl
       (i32.const 1)
       (get_local $1)
      )
     )
    )
    (block
     (block $label$break$L200
      (if
       (i32.eq
        (i32.and
         (i32.load offset=4
          (tee_local $0
           (i32.load
            (get_local $0)
           )
          )
         )
         (i32.const -8)
        )
        (get_local $5)
       )
       (set_local $14
        (get_local $0)
       )
       (block
        (set_local $4
         (i32.shl
          (get_local $5)
          (select
           (i32.const 0)
           (i32.sub
            (i32.const 25)
            (i32.shr_u
             (get_local $1)
             (i32.const 1)
            )
           )
           (i32.eq
            (get_local $1)
            (i32.const 31)
           )
          )
         )
        )
        (loop $while-in17
         (if
          (tee_local $1
           (i32.load
            (tee_local $2
             (i32.add
              (i32.add
               (get_local $0)
               (i32.const 16)
              )
              (i32.shl
               (i32.shr_u
                (get_local $4)
                (i32.const 31)
               )
               (i32.const 2)
              )
             )
            )
           )
          )
          (block
           (set_local $4
            (i32.shl
             (get_local $4)
             (i32.const 1)
            )
           )
           (if
            (i32.eq
             (i32.and
              (i32.load offset=4
               (get_local $1)
              )
              (i32.const -8)
             )
             (get_local $5)
            )
            (block
             (set_local $14
              (get_local $1)
             )
             (br $label$break$L200)
            )
            (block
             (set_local $0
              (get_local $1)
             )
             (br $while-in17)
            )
           )
          )
         )
        )
        (if
         (i32.gt_u
          (i32.load
           (i32.const 1060)
          )
          (get_local $2)
         )
         (call $_abort)
         (block
          (i32.store
           (get_local $2)
           (get_local $3)
          )
          (i32.store offset=24
           (get_local $3)
           (get_local $0)
          )
          (i32.store offset=12
           (get_local $3)
           (get_local $3)
          )
          (i32.store offset=8
           (get_local $3)
           (get_local $3)
          )
          (br $label$break$L197)
         )
        )
       )
      )
     )
     (if
      (i32.and
       (i32.le_u
        (tee_local $1
         (i32.load
          (i32.const 1060)
         )
        )
        (tee_local $0
         (i32.load
          (tee_local $5
           (i32.add
            (get_local $14)
            (i32.const 8)
           )
          )
         )
        )
       )
       (i32.le_u
        (get_local $1)
        (get_local $14)
       )
      )
      (block
       (i32.store offset=12
        (get_local $0)
        (get_local $3)
       )
       (i32.store
        (get_local $5)
        (get_local $3)
       )
       (i32.store offset=8
        (get_local $3)
        (get_local $0)
       )
       (i32.store offset=12
        (get_local $3)
        (get_local $14)
       )
       (i32.store offset=24
        (get_local $3)
        (i32.const 0)
       )
      )
      (call $_abort)
     )
    )
    (block
     (i32.store
      (i32.const 1048)
      (i32.or
       (get_local $4)
       (get_local $2)
      )
     )
     (i32.store
      (get_local $0)
      (get_local $3)
     )
     (i32.store offset=24
      (get_local $3)
      (get_local $0)
     )
     (i32.store offset=12
      (get_local $3)
      (get_local $3)
     )
     (i32.store offset=8
      (get_local $3)
      (get_local $3)
     )
    )
   )
  )
  (i32.store
   (i32.const 1076)
   (tee_local $0
    (i32.add
     (i32.load
      (i32.const 1076)
     )
     (i32.const -1)
    )
   )
  )
  (if
   (get_local $0)
   (return)
  )
  (set_local $0
   (i32.const 1500)
  )
  (loop $while-in19
   (set_local $0
    (i32.add
     (tee_local $3
      (i32.load
       (get_local $0)
      )
     )
     (i32.const 8)
    )
   )
   (br_if $while-in19
    (get_local $3)
   )
  )
  (i32.store
   (i32.const 1076)
   (i32.const -1)
  )
 )
 (func $___errno_location (; 26 ;) (; has Stack IR ;) (result i32)
  (i32.const 1540)
 )
 (func $_srand (; 27 ;) (; has Stack IR ;) (param $0 i32)
  (i64.store
   (i32.const 1024)
   (i64.extend_u/i32
    (i32.add
     (get_local $0)
     (i32.const -1)
    )
   )
  )
 )
 (func $_rand (; 28 ;) (; has Stack IR ;) (result i32)
  (local $0 i64)
  (i64.store
   (i32.const 1024)
   (tee_local $0
    (i64.add
     (i64.mul
      (i64.load
       (i32.const 1024)
      )
      (i64.const 6364136223846793005)
     )
     (i64.const 1)
    )
   )
  )
  (i32.wrap/i64
   (i64.shr_u
    (get_local $0)
    (i64.const 33)
   )
  )
 )
 (func $runPostSets (; 29 ;) (; has Stack IR ;)
  (nop)
 )
 (func $_memcpy (; 30 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (if
   (i32.ge_s
    (get_local $2)
    (i32.const 8192)
   )
   (return
    (call $_emscripten_memcpy_big
     (get_local $0)
     (get_local $1)
     (get_local $2)
    )
   )
  )
  (set_local $4
   (get_local $0)
  )
  (set_local $3
   (i32.add
    (get_local $0)
    (get_local $2)
   )
  )
  (if
   (i32.eq
    (i32.and
     (get_local $0)
     (i32.const 3)
    )
    (i32.and
     (get_local $1)
     (i32.const 3)
    )
   )
   (block
    (loop $while-in
     (if
      (i32.and
       (get_local $0)
       (i32.const 3)
      )
      (block
       (if
        (i32.eqz
         (get_local $2)
        )
        (return
         (get_local $4)
        )
       )
       (i32.store8
        (get_local $0)
        (i32.load8_s
         (get_local $1)
        )
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 1)
        )
       )
       (set_local $1
        (i32.add
         (get_local $1)
         (i32.const 1)
        )
       )
       (set_local $2
        (i32.sub
         (get_local $2)
         (i32.const 1)
        )
       )
       (br $while-in)
      )
     )
    )
    (set_local $5
     (i32.add
      (tee_local $2
       (i32.and
        (get_local $3)
        (i32.const -4)
       )
      )
      (i32.const -64)
     )
    )
    (loop $while-in1
     (if
      (i32.le_s
       (get_local $0)
       (get_local $5)
      )
      (block
       (i32.store
        (get_local $0)
        (i32.load
         (get_local $1)
        )
       )
       (i32.store offset=4
        (get_local $0)
        (i32.load offset=4
         (get_local $1)
        )
       )
       (i32.store offset=8
        (get_local $0)
        (i32.load offset=8
         (get_local $1)
        )
       )
       (i32.store offset=12
        (get_local $0)
        (i32.load offset=12
         (get_local $1)
        )
       )
       (i32.store offset=16
        (get_local $0)
        (i32.load offset=16
         (get_local $1)
        )
       )
       (i32.store offset=20
        (get_local $0)
        (i32.load offset=20
         (get_local $1)
        )
       )
       (i32.store offset=24
        (get_local $0)
        (i32.load offset=24
         (get_local $1)
        )
       )
       (i32.store offset=28
        (get_local $0)
        (i32.load offset=28
         (get_local $1)
        )
       )
       (i32.store offset=32
        (get_local $0)
        (i32.load offset=32
         (get_local $1)
        )
       )
       (i32.store offset=36
        (get_local $0)
        (i32.load offset=36
         (get_local $1)
        )
       )
       (i32.store offset=40
        (get_local $0)
        (i32.load offset=40
         (get_local $1)
        )
       )
       (i32.store offset=44
        (get_local $0)
        (i32.load offset=44
         (get_local $1)
        )
       )
       (i32.store offset=48
        (get_local $0)
        (i32.load offset=48
         (get_local $1)
        )
       )
       (i32.store offset=52
        (get_local $0)
        (i32.load offset=52
         (get_local $1)
        )
       )
       (i32.store offset=56
        (get_local $0)
        (i32.load offset=56
         (get_local $1)
        )
       )
       (i32.store offset=60
        (get_local $0)
        (i32.load offset=60
         (get_local $1)
        )
       )
       (set_local $0
        (i32.sub
         (get_local $0)
         (i32.const -64)
        )
       )
       (set_local $1
        (i32.sub
         (get_local $1)
         (i32.const -64)
        )
       )
       (br $while-in1)
      )
     )
    )
    (loop $while-in3
     (if
      (i32.lt_s
       (get_local $0)
       (get_local $2)
      )
      (block
       (i32.store
        (get_local $0)
        (i32.load
         (get_local $1)
        )
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
       (set_local $1
        (i32.add
         (get_local $1)
         (i32.const 4)
        )
       )
       (br $while-in3)
      )
     )
    )
   )
   (block
    (set_local $2
     (i32.sub
      (get_local $3)
      (i32.const 4)
     )
    )
    (loop $while-in5
     (if
      (i32.lt_s
       (get_local $0)
       (get_local $2)
      )
      (block
       (i32.store8
        (get_local $0)
        (i32.load8_s
         (get_local $1)
        )
       )
       (i32.store8 offset=1
        (get_local $0)
        (i32.load8_s offset=1
         (get_local $1)
        )
       )
       (i32.store8 offset=2
        (get_local $0)
        (i32.load8_s offset=2
         (get_local $1)
        )
       )
       (i32.store8 offset=3
        (get_local $0)
        (i32.load8_s offset=3
         (get_local $1)
        )
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
       (set_local $1
        (i32.add
         (get_local $1)
         (i32.const 4)
        )
       )
       (br $while-in5)
      )
     )
    )
   )
  )
  (loop $while-in7
   (if
    (i32.lt_s
     (get_local $0)
     (get_local $3)
    )
    (block
     (i32.store8
      (get_local $0)
      (i32.load8_s
       (get_local $1)
      )
     )
     (set_local $0
      (i32.add
       (get_local $0)
       (i32.const 1)
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const 1)
      )
     )
     (br $while-in7)
    )
   )
  )
  (get_local $4)
 )
 (func $_memset (; 31 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (set_local $4
   (i32.add
    (get_local $0)
    (get_local $2)
   )
  )
  (set_local $1
   (i32.and
    (get_local $1)
    (i32.const 255)
   )
  )
  (if
   (i32.ge_s
    (get_local $2)
    (i32.const 67)
   )
   (block
    (loop $while-in
     (if
      (i32.and
       (get_local $0)
       (i32.const 3)
      )
      (block
       (i32.store8
        (get_local $0)
        (get_local $1)
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 1)
        )
       )
       (br $while-in)
      )
     )
    )
    (set_local $6
     (i32.add
      (tee_local $5
       (i32.and
        (get_local $4)
        (i32.const -4)
       )
      )
      (i32.const -64)
     )
    )
    (set_local $3
     (i32.or
      (i32.or
       (i32.or
        (get_local $1)
        (i32.shl
         (get_local $1)
         (i32.const 8)
        )
       )
       (i32.shl
        (get_local $1)
        (i32.const 16)
       )
      )
      (i32.shl
       (get_local $1)
       (i32.const 24)
      )
     )
    )
    (loop $while-in1
     (if
      (i32.le_s
       (get_local $0)
       (get_local $6)
      )
      (block
       (i32.store
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=4
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=8
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=12
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=16
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=20
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=24
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=28
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=32
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=36
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=40
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=44
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=48
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=52
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=56
        (get_local $0)
        (get_local $3)
       )
       (i32.store offset=60
        (get_local $0)
        (get_local $3)
       )
       (set_local $0
        (i32.sub
         (get_local $0)
         (i32.const -64)
        )
       )
       (br $while-in1)
      )
     )
    )
    (loop $while-in3
     (if
      (i32.lt_s
       (get_local $0)
       (get_local $5)
      )
      (block
       (i32.store
        (get_local $0)
        (get_local $3)
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
       (br $while-in3)
      )
     )
    )
   )
  )
  (loop $while-in5
   (if
    (i32.lt_s
     (get_local $0)
     (get_local $4)
    )
    (block
     (i32.store8
      (get_local $0)
      (get_local $1)
     )
     (set_local $0
      (i32.add
       (get_local $0)
       (i32.const 1)
      )
     )
     (br $while-in5)
    )
   )
  )
  (i32.sub
   (get_local $4)
   (get_local $2)
  )
 )
 (func $_sbrk (; 32 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (if
   (i32.or
    (i32.and
     (i32.gt_s
      (get_local $0)
      (i32.const 0)
     )
     (i32.lt_s
      (tee_local $0
       (i32.add
        (tee_local $1
         (i32.load
          (get_global $DYNAMICTOP_PTR)
         )
        )
        (get_local $0)
       )
      )
      (get_local $1)
     )
    )
    (i32.lt_s
     (get_local $0)
     (i32.const 0)
    )
   )
   (block
    (drop
     (call $abortOnCannotGrowMemory)
    )
    (call $___setErrNo
     (i32.const 12)
    )
    (return
     (i32.const -1)
    )
   )
  )
  (i32.store
   (get_global $DYNAMICTOP_PTR)
   (get_local $0)
  )
  (set_local $2
   (call $getTotalMemory)
  )
  (if
   (i32.gt_s
    (get_local $0)
    (get_local $2)
   )
   (if
    (i32.eqz
     (call $enlargeMemory)
    )
    (block
     (i32.store
      (get_global $DYNAMICTOP_PTR)
      (get_local $1)
     )
     (call $___setErrNo
      (i32.const 12)
     )
     (return
      (i32.const -1)
     )
    )
   )
  )
  (get_local $1)
 )
 (func $legalstub$_getArrayValue (; 33 ;) (; has Stack IR ;) (param $0 i32) (result f64)
  (f64.promote/f32
   (call $_getArrayValue
    (get_local $0)
   )
  )
 )
 (func $legalstub$_isInTriangle (; 34 ;) (; has Stack IR ;) (param $0 f64) (param $1 f64) (param $2 f64) (param $3 f64) (param $4 f64) (param $5 f64) (param $6 f64) (param $7 f64) (result i32)
  (call $_isInTriangle
   (f32.demote/f64
    (get_local $0)
   )
   (f32.demote/f64
    (get_local $1)
   )
   (f32.demote/f64
    (get_local $2)
   )
   (f32.demote/f64
    (get_local $3)
   )
   (f32.demote/f64
    (get_local $4)
   )
   (f32.demote/f64
    (get_local $5)
   )
   (f32.demote/f64
    (get_local $6)
   )
   (f32.demote/f64
    (get_local $7)
   )
  )
 )
 (func $legalstub$_setArrayValue (; 35 ;) (; has Stack IR ;) (param $0 i32) (param $1 f64)
  (call $_setArrayValue
   (get_local $0)
   (f32.demote/f64
    (get_local $1)
   )
  )
 )
)
