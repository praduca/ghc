// The ILX implementation of PrelGHC 

// This file isn't really preprocessed, but it's kept as a .pp file
// because .ilx files aren't precious, and may be deleted

.module 'PrelGHC.i_o'
.module extern 'PrelBase.i_o'
.classunion import [.module 'PrelBase.i_o']PrelBase_Bool {.alternative 'PrelBase_False' ()
.alternative 'PrelBase_True' ()}
.assembly extern 'mscorlib' { }

.namespace GHC {
   .class support {
      .method public static class [.module 'PrelBase.i_o']PrelBase_Bool mkBool (bool b) {
         ldarg b
         brtrue Ltrue
         newdata class [.module 'PrelBase.i_o']PrelBase_Bool, PrelBase_False()
         ret
        Ltrue:
         newdata class [.module 'PrelBase.i_o']PrelBase_Bool, PrelBase_True()
         ret
      }
      .method public static int32 IntGcdOp (int32,int32) {
             ldstr "WARNING: IntGcdOp called (warning! not yet implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
         ldc.i4 1
         ret
      }
      .method public static value class PrelGHC_Z2H<int32,int32> IntSubCOp(int32 a,int32 b)    {
              .locals(int32 r, int32 c)
             ldstr "WARNING: IntSubCOp called (warning! not yet tested properly)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
              //r=a-b
              ldarg a ldarg b sub stloc r
              //c = ((a^r) & (a^b)) >> 31
              ldloc r ldarg a xor ldarg a ldarg b xor and ldc.i4 31 shr.un stloc c
              //
             ldloc r ldloc c newobj void value class PrelGHC_Z2H<int32, int32 >::.ctor(!0,!1)
             ldstr "a = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldarg a   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "b = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldarg b   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "r = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldloc r   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "c = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldloc c   call void ['mscorlib']System.Console::WriteLine(int32)
              ret
       }
      .method public static value class PrelGHC_Z2H<int32,int32> IntAddCOp(int32 a,int32 b)    {
              .locals(int32 r, int32 c)
             ldstr "WARNING: IntAddCOp called (warning! not yet tested properly)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
              //r=a+b
              ldarg a ldarg b add stloc r
              //c = ((a^r) & ~(a^b)) >> 31
              ldloc r ldarg a xor ldarg a ldarg b xor not and ldc.i4 31 shr.un stloc c
              //
             ldloc r ldloc c  newobj void value class PrelGHC_Z2H<int32, int32 >::.ctor(!0,!1)
             ldstr "a = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldarg a   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "b = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldarg b   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "r = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldloc r   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "c = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldloc c   call void ['mscorlib']System.Console::WriteLine(int32)
              ret
       }

      // TODO: check me!!! test me!!!!
      .method public static value class PrelGHC_Z2H<int32,int32> IntMulCOp(int32 a,int32 b)    {
              .locals(int64 l, int32 r, int32 c)

             ldstr "WARNING: IntMulCOp called (warning! not yet tested properly)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)

              //r=(StgInt64)a * (StgInt64)b
              ldarg a conv.i8
              ldarg b conv.i8
              mul stloc l 
              //  r = z.i[R]
              //  c = z.i[C]
             ldloc l ldc.i8 0x80000000 rem conv.i4 stloc r
              ldloc l ldc.i8 0x80000000 div conv.i4 stloc c

             ldloc r ldloc c newobj void value class PrelGHC_Z2H<int32, int32 >::.ctor(!0,!1)
             ldstr "a = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldarg a   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "b = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldarg b   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "r = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldloc r   call void ['mscorlib']System.Console::WriteLine(int32)
             ldstr "c = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) ldloc c   call void ['mscorlib']System.Console::WriteLine(int32)
             ret

       }

      .method public static 
        // Return type
        !!0  
        // Method name
          'catch'<any,any>( thunk<(func ( /* unit skipped */ ) --> !!0)> f1, thunk<(func (!!1) --> (func ( /* unit skipped */ ) --> !!0))> f2)
      {
         .locals(!!0 res, !!1 exn)
                 //LOG ldstr "LOG: Entering catch..."   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
        .try {
           ldarg f1
           // ldunit
           callfunc () ( /* unit skipped */ ) --> !!0
           stloc res
                 //LOG ldstr "LOG: Leaving catch..."   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
           leave retA
        } catch [mscorlib]System.Object { 

          // exception of type !!1 should be on the stack??
           dup      ldstr "LOG: CAUGHT! , Exn = "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String) call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.Object)
          unbox.any !!1
          stloc exn
          leave retE
        }

        retA: 
             ldloc res
             ret

        retE: 
                 ldstr "LOG: CAUGHT! Executing handler..."   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
          ldarg f2
          ldloc exn
          tail. callfunc  () (!!1) --> !!0 
          ret

      }


      .method public static !!0 'unblockAsyncExceptions'<any>( thunk<(func ( /* unit skipped */ ) --> !!0)> f ) 
        {
             //ldstr "WARNING: unblockAsyncExceptions called (warning! not yet implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldarg f
             // ldunit
             tail. callfunc () ( /* unit skipped */ ) --> !!0
             ret
        }

      .method public static !!0 'blockAsyncExceptions'<any>( thunk<(func ( /* unit skipped */ ) --> !!0)> f ) 
        {
             //ldstr "WARNING: blockAsyncExceptions called (warning! not yet implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldarg f
             // ldunit
             tail. callfunc () ( /* unit skipped */ ) --> !!0
             ret
        }



      .method public static !!0 'takeMVar'<any> (class PrelGHC_MVarzh<!!0> mvar)
       {
             //ldstr "WARNING: takeMVar called (warning! locking not yet implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldarg mvar ldfld !0 class PrelGHC_MVarzh<!!0>::contents
             //LOG ldstr "LOG: takeMVar returned: "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String)             dup call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.Object)
             //LOG ldstr "LOG: for MVar: "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String)             ldarg mvar ldfld int32 class PrelGHC_MVarzh<!!0>::id call void ['mscorlib']System.Console::WriteLine(int32)
             ret
      }


      .method public static void 'putMVar'<any>(class PrelGHC_MVarzh<!!0> mvar ,!!0 v)
       {
             //ldstr "WARNING: putMVar called (warning! locking not yet implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
                ldarg mvar ldarg v stfld !0 class PrelGHC_MVarzh<!!0>::contents
             
             //LOG ldstr "LOG: putMVar put: "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String)             ldarg v call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.Object)
             //LOG ldstr "LOG: for MVar: "   call void ['mscorlib']System.Console::Write(class ['mscorlib']System.String)             ldarg mvar ldfld int32 class PrelGHC_MVarzh<!!0>::id call void ['mscorlib']System.Console::WriteLine(int32)
         ret
       }

      // Enter, if (null(Read)) Wait Exit
      .method public static value class PrelGHC_Z2H<int32,  !!0> 'tryTakeMVar'<any>(class PrelGHC_MVarzh<!!0> mvar)
       {
             ldstr "WARNING: tryTakeMVar called (locking not yet implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 1
             ldarg mvar ldfld !0 class PrelGHC_MVarzh<!!0>::contents
             newobj void value class PrelGHC_Z2H<int32,!!0>::.ctor(!0,!1)
             ret
       }


     // Enter, if (null(Read)) Wait Exit
      .method public static int32 'tryPutMVar'<any>(class PrelGHC_MVarzh<!!0> mvar, !!0 v)
       {
             ldstr "WARNING: tryPutMVar called (locking not yet implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 1
             ret
       }



      .method public static int32 isEmptyMVar<any>(class PrelGHC_MVarzh<!!0> mvar)
       {
             ldstr "WARNING: isEmptyMVar called (locking not yet implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0
             ret
       }


      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerAddOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerAddOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

      .method public static int32 IntegerCmpIntOp(int32, unsigned int8[], int32) {
             ldstr "WARNING: IntegerCmpIntOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 
             ret
       }
      .method public static int32 IntegerCmpOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerCmpOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 
             ret
       }
      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerSubOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerSubOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerMulOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerMulOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

      .method public static value class PrelGHC_Z4H<int32, unsigned int8[],int32, unsigned int8[]> IntegerQuotRemOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerQuotRemOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z4H<int32, unsigned int8[],int32, unsigned int8[]>::.ctor(!0,!1,!2,!3)
             ret
       }

      .method public static value class PrelGHC_Z4H<int32, unsigned int8[],int32, unsigned int8[]> IntegerDivModOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerDivModOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z4H<int32, unsigned int8[],int32, unsigned int8[]>::.ctor(!0,!1,!2,!3)
             ret
       }
      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerDivExactOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerDivExactOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull 
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }
      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerQuotOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerQuotOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull 
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }
      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerAndOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerAndOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerRemOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerRemOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }


       .method public static int32 Integer2IntOp(int32, unsigned int8[]) {
             ldstr "WARNING: Integer2IntOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0
             ret
       }

       .method public static unsigned int32 Integer2WordOp(int32, unsigned int8[]) {
             ldstr "WARNING: Integer2WordOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0
             ret
       }

        .method public static int64 IntegerToInt64Op(int32, unsigned int8[]) {
             ldstr "WARNING: IntegerToInt64Op called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i8 0
             ret
       }

       .method public static unsigned int64 IntegerToWord64Op(int32, unsigned int8[]) {
             ldstr "WARNING: IntegerToWord64Op called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i8 0
             ret
       }

      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> Int2IntegerOp(int32) {
             ldstr "WARNING: Integer2IntOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

       .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> Word2IntegerOp(unsigned int32) {
             ldstr "WARNING: Word2IntegerOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

        .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> Word64ToIntegerOp(unsigned int64) {
             ldstr "WARNING: Word64ToIntegerOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

        .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> Int64ToIntegerOp(int64) {
             ldstr "WARNING: Int64ToIntegerOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

    .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerOrOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerOrOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

     .method public static int32 IntegerIntGcdOp(int32, unsigned int8[], int32) {
             ldstr "WARNING: IntegerOrOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 
             ret
       }
      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerXorOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerXorOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerGcdOp(int32, unsigned int8[], int32, unsigned int8[]) {
             ldstr "WARNING: IntegerGcdOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

      .method public static value class PrelGHC_Z2H<int32, unsigned int8[]> IntegerComplementOp(int32, unsigned int8[]) {
             ldstr "WARNING: IntegerComplementOp called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z2H<int32, unsigned int8[]>::.ctor(!0,!1)
             ret
       }

      .method public static value class PrelGHC_Z3H<int32,int32,  unsigned int8[]> decodeFloat(float32 f) {
             ldstr "WARNING: decodeFloat called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldarg f conv.r8 call float64 [mscorlib]System.Math::Abs(float64) call float64 [mscorlib]System.Math::Log(float64) conv.i4 
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z3H<int32,int32,  unsigned int8[]>::.ctor(!0,!1,!2)
             ret
       }

      .method public static value class PrelGHC_Z3H<int32,int32,  unsigned int8[]> decodeDouble(float64 f) {
             ldstr "WARNING: decodeDouble called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
             ldarg f  call float64 [mscorlib]System.Math::Abs(float64) call float64 [mscorlib]System.Math::Log(float64) conv.i4 
             ldc.i4 0 ldnull
             newobj void value class PrelGHC_Z3H<int32,int32,  unsigned int8[]>::.ctor(!0,!1,!2)
             ret
       }


      .method public static !!0[] newArray<any>(int32 n, !!0 x)  {
           .locals(int32 i, !!0[] res)
           ldarg n
           newarr !!0
           stloc res
           ldc.i4 0
           stloc i
loop:
           ldarg n
           ldloc i
           beq end
           ldloc res
           ldloc i
           ldarg x
           stelem.any !!0
           br loop
end:
           ldloc res
           ret
       }


      .method public static int32 dataToTag<any>(!!0 x)    {
           ldstr "WARNING: dataToTag called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
              ldc.i4 0
              ret
       }
      .method public static !!0 tagToEnum<any>(int32)    {
           ldstr "WARNING: tagToEnum called (not implemented)"   call void ['mscorlib']System.Console::WriteLine(class ['mscorlib']System.String)
              ldnull
              ret
       }
   }
}

//--------------------------------------------
// Builtin classes

.class public 'PrelGHC_MVarzh'<any> {
  .field public !0 contents
  .field public int32 id
  .field static public int32 ids
    .method public rtspecialname specialname instance void .ctor() {
       ldarg 0
       ldsfld int32 class PrelGHC_MVarzh::ids
       ldc.i4 1
       add
       dup
        stsfld int32 class PrelGHC_MVarzh::ids
       stfld int32 class PrelGHC_MVarzh<!0>::id

       ret 
    }
}

.class public 'PrelGHC_StablePtrzh' /* <any> */ {
  .field public class [mscorlib]System.Object contents
    .method public rtspecialname specialname instance void .ctor(class [mscorlib]System.Object) {
       ldarg 0 ldarg 1 stfld class [mscorlib]System.Object class PrelGHC_StablePtrzh::contents
       ret 
    }
}

.class public 'PrelGHC_StableNamezh' /* <any> */ {
    .method public rtspecialname specialname instance void .ctor() {
       ret 
    }
}

.class public 'PrelGHC_Foreignzh' {
  .field public void * contents
    .method public rtspecialname specialname instance void .ctor(void *) {
       ldarg 0 ldarg 1 stfld void * class PrelGHC_Foreignzh::contents
       ret 
    }
}

// TODO
.class public 'PrelGHC_Weakzh'<any> {
  .field public !0 contents
   .field public thunk<(func ( /* unit skipped */ ) --> class [.module 'PrelBase.i_o']PrelBase_Z0T)> _finalizer
   .method public rtspecialname specialname instance void .ctor(!0 x, thunk<(func ( /* unit skipped */ ) --> class [.module 'PrelBase.i_o']PrelBase_Z0T)> f) {
       ldarg 0 ldarg x stfld !0 class PrelGHC_Weakzh<!0>::contents
       ldarg 0 ldarg f stfld thunk<(func ( /* unit skipped */ ) --> class [.module 'PrelBase.i_o']PrelBase_Z0T)> class PrelGHC_Weakzh<!0>::_finalizer
       ret 
    }
   .method public static  value class PrelGHC_Z2H<int32,thunk<(func ( /* unit skipped */ ) --> class [.module 'PrelBase.i_o']PrelBase_Z0T)>> finalizer<any>(class PrelGHC_Weakzh<!!0>) { 
       ldc.i4 1
       ldarg 0 ldfld thunk<(func ( /* unit skipped */ ) --> class [.module 'PrelBase.i_o']PrelBase_Z0T)> class PrelGHC_Weakzh<!!0>::_finalizer
         newobj void value class PrelGHC_Z2H<int32,thunk<(func ( /* unit skipped */ ) --> class [.module 'PrelBase.i_o']PrelBase_Z0T)>>::.ctor(!0,!1)
       ret
   }
   .method public static value class PrelGHC_Z2H<int32,!!0> deref<any>(class PrelGHC_Weakzh<!!0>) { 
       ldc.i4 1
       ldarg 0 ldfld !0 class PrelGHC_Weakzh<!!0>::contents
       newobj void  value class PrelGHC_Z2H<int32,!!0>::.ctor(!0,!1)
       ret
   }
   .method public  static  
       class PrelGHC_Weakzh<!!1>
           bake<any,any>(!!0,!!1 obj,thunk<(func () --> class [.module 'PrelBase.i_o']PrelBase_Z0T)> finalizer) {
         ldarg obj 
         ldarg finalizer
         newobj void class 'PrelGHC_Weakzh'<!!1>::.ctor(!0 x, thunk<(func ( /* unit skipped */ ) --> class [.module 'PrelBase.i_o']PrelBase_Z0T)>) 
         ret 
   }

}

.class public 'PrelGHC_MutVarzh'<any> { 
  .field public !0 contents
    .method public rtspecialname specialname instance void .ctor(!0) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_MutVarzh<!0>::contents
       ret 
    }
}

.class public PrelGHC_ZCTCCallable<any> {
}

.class public PrelGHC_BCOzh {
}

.class public PrelGHC_ZCTCReturnable<any> {
}


//------------------------------------------------------------
// Builtin Unboxed Tuple Types

.class value sealed  'PrelGHC_Z1H' <any>  extends ['mscorlib']System.ValueType { 
    .method public rtspecialname specialname instance void .ctor(!0) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z1H<!0>::fld0
       ret 
    }
   .field public !0 fld0
}

.class value sealed 'PrelGHC_Z2H' <any,any> extends ['mscorlib']System.ValueType  { 
    .method public rtspecialname specialname instance void .ctor(!0,!1) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z2H<!0,!1>::fld0
       ldarg 0 ldarg 2 stfld !1 class PrelGHC_Z2H<!0,!1>::fld1
       ret 
    }
   .field public !0 fld0
   .field public !1 fld1
}

.class value sealed 'PrelGHC_Z3H' <any,any,any>  extends ['mscorlib']System.ValueType { 
    .method public rtspecialname specialname instance void .ctor(!0,!1,!2) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z3H<!0,!1,!2>::fld0
       ldarg 0 ldarg 2 stfld !1 class PrelGHC_Z3H<!0,!1,!2>::fld1
       ldarg 0 ldarg 3 stfld !2 class PrelGHC_Z3H<!0,!1,!2>::fld2
       ret 
    }
   .field public !0 fld0
   .field public !1 fld1
   .field public !2 fld2
}

.class value sealed 'PrelGHC_Z4H' <any,any,any,any>  extends ['mscorlib']System.ValueType { 
    .method public rtspecialname specialname instance void .ctor(!0,!1,!2,!3) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z4H<!0,!1,!2,!3>::fld0
       ldarg 0 ldarg 2 stfld !1 class PrelGHC_Z4H<!0,!1,!2,!3>::fld1
       ldarg 0 ldarg 3 stfld !2 class PrelGHC_Z4H<!0,!1,!2,!3>::fld2
       ldarg 0 ldarg 4 stfld !3 class PrelGHC_Z4H<!0,!1,!2,!3>::fld3
       ret 
    }
   .field public !0 fld0
   .field public !1 fld1
   .field public !2 fld2
   .field public !3 fld3
}

.class value sealed 'PrelGHC_Z5H' <any,any,any,any,any>  extends ['mscorlib']System.ValueType { 
    .method public rtspecialname specialname instance void .ctor(!0,!1,!2,!3,!4) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z5H<!0,!1,!2,!3,!4>::fld0
       ldarg 0 ldarg 2 stfld !1 class PrelGHC_Z5H<!0,!1,!2,!3,!4>::fld1
       ldarg 0 ldarg 3 stfld !2 class PrelGHC_Z5H<!0,!1,!2,!3,!4>::fld2
       ldarg 0 ldarg 4 stfld !3 class PrelGHC_Z5H<!0,!1,!2,!3,!4>::fld3
       ldarg 0 ldarg 5 stfld !4 class PrelGHC_Z5H<!0,!1,!2,!3,!4>::fld4
       ret 
    }
   .field public !0 fld0
   .field public !1 fld1
   .field public !2 fld2
   .field public !3 fld3
   .field public !4 fld4
}

.class value sealed 'PrelGHC_Z6H' <any,any,any,any,any,any>  extends ['mscorlib']System.ValueType { 
   .method public rtspecialname specialname instance void .ctor(!0,!1,!2,!3,!4,!5) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z6H<!0,!1,!2,!3,!4,!5>::fld0
       ldarg 0 ldarg 2 stfld !1 class PrelGHC_Z6H<!0,!1,!2,!3,!4,!5>::fld1
       ldarg 0 ldarg 3 stfld !2 class PrelGHC_Z6H<!0,!1,!2,!3,!4,!5>::fld2
       ldarg 0 ldarg 4 stfld !3 class PrelGHC_Z6H<!0,!1,!2,!3,!4,!5>::fld3
       ldarg 0 ldarg 5 stfld !4 class PrelGHC_Z6H<!0,!1,!2,!3,!4,!5>::fld4
       ldarg 0 ldarg 6 stfld !5 class PrelGHC_Z6H<!0,!1,!2,!3,!4,!5>::fld5
       ret 
    }
   .field public !0 fld0
   .field public !1 fld1
   .field public !2 fld2
   .field public !3 fld3
   .field public !4 fld4
   .field public !5 fld5
}

.class value sealed 'PrelGHC_Z7H' <any,any,any,any,any,any,any>  extends ['mscorlib']System.ValueType { 
   .method public rtspecialname specialname instance void .ctor(!0,!1,!2,!3,!4,!5,!6) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z7H<!0,!1,!2,!3,!4,!5,!6>::fld0
       ldarg 0 ldarg 2 stfld !1 class PrelGHC_Z7H<!0,!1,!2,!3,!4,!5,!6>::fld1
       ldarg 0 ldarg 3 stfld !2 class PrelGHC_Z7H<!0,!1,!2,!3,!4,!5,!6>::fld2
       ldarg 0 ldarg 4 stfld !3 class PrelGHC_Z7H<!0,!1,!2,!3,!4,!5,!6>::fld3
       ldarg 0 ldarg 5 stfld !4 class PrelGHC_Z7H<!0,!1,!2,!3,!4,!5,!6>::fld4
       ldarg 0 ldarg 6 stfld !5 class PrelGHC_Z7H<!0,!1,!2,!3,!4,!5,!6>::fld5
       ldarg 0 ldarg 7 stfld !6 class PrelGHC_Z7H<!0,!1,!2,!3,!4,!5,!6>::fld6
       ret 
    }
   .field public !0 fld0
   .field public !1 fld1
   .field public !2 fld2
   .field public !3 fld3
   .field public !4 fld4
   .field public !5 fld5
   .field public !6 fld6
}

.class value sealed 'PrelGHC_Z8H' <any,any,any,any,any,any,any,any>  extends ['mscorlib']System.ValueType { 
   .method public rtspecialname specialname instance void .ctor(!0,!1,!2,!3,!4,!5,!6,!7) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z8H<!0,!1,!2,!3,!4,!5,!6,!7>::fld0
       ldarg 0 ldarg 2 stfld !1 class PrelGHC_Z8H<!0,!1,!2,!3,!4,!5,!6,!7>::fld1
       ldarg 0 ldarg 3 stfld !2 class PrelGHC_Z8H<!0,!1,!2,!3,!4,!5,!6,!7>::fld2
       ldarg 0 ldarg 4 stfld !3 class PrelGHC_Z8H<!0,!1,!2,!3,!4,!5,!6,!7>::fld3
       ldarg 0 ldarg 5 stfld !4 class PrelGHC_Z8H<!0,!1,!2,!3,!4,!5,!6,!7>::fld4
       ldarg 0 ldarg 6 stfld !5 class PrelGHC_Z8H<!0,!1,!2,!3,!4,!5,!6,!7>::fld5
       ldarg 0 ldarg 7 stfld !6 class PrelGHC_Z8H<!0,!1,!2,!3,!4,!5,!6,!7>::fld6
       ldarg 0 ldarg 8 stfld !7 class PrelGHC_Z8H<!0,!1,!2,!3,!4,!5,!6,!7>::fld7
       ret 
    }
   .field public !0 fld0
   .field public !1 fld1
   .field public !2 fld2
   .field public !3 fld3
   .field public !4 fld4
   .field public !5 fld5
   .field public !6 fld6
   .field public !7 fld7
}


// Phew...This is needed by the optimized Haskell library....
// - TODO: fill in the rest!
.class value sealed 'PrelGHC_Z18H' <any,any,any,any,any,any,any,any,any,any,any,any,any,any,any,any,any,any>  extends ['mscorlib']System.ValueType { 
   .method public rtspecialname specialname instance void .ctor(!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17) {
       ldarg 0 ldarg 1 stfld !0 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld0
       ldarg 0 ldarg 2 stfld !1 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld1
       ldarg 0 ldarg 3 stfld !2 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld2
       ldarg 0 ldarg 4 stfld !3 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld3
       ldarg 0 ldarg 5 stfld !4 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld4
       ldarg 0 ldarg 6 stfld !5 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld5
       ldarg 0 ldarg 7 stfld !6 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld6
       ldarg 0 ldarg 8 stfld !7 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld7
       ldarg 0 ldarg 9 stfld !8 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld8
       ldarg 0 ldarg 10 stfld !9 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld9
       ldarg 0 ldarg 11 stfld !10 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld10
       ldarg 0 ldarg 12 stfld !11 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld11
       ldarg 0 ldarg 13 stfld !12 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld12
       ldarg 0 ldarg 14 stfld !13 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld13
       ldarg 0 ldarg 15 stfld !14 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld14
       ldarg 0 ldarg 16 stfld !15 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld15
       ldarg 0 ldarg 17 stfld !16 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld16
       ldarg 0 ldarg 18 stfld !17 class PrelGHC_Z18H<!0,!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!12,!13,!14,!15,!16,!17>::fld17
       ret 
    }
   .field public !0 fld0
   .field public !1 fld1
   .field public !2 fld2
   .field public !3 fld3
   .field public !4 fld4
   .field public !5 fld5
   .field public !6 fld6
   .field public !7 fld7
   .field public !8 fld8
   .field public !9 fld9
   .field public !10 fld10
   .field public !11 fld11
   .field public !12 fld12
   .field public !13 fld13
   .field public !14 fld14
   .field public !15 fld15
   .field public !16 fld16
   .field public !17 fld17

}

.classunion '()' extends thunk<class '()'>  { 
   .alternative '()'()
}

