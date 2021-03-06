## Edit
This package manages the text and font handling in Oberon.


### _Package Overview:_
The Edit package provides:

* The 'text' abstraction for manipulating textual content
* TextFrames for interacting with text via the GUI
* The Edit tool for interacting with documents
* The font mechanism in Oberon

### _Package Use:_

USAGE:
```
Edit.Open example.txt
```

### _Modules in this package:_

#### [MODULE Edit](https://github.com/io-core/doc/blob/main/core/Edit/Edit.md) [(source)](https://github.com/io-core/Edit/blob/main/Edit.Mod)
Module Edit provides document editing capability.


  **imports:** ` Files Fonts Texts Display Viewers Oberon MenuViewers TextFrames`

**Procedures:**
```
  Open*

  Store*

  CopyLooks*

  ChangeFont*

  ChangeColor*

  ChangeOffset*

  Search*  (*uses global variables M, pat, d for Boyer-Moore search*)

  Locate*

  Recall*

  InsertUnicode*

```


#### [MODULE Fonts](https://github.com/io-core/doc/blob/main/core/Edit/Fonts.md) [(source)](https://github.com/io-core/Edit/blob/main/Fonts.Mod)

  **imports:** ` SYSTEM Files`

**Procedures:**
```
  GetUniPat*(fnt: Font; codepoint: INTEGER; VAR dx, x, y, w, h, patadr: INTEGER)

  This*(name: ARRAY OF CHAR): Font

  Free*  (*remove all but first two from font list*)

```


#### [MODULE TextFrames](https://github.com/io-core/doc/blob/main/core/Edit/TextFrames.md) [(source)](https://github.com/io-core/Edit/blob/main/TextFrames.Mod)
Module TextFrames implements the operations on text frames in Oberon.

This is the heart of Oberon's text-based user interface.


  **imports:** ` Modules Input Display Viewers Fonts Texts Oberon MenuViewers`

**Procedures:**
```
  Mark* (F: Frame; on: BOOLEAN)

  Restore* (F: Frame)

  Suspend* (F: Frame)

  Extend* (F: Frame; newY: INTEGER)

  Reduce* (F: Frame; newY: INTEGER)

  Show* (F: Frame; pos: LONGINT)

  Pos* (F: Frame; X, Y: INTEGER): LONGINT

  SetCaret* (F: Frame; pos: LONGINT)

  TrackCaret* (F: Frame; X, Y: INTEGER; VAR keysum: SET)

  RemoveCaret* (F: Frame)

  SetSelection* (F: Frame; beg, end: LONGINT)

  TrackSelection* (F: Frame; X, Y: INTEGER; VAR keysum: SET)

  RemoveSelection* (F: Frame)

  TrackLine* (F: Frame; X, Y: INTEGER; VAR org: LONGINT; VAR keysum: SET)

  TrackWord* (F: Frame; X, Y: INTEGER; VAR pos: LONGINT; VAR keysum: SET)

  Replace* (F: Frame; beg, end: LONGINT)

  Insert* (F: Frame; beg, end: LONGINT)

  Delete* (F: Frame; beg, end: LONGINT)

  Recall*(VAR B: Texts.Buffer)

  NotifyDisplay* (T: Texts.Text; op: INTEGER; beg, end: LONGINT)

  Call* (F: Frame; pos: LONGINT; new: BOOLEAN)

  Write* (F: Frame; codepoint: INTEGER; fnt: Fonts.Font; col, voff: INTEGER)

  Defocus* (F: Frame)

  Neutralize* (F: Frame)

  Modify* (F: Frame; id, dY, Y, H: INTEGER)

  Open* (F: Frame; H: Display.Handler; T: Texts.Text; org: LONGINT

  Copy* (F: Frame; VAR F1: Frame)

  GetSelection* (F: Frame; VAR text: Texts.Text; VAR beg, end, time: LONGINT)

  Update* (F: Frame; VAR M: UpdateMsg)

  Edit* (F: Frame; X, Y: INTEGER; Keys: SET)

  Handle* (F: Display.Frame; VAR M: Display.FrameMsg)

  Text* (name: ARRAY OF CHAR): Texts.Text

  NewMenu* (name, commands: ARRAY OF CHAR): Frame

  NewText* (text: Texts.Text; pos: LONGINT): Frame

```


#### [MODULE Texts](https://github.com/io-core/doc/blob/main/core/Edit/Texts.md) [(source)](https://github.com/io-core/Edit/blob/main/Texts.Mod)
Module Texts defines the 'text' abstract data type used pervasively in the Oberon system.


  **imports:** ` Files Fonts`

**Procedures:**
```
  Load* (VAR R: Files.Rider; T: Text)

  Open* (T: Text; name: ARRAY OF CHAR)

  Store* (VAR W: Files.Rider; T: Text)

  Close*(T: Text; name: ARRAY OF CHAR)

  OpenBuf* (B: Buffer)

  Save* (T: Text; beg, end: LONGINT; B: Buffer)

  Copy* (SB, DB: Buffer)

  Insert* (T: Text; pos: LONGINT; B: Buffer)

  Append* (T: Text; B: Buffer)

  Delete* (T: Text; beg, end: LONGINT; B: Buffer)

  ChangeLooks* (T: Text; beg, end: LONGINT; sel: SET; fnt: Fonts.Font; col, voff: INTEGER)

  Attributes*(T: Text; pos: LONGINT; VAR fnt: Fonts.Font; VAR col, voff: INTEGER)

  OpenReader* (VAR R: Reader; T: Text; pos: LONGINT)

  Read* (VAR R: Reader; VAR ch: CHAR)

  UnicodeWidth* (codepoint: INTEGER): INTEGER

  ReadUnicode* (VAR R: Reader; VAR codepoint: INTEGER)

  Pos* (VAR R: Reader): LONGINT

  OpenScanner* (VAR S: Scanner; T: Text; pos: LONGINT)

  Scan* (VAR S: Scanner)

  OpenWriter* (VAR W: Writer)

  SetFont* (VAR W: Writer; fnt: Fonts.Font)

  SetColor* (VAR W: Writer; col: INTEGER)

  SetOffset* (VAR W: Writer; voff: INTEGER)

  Write* (VAR W: Writer; ch: CHAR)

  WriteUnicode* (VAR W: Writer; codepoint: INTEGER)

  WriteLn* (VAR W: Writer)

  WriteString* (VAR W: Writer; s: ARRAY OF CHAR)

  WriteInt* (VAR W: Writer; x, n: LONGINT)

  WriteHex* (VAR W: Writer; x: LONGINT)

  WriteReal* (VAR W: Writer; x: REAL; n: INTEGER)

  WriteRealFix* (VAR W: Writer; x: REAL; n, k: INTEGER)

  WriteClock* (VAR W: Writer; d: LONGINT)

```


#### [MODULE ConvertPCFFont](https://github.com/io-core/doc/blob/main/core/Edit/ConvertPCFFont.md) [(source)](https://github.com/io-core/Edit/blob/main/ConvertPCFFont.Mod)

  **imports:** ` Files Texts Oberon`

**Procedures:**
```
  Convert*

  ConvertASCIIOnly*

```


#### [MODULE FontSubsetBuilder](https://github.com/io-core/doc/blob/main/core/Edit/FontSubsetBuilder.md) [(source)](https://github.com/io-core/Edit/blob/main/FontSubsetBuilder.Mod)

  **imports:** ` Files Texts Oberon`

**Procedures:**
```
  Extract*

```


#### [MODULE GrowFont](https://github.com/io-core/doc/blob/main/core/Edit/GrowFont.md) [(source)](https://github.com/io-core/Edit/blob/main/GrowFont.Mod)

  **imports:** ` SYSTEM Files Texts Oberon`

**Procedures:**
```
  X2*

  X3*

  EPX2*

  EPX3*

  Eagle*

  Scale2SFX*

  Scale3SFX*

```


#### [MODULE OptimizeFont](https://github.com/io-core/doc/blob/main/core/Edit/OptimizeFont.md) [(source)](https://github.com/io-core/Edit/blob/main/OptimizeFont.Mod)

  **imports:** ` Files Texts Oberon`

**Procedures:**
```
  Optimize*

```
