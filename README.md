# Welcome to Integrated Oberon

* [What is Oberon?](https://github.com/io-core/doc#what-is-oberon)
* [What is Integrated Oberon?](https://github.com/io-core/doc#what-is-integrated-oberon)
* [What Other Oberons are there?](https://github.com/io-core/doc#what-other-oberons-are-there)
* [How to get Integrated Oberon](https://github.com/io-core/doc#how-to-get-integrated-oberon)
* [How to use it](https://github.com/io-core/doc#how-to-use-it)
* [How to code for it](https://github.com/io-core/doc#how-to-code-for-it)
* [How to contribute to it](https://github.com/io-core/doc#how-to-contribute-to-it)
* [System Concepts](https://github.com/io-core/doc#system-concepts)
* [Documentation](https://github.com/io-core/doc#documentation)
* [Repositories](https://github.com/io-core/doc#repositories)

#### What is Oberon?

Oberon is both an operating system and a computer language, first developed by professors Wirth and Gutknecht for a custom workstation in the 1980s at ETH Zurich in Switzerland. Oberon, both the language and the OS, has been extended, ported, refined, and evolved by themselves and others, with the most recent (2013) incarnation of Project Oberon being a particularly succinct implementation for a custom-designed FPGA RISC architecture.

Project Oberon is self-contained and provides a complete single-user computing experience, having its own compiler, file storage, text and graphics manipulation, and local area network clients and servers. The 2013 version of Project Oberon makes little concession to interoperability with other computing systems.

#### What is Integrated Oberon?

Integrated Oberon departs from Project Oberon by introducing features and capabilities to Oberon, taken from other systems based on pervasiveness (e.g. utf8, markdown, TTF fonts, HTML/DOM, tcp/ip) and utility (multicore and distributed computing, capability based security, the leveraging of immutable data structures and content-addressed storage for replication, deduplication, and eventual consistency, etc.)

None of the above features are implemented yet. As [Extended Oberon](https://github.com/andreaspirklbauer/Oberon-extended) has already re-introduced to 2013 Project Oberon the support for type-bound procedurs in Oberon-2 and other needed features, Integrated Oberon will start from there. 

#### What other Oberons are there?

Oberon has a long history with many more or less compatible implementations, emulated and native, 32 and 64-bit, including currently used and developed descendents. Notable examples include: (put notable examples here!)

## How to get Integrated Oberon

To run Integrated Oberon you need a [disk image](https://github.com/io-core/io/raw/main/images/io.img) and either an [emulator](https://github.com/pdewacht/oberon-risc-emu) or an [FPGA](https://www.crowdsupply.com/radiona/ulx3s) that has been [programmed](https://github.com/emard/oberon) to implement the [Oberon RISC5 architecture.](www.projectoberon.com)

To obtain the complete Integrated Oberon project including project submodules, you can do this:

```
git clone --recursive https://github.com/io-core/io
```

## How to use it

You can read more about how to get and use the system here:  [Introduction](./intro/Intro.md) to Oberon.

## How to code for it

development process described in Develop.md

## How to contribute to it

Links to the repo, the wiki, some guidelines, etc.

## How to report issues

File general issues in the
* [IO Project Issue Tracker](https://github.com/io-core/io/issues)

or in sub-project issue trackers for the following sub-projects:
* [doc](https://github.com/io-core/doc/issues)
* [Kernel](https://github.com/io-core/Kernel/issues)
* [Files](https://github.com/io-core/Files/issues)
* [Modules](https://github.com/io-core/Modules/issues)
* [Edit](https://github.com/io-core/Edit/issues)
* [Oberon](https://github.com/io-core/Oberon/issues)
* [System](https://github.com/io-core/System/issues)
* [Build](https://github.com/io-core/Build/issues)
* [Draw](https://github.com/io-core/Draw/issues)


## System Concepts

summary and link to Concepts.md

## Documentation

summary and link to Language.md

summary and link to [the Oberon core packages of modules](./core/README.md)

summary and link to [the library of standard packages of modules](./stdlib/README.md)

summary and link to [the library of experimental packages of modules](./explib/README.md)

## Repositories

summary of package management in Integrated Oberon and where to find other repositories

