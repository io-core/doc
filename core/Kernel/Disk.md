
## [MODULE Disk](https://github.com/io-core/Kernel/blob/main/Disk.Mod)

  ## Imports:
` SYSTEM`

## Constants:
```
 SectorLength* = 1024;
    spiData = -48; spiCtrl = -44;
    CARD0 = 1; SPIFAST = 4;
    FSoffset = 80000H; (*256MB in 512-byte blocks*)
    mapsize = 10000H; (*1K sectors, 64MB*)

```
## Types:
```
 Sector* = ARRAY SectorLength OF BYTE;

```
## Variables:
```
 NofSectors*: INTEGER;
    data: INTEGER; (*SPI data in*)
    sectorMap: ARRAY mapsize DIV 32 OF SET;

```
## Procedures:
---

`  PROCEDURE SPIIdle(n: INTEGER); (*send n FFs slowly with no card selected*)` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L19)


`  PROCEDURE SPI(n: INTEGER); (*send&rcv byte slowly with card selected*)` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L27)


`  PROCEDURE SPICmd(n, arg: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L33)


`  PROCEDURE SDShift(VAR n: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L45)


`  PROCEDURE ReadSD(src, dst: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L53)


`  PROCEDURE WriteSD(dst, src: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L67)


`  PROCEDURE InitSecMap*;` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L81)


`  PROCEDURE MarkSector*(sec: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L87)


`  PROCEDURE FreeSector*(sec: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L92)


`  PROCEDURE AllocSector*(hint: INTEGER; VAR sec: INTEGER);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L97)


`  PROCEDURE GetSector*(src: INTEGER; VAR dst: Sector);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L107)


`  PROCEDURE PutSector*(dst: INTEGER; VAR src: Sector);` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L113)


`  PROCEDURE Init*;` [(source)](https://github.com/io-core/Kernel/blob/main/Disk.Mod#L119)

