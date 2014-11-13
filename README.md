# md2tufte

Some scaffolding to create a reveal.js presentation and Tufte-compliant
handout from the same Markdown source.

## The Source

Your markdown file (see `sample.md`) starts with some metadata, like:

```
% My Title
% My Name
% 12 November 2014
```

(For more complicated metadata, play with `sample.yaml`)

Three simple rules for the rest:

1. Top-level headers become top-level slides.
2. Second-level headers become secondary slides (arrow up and down to navigate
them)
3. Everything inside the `<div class="notes">` tag becomes speaker notes.

Shazam.

## Usage

```
$ make
```

Boom. Check out the output directory. 

(Obviously, we could elaborate on this.)

## Contributing

Yes, please. PRs very, very welcome.

## Colophon

Based on the examples from pandoc:

  http://johnmacfarlane.net/pandoc/demo/example9/producing-slide-shows-with-pandoc.html
