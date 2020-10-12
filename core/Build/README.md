The [Build](./Build/README.md) package provides the compiler and associated program building and debugging tools for Oberon.


#### [MODULE ORS](https://github.com/io-core/Build/blob/main/ORS.Mod)
##### Procedures:
* CopyId*(VAR ident: Ident)
* Pos*(): LONGINT
* Mark*(msg: ARRAY OF CHAR)
* Get*(VAR sym: INTEGER)
* Init*(T: Texts.Text; pos: LONGINT)

#### [MODULE ORTool](https://github.com/io-core/Build/blob/main/ORTool.Mod)
##### Procedures:
* DecSym*  (*decode symbol file*)
* DecObj*   (*decode object file*)
* DecMod*

#### [MODULE ORB](https://github.com/io-core/Build/blob/main/ORB.Mod)
##### Procedures:
* NewObj*(VAR obj: Object; id: ORS.Ident; class: INTEGER)  (*insert new Object with name id*)
* thisObj*(): Object
* thisimport*(mod: Object): Object
* thisfield*(rec: Type): Object
* FindFld*(id: ORS.Ident; rec: Type): Object  (*search id in fields of rec proper, but not its base types*)
* NofMethods*(rec: Type): INTEGER  (*number of methods bound to rec and its base types*)
* NewMethod*(rec: Type; VAR mth, redef: Object; id: ORS.Ident)  (*insert new method with name id*)
* OpenScope*
* CloseScope*
* MakeFileName*(VAR FName: ORS.Ident; name, ext: ARRAY OF CHAR)
* Import*(VAR modid, modid1: ORS.Ident)
* Export*(VAR modid: ORS.Ident; VAR newSF: BOOLEAN; VAR key: LONGINT)
* Init*

#### [MODULE ORG](https://github.com/io-core/Build/blob/main/ORG.Mod)
##### Procedures:
* CheckRegs*
* FixLink*(L: LONGINT) (*fixup with offset to pc*)
* MakeConstItem*(VAR x: Item; typ: ORB.Type; val: LONGINT)
* MakeRealItem*(VAR x: Item; val: REAL)
* MakeStringItem*(VAR x: Item; len: LONGINT)  (*copies string from ORS-buffer to ORG-string array*)
* MakeItem*(VAR x: Item; y: ORB.Object; curlev: LONGINT)
* Field*(VAR x: Item; y: ORB.Object)   (* x := x.y *)
* Index*(VAR x, y: Item)   (* x := x[y] *)
* DeRef*(VAR x: Item)
* Method*(VAR x: Item; y: ORB.Object; wasderef, super: BOOLEAN)
* TypeTest*(VAR x: Item; T: ORB.Type; varpar, isguard: BOOLEAN)
* Not*(VAR x: Item)   (* x :=  x *)
* And1*(VAR x: Item)   (* x := x & *)
* And2*(VAR x, y: Item)
* Or1*(VAR x: Item)   (* x := x OR *)
* Or2*(VAR x, y: Item)
* Neg*(VAR x: Item)   (* x := -x *)
* AddOp*(op: LONGINT; VAR x, y: Item)   (* x := x +- y *)
* MulOp*(VAR x, y: Item)   (* x := x * y *)
* DivOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)
* RealOp*(op: INTEGER; VAR x, y: Item)   (* x := x op y *)
* Singleton*(VAR x: Item)  (* x := {x} *)
* Set*(VAR x, y: Item)   (* x := {x .. y} *)
* In*(VAR x, y: Item)  (* x := x IN y *)
* SetOp*(op: LONGINT; VAR x, y: Item)   (* x := x op y *)
* IntRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)
* RealRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)
* StringRelation*(op: INTEGER; VAR x, y: Item)   (* x := x < y *)
* StrToChar*(VAR x: Item)
* Store*(VAR x, y: Item) (* x := y *)
* StoreStruct*(VAR x, y: Item) (* x := y, frame = 0 *)
* StoreToInterface*(VAR x, y: Item) (* x.type.form = ORB.Interface, y.type.form = ORB.Pointer *) (* TODO: Build interface table *)
* CopyString*(VAR x, y: Item)  (* x := y, frame = 0 *) 
* OpenArrayParam*(VAR x: Item)
* VarParam*(VAR x: Item; ftype: ORB.Type)
* ValueParam*(VAR x: Item)
* StringParam*(VAR x: Item)
* ReceiverParam*(VAR x: Item; par: ORB.Object)
* For0*(VAR x, y: Item)
* For1*(VAR x, y, z, w: Item; VAR L: LONGINT)
* For2*(VAR x, y, w: Item)
* Here*(): LONGINT
* FJump*(VAR L: LONGINT)
* CFJump*(VAR x: Item)
* BJump*(L: LONGINT)
* CBJump*(VAR x: Item; L: LONGINT)
* Fixup*(VAR x: Item)
* PrepCall*(VAR x: Item; VAR r: LONGINT)
* Call*(VAR x: Item; r: LONGINT)
* Enter*(parblksize, locblksize: LONGINT; int: BOOLEAN)
* Return*(form: INTEGER; VAR x: Item; size: LONGINT; int: BOOLEAN)
* CaseHead*(VAR x: Item; VAR L0: LONGINT)
* CaseTail*(L0, L1: LONGINT; n: INTEGER; VAR tab: ARRAY OF LabelRange)  (*L1 = label for else*)
* Increment*(upordown: LONGINT; VAR x, y: Item)
* Include*(inorex: LONGINT; VAR x, y: Item)
* Assert*(VAR x: Item)
* New*(VAR x, y: Item)
* Pack*(VAR x, y: Item)
* Unpk*(VAR x, y: Item)
* Led*(VAR x: Item)
* Get*(VAR x, y: Item)
* Put*(VAR x, y: Item)
* Copy*(VAR x, y, z: Item)
* LDPSR*(VAR x: Item)
* LDREG*(VAR x, y: Item)
* Abs*(VAR x: Item)
* Odd*(VAR x: Item)
* Floor*(VAR x: Item)
* Float*(VAR x: Item)
* Ord*(VAR x: Item)
* Len*(VAR x: Item)
* Shift*(fct: LONGINT; VAR x, y: Item)
* ADC*(VAR x, y: Item)
* SBC*(VAR x, y: Item)
* UML*(VAR x, y: Item)
* Bit*(VAR x, y: Item)
* Register*(VAR x: Item)
* H*(VAR x: Item)
* Adr*(VAR x: Item)
* Condition*(VAR x: Item)
* Open*(v: INTEGER)
* SetDataSize*(dc: LONGINT)
* Header*
* Close*(VAR modid: ORS.Ident; key, nofent: LONGINT)

#### [MODULE ORP](https://github.com/io-core/Build/blob/main/ORP.Mod)
##### Procedures:
* Compile*

#### [MODULE Linker](https://github.com/io-core/Build/blob/main/Linker.Mod)
##### Procedures:
* LinkOne*(name: ARRAY OF CHAR; VAR newmod: Modules.Module)
* Link*
* ThisCommand*(mod: Modules.Module; name: ARRAY OF CHAR): Modules.Command