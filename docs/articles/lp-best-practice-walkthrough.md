---
title: LuzFaltex's LuckPerms Demonstration
description: A demonstration of a server configuration based around LuzFaltex Best Practice
author: Foxtrek64
ms.date: 2/1/2019
---

# [DRAFT] Walkthrough Demonstration

This section will walk a user through setting up Spigot 1.13.2 server using LuckPerms and following best practice as defined in our [best practice guide](lp-best-practice.md).

We will use Multicraft for our demonstration, though this may also be done with any daemon of your choice, or just running the server from your computer's command line.

## Before We Begin

Before we begin, you will need to have the following:

1. Direct console access
1. Minecraft 1.13.2
1. Spigot 1.13.2. You may need to [build it yourself](https://www.spigotmc.org/wiki/buildtools/#1-13-2).
1. The latest version of [LuckPerms](https://ci.lucko.me/job/LuckPerms/) suitable for 1.13.2.
1. The latest version of [EssentialsX](https://ci.ender.zone/job/EssentialsX/) and EssentialsX-Chat suitable for 1.13.2.
1. The latest version of [CoreProtect](https://www.spigotmc.org/resources/coreprotect.8631/) suitable for 1.13.2.
1. The latest version of [Vault](https://www.spigotmc.org/resources/vault.34315/) suitable for 1.13.2.

After installing the plugins, continue on to the next section.

## Getting Started

This section will reflect a lot of what is presented in the LuckPerms getting started guide, which is an oustanding piece written by Luck. However, we will be deviating from that procedure here. That said, be sure to review the documentation regarding how to [choose a storage type](https://github.com/lucko/LuckPerms/wiki/Storage-types) before proceeding if you don't want to use the defaults.

## Grant full access to yourself

First off, we need to grant yourself permission to the plugin. Log in to the server, then run the following commands in the console:

`lp creategroup admin`
```bash
> lp creategroup admin
01.02 22:26:06 [Server] INFO [LP] admin was successfully created.
```

`lp group admin permissions set luckperms.* true`
```bash
> lp group admin permissions set luckperms.* true
01.02 22:29:23 [Server] INFO [LP] Set luckperms.* to true for admin in context global.
```

`lp user <username> parent add admin`
```bash
> lp user Foxtrek_64 parent add admin
01.02 22:36:02 [Server] INFO [LP] foxtrek_64 now inherits permissions from admin in context global.
```

## Set up permissions

> [!TIP]
> If at this point you try to run commands in game and the lp commands are red and don't offer hints, disconnect and re-join the Minecraft server. Your permissions will be re-evaluated and commands should operate as expected.

