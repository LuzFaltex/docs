# C# Coding Style

The general rule we follow is "use Visual Studio defaults".

1. We use [Allman style](http://en.wikipedia.org/wiki/Indent_style#Allman_style) braces, where each brace begins on a new line. A single line statement block can go without braces, but the block must be properly indented on its own line and must not be nested in other statement blocks that use braces. One exception is that a `using` statement is permitted to be nested within another `using` statement by starting on the following line at the same indentation level, even if the nested `using` statement contains a controlled block.
1. We use four spaces of indentation (no tabs).
1. we use `_camelCase` for internal and private fields and use `readonly` wherever possible. Prefix internal and private instance fields with `_`, static fields with `s_`, and thread static fields with `t_`. When used on static fields, `readonly` should come after `static` (i.e. `static readonly` not `readonly static`). Public fields should be used sparingly and should use PascalCasing with no prefix when used.
1. We avoid `this.` unless absolutely necessary.
1. We always specify the visibility, even if it's the default (e.g. `private string _foo`, not `string _foo`). Visibility should be the first modifier (i.e. `public abstract` not `abstract public`).
1. Namespace imports should be specified at the top of the file, *outside* of `namespace` declarations, and should be sorted alphabetically, with the exception of `System.*` namespaces, which are to be placed on top of all others.
1. Avoid more than one empty line at a time. For example, do not have two blank lines between members of a type.
1. Avoid spurious free spaces. For example, avoid `if (someVar == 0)...` where the dots mark the spurious free spaces. Consider enabling "View White Space (`ctrl`+`E`, `S`)" if using Visual Studio to aid detection.
1. If a file happens to differ in style from these guidelines (e.g. private members are named `m_member` rather than `_member`), the existing style in that file takes precedence.
1. We only use `var` when it's obvious what the variable type is (e.g. `var stream = new FileStream(...)` not `var stream = OpenStandardOutput()`).
1. We use language keywords instead of BCL types (i.e. `int, string, float` instead of `Int32, String, Single`, etc.) for both type references as well as method calls (`int.Parse` instead of `Int32.Parse`).
1. We use PascalCasing to name all of our constant local variables and fields. The only exception is for interop code where the constant value should exactly match the name and value of the code you are calling via interop.
1. We use `nameof(...)` instead of `"..."` wherever possible and relevant.
1. Fields should be specified at the top within type declarations.
1. When including non-ASCII characters in the source code, use Unicode escape sequences (`\uXXXX`) instead of literal characters. Literal non-ASCII characters occasionally get garbled by a tool or editor.
1. When using labels (for goto), indent the label one less than the current indentation.

Example file:

``ObservableLinkedList`1.cs:``

```c#
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Diagnostics;
using Microsoft.Win32;

namespace System.Collections.Generic
{
    public partial class ObservableLinkedList<T> : INotifyCollectionChanged, INotifyPropertyChanged
    {
        private ObservableLinkedListNode<T> _head;
        private int _count;

        public ObservableLinkedList(IEnumerable<T> items)
        {
            if (items == null)
                throw new ArgumentNullException(nameof(items));

            foreach (T item in items)
            {
                AddLast(item);
            }
        }

        public event NotifyCollectionChangedEventHandler CollectionChanged;

        public int Count
        {
            get { return _count; }
        }

        public ObservableLinkedListNode AddLast(T value) 
        {
            var newNode = new LinkedListNode<T>(this, value);

            InsertNodeBefore(_head, node);
        }

        protected virtual void OnCollectionChanged(NotifyCollectionChangedEventArgs e)
        {
            NotifyCollectionChangedEventHandler handler = CollectionChanged;
            if (handler != null)
            {
                handler(this, e);
            }
        }

        private void InsertNodeBefore(LinkedListNode<T> node, LinkedListNode<T> newNode)
        {
           ...
        }

        ...
    }
}
```