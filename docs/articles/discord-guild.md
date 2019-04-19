---
title: Discord Guild Configuration Guide
description: LuzFaltex's guide to configuring Discord Guilds
author: Foxtrek64
ms.author: Foxtrek_64 # Microsoft employees only
ms.date: 04/19/2019
---

# Discord Guild Configuration Guide

This guide is provided by LuzFaltex to outline the way we configure our Discord Guilds (servers) and the reasons behind them. This guide assumes you will be reading this because you have an interest in building a server to our standards, or because you are a LuzFaltex employee tasked with building a new community.

## Initial Setup

We will start out assuming you have already created your guild, chosen its name, and are ready to begin setup. Many of the practices and the reasons behind them are adapted from Microsoft Best Practice for Windows Active Directory. We additionally rely on [NIST INCITS 359-2012](https://standards.incits.org/apps/group_public/project/details.php?project_id=1658).

Going into this guide, it is a good idea to keep in mind these guidelines:

* **Less is more**: You should make the least amount of changes possible. Roles should only be given the bare minimum permissions to allow users with that role to do their job (see the [RBAC Section](#RBAC-Role-Based-Access-Control).) Channel and Channel Category overrides should only differ from role permissions where that channel or channel category differs. For instance, staff-only channels.
* **Inheritance is your friend**: Don't be afraid to grant members more than one role, especially if they do more than one job. In LuzFaltex communities, all staff members, regardless of their organizational role, are moderators. As such, every staff member gets the Moderator role in addition to the role specific to their team.
* **KISS is powerful**: By making only necessary changes and following this best practice guide as closely as possible, you enable future administrators to understand the server configuration at a glance. Additionally, servers that are simple scale easily, so configurations made when the server was small do not impede growth.

### RBAC (Role Based Access Control)

> [!IMPORTANT]
> Groups should only be given the necessary permissions to fulfill their function.

Our guild configuration depends heavily on RBAC, or Role Based Access Control. RBAC defines what a role is and how it should be utilized.

> RBAC enables you to more closely align the roles you assign users and administrators to the actual roles they hold within your organization. -- Microsoft Best Practice

As such, the roles in this guide will be created in such a way to match with their definition. Users that have more than one job will be be given each of the appropriate roles, their cumulative permissions granting them the ability to complete their assigned tasks.

Cosmetic roles are roles which are used for changing name colors, sorting users in the user list, or providing meta-info about the player. These roles will be configured identically to the Everyone role and will not be granted any additional permissions.

### The Everyone Role

> [!TIP]
> The Everyone role is a role shared by all servers. It is used as a template for creating additional roles and is automatically obtained by any users or bots joining the server.
>
> RBAC Function: Represents a user.

The first task is to configure the Everyone role so that it will act as a proper template for subsequent roles. We recommend disabling the `Send TTS Message` and `Mention Everyone` permissions. Additional permissions may be granted or removed based on what you would like every user to be able to do.

#### Whitelisted Guilds

A Member role should be created for whitelisted servers. It is poor practice to have a New Member role and have it restrict permissions from Everyone`. Permissions should be additive, not given at lower levels and granted at higher levels. This ensures administrators will always be able to rely on the idea that users with some roles will have more permissions that those without, and that access control situations remain simple and easy to set up.

In the case of whitelisted servers, the Member role should be given an identical set of permissions to Everyone. The ability to see or not see certain channels will depend entirely upon channel or channel group permissions.

To configure this properly, deny the `Read Text Channels & See Voice Channels` permission to `Everyone` and allow it for Member, or if creating channel-specific permissions, deny `Read Messages` to Everyone and allow it to Member.

Your staff members should have the Member Role, as the Member role represents users who are allowed to access the server.

### Staff Roles

We will create four roles:

* Administrator -- Represents users responsible for configuring the server
* Moderator -- Represents users responsible for user management
* Helper -- Represents community members who show exemplary tact and leadership capabilities.
* Staff -- A cosmetic role for grouping staff members together.

For LuzFaltex communities, we differentiate between administrators and moderators by color. Color schemes are chosen based on community color schemes. The Helper role is optional, but is used in our communities to praise productive members and to identify a pool from which we draw our moderators.

Configure the roles above. Administrators should get permissions related to server administration and moderators for user management. Helpers don't necessarily get any additional permissions, but we allow them to access moderation channels. In many of our servers, they also have the ability to `View Audit Logs` and `Manage Emoji`.

> [!WARNING]
> The `Administrator` permission should not be given to your administrators. This is a dangerous bypass permission that gives them full control over your server, except in regards to transferring your server or changing server region. This permission has a practical purpose and may be used if done sparingly. It is **not recommended for production use**.
>
> If a bot requests that it be given the administrator role, we strongly recommend denying that permission **before** inviting it to your server, or else finding a different bot. This gives that bot full control over your server, which could be used for malicious purposes.

The Staff role is a role we use for organizing staff members under one category in our role list. We also use it as a role for summoning staff. As such, we enable `Display role members separately from online members` and `Allow anyone to @**mention** this role`. This same configuration is performed for Helpers, as we allow users to mention them for small questions or to help resolve smaller issues that don't require moderator intervention.

## Channel Setup

> [!TIP]
> If you wish to prevent users from doing a particular thing, deny that permission at the role level, not the channel level. Category permissions should be used as overrides, and as such should be limited to the particular change required for that category.

For ease in configuration, all channels should be placed in a channel group, called a Category. Channels in this category will inherit permissions from the category, meaning you are able to configure one item instead of `n` items, where `n` represents the number of channels in the category.

Category permissions should be modified sparingly. In other words, the only permission that should be changed is the one that is different for that channel. For instance, the Everyone group should not be able to see channels in that category but members of the Moderator group are.

While it is possible to override permissions per-channel, this is not recommended as it breaks inheritance. In other words, once a particular channel in a group has a modification made to it, changes made to the category are no longer reflected within that channel. Channel configuration items, like slow mode or marking a channel as NSFW, do not affect inheritance.

### User Permissions

Per RBAC specifications, users should get their permissions through inheriting group permissions. In other words, users by themselves should not be given permissions, but rather they should get their permissions by virtue of being a member of a group that grants them those permissions. The Channel Category permission system allows you to define specific users, however this practice is not recommended as it may cause unpredictable behavior to those unaware of the user-based permission override.