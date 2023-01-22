#!/usr/bin/env jq

# Gratuitous use of jq to generate XML.

def entry:
  [
    "<entry>",
    "<title>\(.title)</title>",
    "<link>\(.body)</link>",
    "<updated>\(.updatedAt)</updated>",
    "</entry>"
  ]
  | join("\n")
;

first as $latest
| [
  "<feed xmlns=\"http://www.w3.org/2005/Atom\">",
  "<title>URL Notes</title>",
  "<updated>\($latest.updatedAt)</updated>",
  "<author><name>DJ Adams</name></author>",
  map(entry)[],
  "</feed>"
]
| join("\n")
