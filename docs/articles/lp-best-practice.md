---
title: LuzFaltex's best practices regarding LuckPerms configuration
description: Best Practice Guide with annotations
author: Foxtrek64
ms.date: 2/1/2019
---

# [DRAFT] LuzFaltex's Best Practice Guide for LuckPerms

Often we are asked how to best configure [LuckPerms](https://luckperms.github.io/), which describes itself as "an advanced permissions plugin for Bukkit/Spigot, BungeeCord, Sponge, Nukkit and Velocity." So we have created this guide to outline how we configure LuckPerms to function in our environment and to provide reasoning for those who wish to adopt these practices themselves.

Also included in this guide, we will walk you through setting up an example server, putting what we learned in the previous chapter to use. You are welcome to follow along with this example as a learning project, and we believe that doing so may clear up any lingering confusion users new to LuckPerms or Minecraft Server hosting in general may have.

## Foreword

Many of the practices and the reasons behind them are taken from Microsoft Best Practice for Windows Active Directory. Other sources include [NIST INCITS 359-2012](https://standards.incits.org/apps/group_public/project/details.php?project_id=1658) and the [LuckPerms Wiki](https://github.com/lucko/LuckPerms/wiki). As such, those of you who are server engineers and administrators used to working in a Windows environment may recognize several of the suggested practices and the reasons behind them. That said, just because Microsoft or LuzFaltex suggests a certain practice does not mean that it is necessarily the best way. If you find anything in this document that does not feel right, we encourage you to [create an issue](https://github.com/LuzFaltex/docs/issues/new/choose) and discuss it with us! If this is something you would like to help with, then you may want to read over our [Contribution Guide](../contribute/index.md).

## Definitions

LuckPerms has several terms that you will need to be aware of before we start.

| Term | Definition |
|------|------------|
| Node | An item that holds information. This could be a particular permission string (e.g. `essentials.fly`), a prefix or suffix, or a custom meta item.|
| User | An object which represents a player. |
| Group | A powerful container object |
| Inheritance | A powerful tool which allows nodes to flow from parents to children. |
| Parent | A group which passes nodes to other groups or users.
| Child | A user or group which receives nodes from a group.

These terms will be used extensively in the coming sections. Feel free to refer back here any time you need.

## Groups and Inheritance

> [!IMPORTANT]
> Groups should represent a tangible idea, such as a role or even a single permission or set of permissions. For instance, a moderator role, a donation tier, or a special player perk (e.g. buying fly with in-game currency).

Groups are your primary powerhouse for distributing permissions and other nodes, and you will need to leverage this power in tandem with inheritance in order to properly configure your server.

> A properly configured server is easy to understand and maintain and scales with the player base.

To leverage this power, we assign nodes to groups and then assign your users membership to those groups. This group membership allows the users to inherit the nodes of the group, such as prefixes, suffixes, and permissions.

To demonstrate why this is done, consider the following example:

> Jane Doe is the user's first and so far only moderator. When she joins, you assign the permissions she needs to her and get her a fancy Moderator prefix to show off when the chats. A few months later, John Doe joins the server and wishes to become a moderator. You want them to have the same permissions, but you don't exactly remember what permissions you gave Jane. Now you need to go through all of the permission nodes that Jane has and copy them over to John, a process which is time consuming and error-prone.

> [!WARNING]
> While LuckPerms does have the capability to `clone` nodes from one user or group to another, this functionality should **not** be used in lieu of user groups. Doing so will cause issues with maintainability.

Instead, the proper way to handle this situation is to create a group and assign those nodes to the group, not to the user. In short, the reasons for using groups and inheritance instead of user-assigned nodes are the following:

1. Consistency
    * Users who need the same permissions as another (e.g. moderators) can be guaranteed to all have the same permissions.
1. Maintainability
    * If a particular node needs to be added, removed, or changed for all of your users or a particular subset of users (e.g. moderators), this is a single (o(1)) operation, as opposed to an o(n) operation where (n) represents the number of targeted users.
1. Security
    * If a particular user is dismissed or resigns from their role, then revoking their permissions and other aspects is as simple as removing group membership.

## Role-Based Access Control (RBAC)

> [!IMPORTANT]
> Groups should only be given the bare minimum permissions required to fulfill their function.

A common mistake newer server operators make is assigning `*` to their admin group or relying on operator permissions. This is perfectly fine during initial setup, though it should not be used in production. We will touch on our specific setup in the walkthrough section, but as mentioned in the previous section, groups should represent their specific role and nothing else.

> RBAC enables you to more closely align the roles you assign users and administrators to the actual roles they hold within your organization.
> -- Microsoft Best Practice

This means that your administrator group should not be a superuser group. That is, it doesn't have permission to do *everything*, implicitly or explicitly. Instead, you should create your administrator group based around its role: server administration. This means that your administrator group should only have permission for commands specifically related to plugin and server management. Likewise, the moderator group should only have permissions required to manage users, use investigation tools (like CoreProtect), and some limited functionality such as bypassing region or chest protection and granting currency to players.

At first, this seems counter-intuitive, but remember that users can inherit permissions from multiple groups. Your administrators for instance may inherit from both the administrator and moderator groups. This is where Role-Based Access Control (or RBAC) comes into play.

RBAC, and its separation of interest design, guarantees the following:

1. Groups represent roles within your organization
    * Groups, therefore, have only the permissions required to complete the tasks that role is responsible for.
1. Where a user gets a certain permission and why they have it is clear.
    ```console
    /lp user Luck permission check essentials.fly
    > [LP] Luck has permission essentials.fly set to true in context global. (inherited from moderator)
    ```
1. Users always have exactly the permissions they need or are entitled to.

## The Default Group

The default group, known as `default` within commands and in the plugin API, is a built-in group that represents all users on the server. When a player joins the server for the first time, they are automatically added to this group. To fit in with RBAC, you can see this group as representing a "user role." As such, it should be granted permissions that are common to every user. For instance, `essentials.motd` is commonly placed here.

Behind the scenes, hard-coding the default group means that this default group can be faster and more efficient than other custom groups, and it is not susceptible to race conditions. For more information, you can read the [Default Groups](https://github.com/lucko/LuckPerms/wiki/Default-Groups) article on the LuckPerms wiki.

> [!TIP]
> With the exception of some fringe cases which won't be covered here, server administrators will want to use the built-in default group. This is especially the case when coming from other plugins where a default group is either not present or else is manually specified.

As a user, all players should be a member of this group. Doing so ensures that you may quickly and efficiently make a change for all players.

## The Wildcard Node

The wildcard node, otherwise known as `*`, is a node filter which matches everything. In Bukkit and its sister projects, a permissioning system was developed around allowing plugins to define "everything." However, this breaks expectations and can cause some undesirable behavior, such as an admin expecting users to have a certain permission node and it being missing or else having a permission node they did not expect to issue. Additionally, this encouraged lazy behavior, with the admin group often being issued `*`.

As such, the naked wildcard node (`*`) should be avoided entirely and the use of a plugin wildcard node (`plugin.*`) is strongly discouraged, even for plugins that have a lot of permissions!

Many plugins, especially those on the Sponge platform, have begun creating permission collections such as `plugin.user` and `plugin.admin`. For plugins that provide this functionality, it is strongly encouraged that you use these pre-built collections as the plugin developer has full control over what these nodes entail.

If these are not present, then manually issuing permission nodes is preferred. For most plugins, this will not be too painful of a process. However, for plugins with larger groups of nodes, using the online editor (`/lp editor`) may make this process easier. And while you're at it, create an issue for that plugin and request that these collections be added.

For more information, see the [Nucleus Wiki](https://nucleuspowered.org/docs/nowildcard.html) regarding this topic.