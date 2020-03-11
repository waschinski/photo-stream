![Photo Stream Social Preview](https://repository-images.githubusercontent.com/244708193/8710f480-6010-11ea-9fd6-41bdaea7ab02)

# Photo Stream

Photo stream is a simpler home for your photos by [@maxvoltar](https://twitter.com/maxvoltar) and [friends](#credits). Easy to use, self hosted, no tracking, just photos.

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
2. Clear the `photos/originals` directory
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

Put photos in the `photos/originals` directory. Optionally you can give them a name, which will appear as the title of the photo page and in the RSS feed.

```sh
bundle exec jekyll serve
```

## Credits

- [@maxvoltar](https://github.com/maxvoltar)
- [@benubois](https://github.com/benubois)
- [@mattsacks](https://github.com/mattsacks)
- [@pjaspers](https://github.com/pjaspers)

## Examples

- https://maxvoltar.photo
- https://joeyabanks.photo
- ...

## Known Issues

- You might see a `VIPS-WARNING` message during the generation process. This is [a bug in libvips](https://github.com/libvips/libvips/issues/394#issuecomment-359780578) that's being tracked, but it's harmless.