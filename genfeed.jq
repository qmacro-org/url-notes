#!/usr/bin/env jq

# Gratuitous use of jq to generate XML.

def xmlescape:
  gsub("&";"&amp;") | gsub("<";"&lt;")
;

def entry:
  [
    "<entry>",
    "<title>\(.title|xmlescape)</title>",
    "<link>\(.body|xmlescape)</link>",
    "<updated>\(.updatedAt)</updated>",
    "<summary>\(.body|xmlescape)</summary>",
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
