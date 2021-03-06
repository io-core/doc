
## [MODULE VaultFrames](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod)

  ## Imports:
` SYSTEM Display Viewers Input Fonts Texts Vaults Oberon MenuViewers`

## Constants:
```
 (*update message ids*)
    drawdocument = 1; drawdocuments = 2; drawdocumentd = 3;
    drawnorm = 4; drawsel = 5; drawdel = 6;

    markW = 5;

```
## Types:
```

    Frame* = POINTER TO FrameDesc;
    Location* = POINTER TO LocDesc;

    LocDesc* = RECORD
        x*, y*: INTEGER;
        next*: Location
      END ;

    FrameDesc* = RECORD (Display.FrameDesc)
        vault*: Vaults.Vault;
        Xg*, Yg*: INTEGER;  (*pos rel to vault origin*)
        X1*, Y1*: INTEGER;  (*right and upper margins*)
        x*, y*, col*: INTEGER;  (*x = X + Xg, y = Y + Yg*)
        marked*, ticked*: BOOLEAN;
        mark*: LocDesc
      END ;

    DrawMsg* = RECORD (Vaults.Msg)
        f*: Frame;
        x*, y*, col*, mode*: INTEGER
      END ;

    UpdateMsg = RECORD (Display.FrameMsg)
        id: INTEGER;
        vault: Vaults.Vault;
        document: Vaults.Document
      END ;

    ChangedMsg = RECORD (Display.FrameMsg)
        f: Frame;
        vault: Vaults.Vault;
        mode: INTEGER
      END ;

    SelQuery = RECORD (Display.FrameMsg)
        f: Frame; time: LONGINT
      END ;

    FocusQuery = RECORD (Display.FrameMsg)
        f: Frame
      END ;

    PosQuery = RECORD (Display.FrameMsg)
        f: Frame; x, y: INTEGER
      END ;

    DispMsg = RECORD (Display.FrameMsg)
        x1, y1, w: INTEGER;
        pat: INTEGER;
        vault: Vaults.Vault
      END ;

```
## Variables:
```
 Crosshair*: Oberon.Marker;
    tack*, dotted*, dotted1*: INTEGER;  (*patterns*)
    (* newcap: Graphics.Caption; *)
    TBuf: Texts.Buffer;
    DW, DH, CL: INTEGER;
    w: Texts.Writer;

```
## Procedures:
---
## ---------- Oberon Message Handling

`  PROCEDURE SetChangeMark(f: Frame; col: INTEGER); (*set mark in corner of frame*)` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L83)


`  PROCEDURE Restore*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L92)


`  PROCEDURE FlipCross(X, Y: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L109)


`  PROCEDURE Focus*(): Frame;` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L120)


`  PROCEDURE Selected*(): Frame;` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L125)


`  PROCEDURE This*(x, y: INTEGER): Frame;` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L130)


`  PROCEDURE Mark(f: Frame; mode: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L135)


`  PROCEDURE Draw*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L140)


`  PROCEDURE DrawNorm(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L145)


`  PROCEDURE Erase*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L150)


`  PROCEDURE DrawDocument*(f: Frame; L: Vaults.Document);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L155)


`  PROCEDURE EraseDocument*(f: Frame; D: Vaults.Document);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L160)


`  PROCEDURE Change*(f: Frame; VAR msg: Vaults.Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L165)


`  PROCEDURE FlipMark(x, y: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L170)


`  PROCEDURE Defocus*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L176)


`  PROCEDURE Deselect*(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L186)


`  PROCEDURE Edit(f: Frame; x0, y0: INTEGER; k0: SET);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L195)


`  PROCEDURE NewCaption(f: Frame; col: INTEGER; font: Fonts.Font);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L290)


`  PROCEDURE InsertChar(f: Frame; codepoint: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L298)


`  PROCEDURE DeleteChar(f: Frame);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L308)


`  PROCEDURE GetSelection(f: Frame; VAR text: Texts.Text; VAR beg, end: (*, time:*) LONGINT);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L329)


`  PROCEDURE Handle*(f: Display.Frame; VAR m: Display.FrameMsg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L339)


`  PROCEDURE Store*(f: Frame; name: ARRAY OF CHAR);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L399)


`  PROCEDURE ReplConst*(F: Frame; col, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L405)


`  PROCEDURE ReplPattern*(F: Frame; col, patadr, x, y, w, h, mode: INTEGER);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L414)


`  PROCEDURE DrawLine(obj: Vaults.Document; VAR m: Vaults.Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L423)


`  PROCEDURE DrawCaption(obj: Vaults.Document; VAR m: Vaults.Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L445)


`  PROCEDURE DrawMacro(obj: Vaults.Document; VAR m: Vaults.Msg);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L477)


`  PROCEDURE Open*(f: Frame; V: Vaults.Vault);` [(source)](https://github.com/io-core/Crypto/blob/main/VaultFrames.Mod#L500)

