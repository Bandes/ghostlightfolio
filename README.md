# Ghostlight Folio

## What is it?
Ghostlight Folio is a simple application designed to help theatrical stage managers and directors keep track of the various aspects of the shows they work on.

The idea is that a user will be able to use the `Show` database to find a show they want to produce, then once they have created their `Production` of that show,
they will be able to add cast members and assign them to `Roles`. We will also support `Scenes` (and maybe `Acts`) as well as `Things` (props, tools, scenery)
which can be assoicated with `Roles` and `Scenes`. It might be necessary to support more granular timestamps within scenes. 

Eventually I would really like to provide some kind of tool for handling blocking. The idea is to have a grid of the stage with the ability to assign characters
and things to positions on the stage. It would be nifty if that could be done via drag-and-drop, but that might not be strictly necessary. 

## How to use it
This code is going to be open-source and publicly available but I am also planning to host my own version which will be available for use.

## Project Roadmap
* Database of `Shows`
* Allow for instances of shows `Productions`
* Allow `People` to be assigned to `Roles` and `Scenes` within `Productions`
* Plan for drag-and-drop blocking behavior for `Scenes`

## Early Tasks
* Start with the ability to add and edit top-level `Show` records which will allow crowdsourcing of show data
* Attach `Role` or some similar record to `Show` and give it searchable characteristics
* Add search

* Add `Production` model which will allow for instances of shows to be used

## Technologies

* Ruby 3.0.2
* Rails 6.1.4
* Tailwind CSS
* Hotwire (Turbo and Stimulus)
