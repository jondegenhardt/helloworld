# Hello World: Experimentation repository

There is nothing particularly interesting here.

This is a personal repository is used for experimenting with various features of GitHub, Travis-CI, and other on-line features that are difficult to experiment with locally. 

## GitHub Pages

### Personal experimentation

#### Special characters

Single quotes, double quotes, and vertical bars are an issue on raw GitHub pages. e.g. '--a|abc num [,num...]'. Whereas backquote is fine: `--a|abc num [,num...]`. But suppose you want the single quote? And, as this example shows, vertical bars initiate unwanted tables.

First bit is to turn off "smart quote" generation. Add the following to the _config.yml file:
```
kramdown:
  smart_quotes: apos,apos,quot,quot
```

This gets the single quotes generated correctly (already done in this repo). However, the vertical bar within a single quote block will still initiate an unwanted table. 

Try 2: Escape vertical bars and double-dash with a backslash: `\--a\|abc num [,num...]` => '\--a\|abc num [,num...]'. How did this do? Good. It avoids table creation, and verticle bars and double-dashes are correctly rendered in GitHub pages and the rendered markdown page.

Generally though, double dash are vertical bars are a nuisance. Any time one these are used standalone there is an issue.

How about code blocks? These seem okay.
```
$ # command-line-command --a|arg value --b|arg2 value2
$ command-line-command --arg value --arg2 value2
Some output
More output
```

How about headings? These sampls sugget escaped double-dash but not vertical bar.

##### Raw: In a --heading|header line?

##### Escaped: In a \--heading\|header line?

##### Backquotes: In a `--heading|header` line?

### GitHub Pages generated material

*The remaining material is boilerplate generated by GitHub Pages during initial creation.*

### Editing GitHub Pages

You can use the [editor on GitHub](https://github.com/jondegenhardt/helloworld/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/jondegenhardt/helloworld/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
