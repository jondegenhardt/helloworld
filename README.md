# Hello World: Experimentation repository

There is nothing particularly interesting here.

This is a personal repository is used for experimenting with various features of GitHub, Travis-CI, and other on-line features that are difficult to experiment with locally. 

## GitHub Pages

### Personal experimentation

#### Special characters

Single quotes, double quotes, and vertical bars are an issue on raw GitHub pages. e.g. '--a|abc num [,num...]'. Whereas backquote is fine: `--a|abc num [,num...]`. But suppose you want the single quote?

First bit is to turn off "smart quote" generation. Add the following to the _config.yml file:
```
kramdown:
  smart_quotes: apos,apos,quot,quot
```

This get the single quotes generated correctly (already done in this repo). However, the vertical bar within a single quote block will still initiate an unwanted table. 

Try 2: Escape a vertical bars with a backslash: '--a\|abc num [,num...]'. How did this do? Well, it avoids table creation, but the verticle bar doesn't show up. And, there does not appear to be any way to avoid double dash converting to the single character double dash. Remedy - Put all such references in backslashes, whether that's what is wanted or not.

Code regions as another consideration. GitHub pages gets these correct by default.
```
$ # command-line-command --a|arg value --b|arg2 value2
$ command-line-command --arg value --arg2 value2
Some output
More output
```

### GitHub Pages generated material

*The remaining material is boilerplate generated by GitHub Pages during initial creation.*

### Editing GitHub Pages

You can use the [editor on GitHub](https://github.com/jondegenhardt/helloworld/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/jondegenhardt/helloworld/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
