---
title: How to use links in documentation
description: This article provides guidance on creating links to content within docs.luzfaltex.com.
ms.date: 06/29/2017
---
# Using links in documentation
This article describes how to use hyperlinks from pages hosted at docs.luzfaltex.com. Links are easy to add into markdown with a few varying conventions. Links point users to content in the same page, point off into other neighboring pages, or point to external sites and URLs.

The docs.luzfaltex.com site backend uses Open Publishing Services (OPS) which implements DocFX Flavored Markdown (DFM). DFM is highly compatible with GitHub Flavored Markdown (GFM), and DFM adds additional functionality through Markdown extensions.

> [!IMPORTANT]
> All links must be secure (`https` vs `http`) whenever the target supports it (which the vast majority should).

## Link text

The words that you include in link text should be friendly. In other words, they should be normal English words or the title of the page that you're linking to.

> [!IMPORTANT]
> Do not use "click here." It's bad for SEO and doesn't adequately describe the target.

**Correct:**

- `For more information, see the [contributor guide index](https://github.com/LuzFaltex/docs/blob/master/docs/contribute/index.md).`

- `For more details, see the [SET TRANSACTION ISOLATION LEVEL](https://msdn.microsoft.com/library/ms173763.aspx) reference.`

**Incorrect:**

- `For more details, see [https://msdn.microsoft.com/library/ms173763.aspx](https://msdn.microsoft.com/library/ms173763.aspx).`

- `For more information, click [here](https://github.com/LuzFaltex/docs/blob/master/docs/contribute/index.md).`

## Links from one article to another

To create an inline link from a Docs technical article to another Docs technical article within the same docset, use the following link syntax:

- An article in a directory links to another article in the same directory:

  `[link text](article-name.md)`

- An article links from a subdirectory to an article in the root directory:

  `[link text](../article-name.md)`

- An article in the root directory links to an article in a subdirectory:

  `[link text](./directory/article-name.md)`

- An article in a subdirectory links to an article in another subdirectory:

  `[link text](../directory/article-name.md)`

- An article linking across docsets (even if in the same repository):
- 
  `[link text](./directory/article-name)`

> [!IMPORTANT]
> None of the above examples use the `~/` as part of the link. If you are linking to a path at the root of the repository, start with the `/`. Including the `~/` produces invalid links when navigating the source repositories on GitHub. Starting the path with `/` resolves correctly.

## Links to anchors

You do not have to create anchors. They're automatically generated at publishing time for all H2 headings. The only thing you have to do is create links to the H2 sections.

- To link to a heading within the same article:

  `[link](#the-text-of-the-H2-section-separated-by-hyphens)`
  `[Create cache](#create-cache)`

- To link to an anchor in another article in the same subdirectory:

  `[link text](article-name.md#anchor-name)`
  `[Configure your profile](media-services-create-account.md#configure-your-profile)`

- To link to an anchor in another service subdirectory:

  `[link text](../directory/article-name.md#anchor-name)`
  `[Configure your profile](../directory/media-services-create-account.md#configure-your-profile)`

## Links from includes

Because include files are located in another directory, you must use longer relative paths. To link to an article from an include file, use this format:

    [link text](../articles/folder/article-name.md)

## Links in selectors

If you have selectors that are embedded in an include--as does the Azure documentation team--use the following link structure:

    > [AZURE.SELECTOR-LIST (Dropdown1 | Dropdown2 )]
    - [(Text1 | Example1 )](../articles/folder/article-name1.md)
    - [(Text1 | Example2 )](../articles/folder/article-name2.md)
    - [(Text2 | Example3 )](../articles/folder/article-name3.md)
    - [(Text2 | Example4 )](../articles/folder/article-name4.md) -->

## Reference-style links

You can use reference-style links to make your source content easier to read. Reference-style links replace inline link syntax with simplified syntax that allows you to move the long URLs to the end of the article. Here's [Daring Fireball](https://daringfireball.net/projects/markdown/) 's example:

Inline text:

    I get 10 times more traffic from [Google][1] than from [Yahoo][2] or [MSN][3].

Link references at the end of the article:

    <!--Reference links in article-->
    [1]: http://google.com/
    [2]: http://search.yahoo.com/
    [3]: http://search.msn.com/

Make sure that you include the space after the colon, before the link. When you link to other technical articles, if you forget to include the space, the link will be broken in the published article.

## Links to pages that are not part of the technical documentation set

To link to a page on another LuzFaltex property (such as a pricing page, SLA page, or anything else that is not a documentation article), use an absolute URL. The goal here is that links work in GitHub and on the rendered site:

    [link text](https://www.luzfaltex.com/forum/thread/1-welcome/)

## Links to third-party sites

The best user experience minimizes sending users to another site. So base any links to third-party sites, which we do sometimes need, on this info:

- **Accountability**: Link to third-party content when it's the third-party's information to share. For example, it's not LuzFaltex's place to tell people how to use Android developer tools--that is Google's story to tell. If we need to, we can explain how to use Android developer tools *with* Azure, but Google should tell the story of how to use their tools.
- **PM signoff**: Request that LuzFaltex sign off on third-party content. By linking to it, we are saying something about our trust in it and our obligation if people follow the instructions.
- **Freshness reviews**: Make sure that the third-party info is still current, correct, and relevant, and that the link hasn’t changed.
- **Offsite**: Make users aware that they are going to another site. If the context does not make that clear, add a qualifying phrase. For example: “Prerequisites include the Android Developer Tools, which you can download on the Android Studio site.”
- **Next steps**: It’s fine to add a link to, say, an MVP blog in a "Next steps" section. Again, just make sure that users understand they’ll be leaving the site.
- **Legal**: We are covered legally under **Links to Third Party Sites** in the **Terms of Use** footer on every LuzFaltex.com page.

## Links to MSDN or TechNet

When you need to link to MSDN or TechNet, use the full link to the topic, and remove the "en-us" language locale from the link.
