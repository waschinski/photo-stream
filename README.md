![Photo Stream Social Preview](https://repository-images.githubusercontent.com/244708193/8710f480-6010-11ea-9fd6-41bdaea7ab02)

# Photo Stream

Photo stream is a simpler home for your photos by [@maxvoltar](https://twitter.com/maxvoltar) and [friends](#credits). Easy to use, self hosted, no tracking, just photos.

- [Examples](#examples)
- [Features](#features)
- [Why?](#why)
- [How to Install](#how-to-install)
    - [The easy way](#the-easy-way)
    - [The slightly-less-easy-but-still-totally-doable way](#the-slightly-less-easy-but-still-totally-doable-way)
- [How to use](#how-to-use)
- [Customize](#customize)
    - [Basics](#basics)
    - [Advanced](#advanced)
- [Credits](#credits)
- [Known issues](#known-issues)

## Examples

_Feel free to send me your photo streams on [Twitter](https://twitter.com/maxvoltar), or open a PR._

- [maxvoltar.photo](https://maxvoltar.photo)
- [joeyabanks.photo](https://joeyabanks.photo)
- [photos.alexbaldwin.com](https://photos.alexbaldwin.com)
- [scotts.camera](https://scotts.camera)
- [jad.photos](https://jad.photos)

## Features

- Lazy loading
- Only load larger resolutions when needed (to save on bandwidth)
- Photo tints
- Keyboard shortcuts
- Unique URL's for photos
- RSS feed (Which you can plug into [IFTTT](https://ifttt.com) and set up auto-posting to most social networks, like I've done [here](https://twitter.com/maxvoltar_photo). Make sure you select "Post a tweet with image" when setting it up to embed the photo.)
- Drag, drop, commit workflow ([learn more about how to add photos to your stream](https://github.com/maxvoltar/photo-stream#how-to-use))
- Optimized light and dark themes (auto-enabled depending on your OS preferences)
- Optional: Links to your social networks

## Why?

We like to take photos and share them. Problem is it's hard to really own your photos and how they're represented across social media these days, so we set out to make a place for them. You host it yourself, wherever you want (Netlify, Github Pages...), you're in control.

## How to install

### The easy way

1. Fork this repo
2. Clear the `photos/original` directory
3. Add your own photos
4. Deploy your forked copy to [Netlify](https://netlify.com) (free by default, you can add your own domain and analytics for a reasonable price)
5. In your build & deploy settings, set "Build command" to `jekyll build` and "Publish directory" to `_site/`.
6. Enjoy your very own photo stream!

### The slightly-less-easy-but-still-totally-doable way

Check to see if you have Ruby installed (`ruby -v`). If you don't, you can follow the installation instructions provided [here](https://www.ruby-lang.org/en/documentation/installation/).

Next you'll have to install [Jekyll](https://jekyllrb.com) (a simple `gem install bundler jekyll` should suffice).

```sh
bundle install
```

You'll also need some additional dependencies:

```sh
# Make sure xcode CLT is installed first:
xcode-select --install

# This takes a while. Plug your laptop in and go grab a coffee, a book, or just
# like, take a sec away from the computer and breathe for a bit.
brew install glib vips
```

## How to use

Put your photos (not resized) in the `photos/originals` directory. Optionally you can give them a name, which will appear as the title of the photo page and in the RSS feed.

```sh
bundle exec jekyll serve
```

## Customize

### Basics

First thing you want to do is edit a couple of things in `/_config.yml`:

- `title`: The title of your photo stream
- `email`: Your email address (this line is optional, you can remove it)
- `author`
    - `name`: Your name
    - `email`: Your email address (optional)
    - `website`: Your website (could be the address of this photo stream)
- `description`: Description of your photo stream
- `baseurl`: Should be `""` **⚠️ Do not change unless you know what you're doing**
- `url`: Where will this photo stream live (example: `https://maxvoltar.photo`)
- `twitter_username`: Your Twitter username
- `github_username`: Your Github username
- `instagram_username`: Your Instagram username

Don't include the `@`-part of your social handles. By default links to your Github and Instagram profiles are hidden. You can uncomment these by going into `/index.html`. There, you can also add links to wherever you want. Just add more `<li>`'s with `class="link"` to the `<ul class="links">` list.

### Advanced

Before publishing your website, Jekyll will resize your photos into 3 different buckets:

- `/photos/large`: These are only shown when a user navigates to a photo page. By default these are resized to a maximum of 2048 wide and 2048 tall. If you wish, you can change these by changing the values in `/_config.yml` (by default they look something like this: `resize_to_limit: [2048, 2048]`).
- `/photos/thumbnail`: These are used in the grid. Photo Stream will load all thumbnails above the fold, then more as you scroll down; all to save bandwidth. Standard size for these is 640 by 640 (max), but you can also change this if needed.
- `/photos/tint`: What you see while the page loads its first batch of thumbnails, also used as the background for photo pages. **⚠️ Do not make changes to the tint versions in your config file.**

## Credits

- [@maxvoltar](https://github.com/maxvoltar)
- [@benubois](https://github.com/benubois)
- [@mattsacks](https://github.com/mattsacks)
- [@pjaspers](https://github.com/pjaspers)

## Known issues

- You might see a `VIPS-WARNING` message while running `jekyll serve`. This is [a bug in libvips](https://github.com/libvips/libvips/issues/394#issuecomment-359780578) that's being tracked, but it's harmless.
