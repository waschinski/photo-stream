![Photo Stream Social Preview](https://repository-images.githubusercontent.com/244708193/8710f480-6010-11ea-9fd6-41bdaea7ab02)

# Photo Stream

Photo stream is a simpler home for your photos initially created by [@maxvoltar](https://github.com/maxvoltar/photo-stream) and now maintained by [@waschinski](https://github.com/waschinski) and [friends](#credits). Easy to use, self hosted, no tracking, just photos.

- [Examples](#examples)
- [Features](#features)
- [Why?](#why)
- [How to Install](#how-to-install)
    - [Using docker](#using-docker)
    - [Manually](#manually)
- [How to use](#how-to-use)
- [Customize](#customize)
    - [Basics](#basics)
    - [Advanced](#advanced)
- [Credits](#credits)
- [Known issues](#known-issues)

## Examples

- [floremotion.de](https://floremotion.de)
- [maxvoltar.photo](https://maxvoltar.photo)
- [joeyabanks.photo](https://joeyabanks.photo)
- [photos.alexbaldwin.com](https://photos.alexbaldwin.com)
- [jad.photos](https://jad.photos)
- [photo.silvandaehn.com](https://photo.silvandaehn.com/)
- [chriszeta.it](https://chriszeta.it)
- [rafa.photo](https://rafa.photo)

## Features

- Lazy loading
- Only load larger resolutions when needed (to save on bandwidth)
- Photo tints
- Keyboard shortcuts
- Unique URL's for photos
- RSS feed (Which you can plug into [IFTTT](https://ifttt.com) and set up auto-posting to most social networks, like [@maxvoltar](https://github.com/maxvoltar) has done [here](https://twitter.com/maxvoltar_photo). Make sure you select "Post a tweet with image" when setting it up to embed the photo.)
- Drag, drop, commit workflow ([learn more about how to add photos to your stream](https://github.com/maxvoltar/photo-stream#how-to-use))
- Optimized light and dark themes (auto-enabled depending on your OS preferences)
- Optional: Links to your social networks

## Why?

We like to take photos and share them. Problem is it's hard to really own your photos and how they're represented across social media these days, so we set out to make a place for them. You host it yourself, wherever you want (Netlify, Github Pages...), you're in control.

## How to install

Previously the recommended way to install photo-stream was to fork the repository. In my opinion this was not really optimal and being a fan of Docker I began working on optimizations to run photo-stream in a container. That's why configuration has been moved from `_config.yml` to `.env` so when switching from the initial repo you will have to set up the `.env` file accordingly.

### Using docker

There is an image over at [Docker Hub](https://hub.docker.com/r/waschinski/photo-stream) which you can pull using:

```sh
docker pull waschinski/photo-stream:latest
```

Alternatively download the `docker-compose.yml` file, change the configuration as needed and use the following command to get photo-stream running:

```sh
docker-compose up -d
```

The `photos` folder can be mounted as a volume. Make sure to put your photos in a folder called `original`.

### Manually

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

This command will serve the static page on your local machine. http://localhost:4000
```sh
bundle exec jekyll serve
```

You can also statically build your site to be uploaded to a regular webhost. 
```sh
bundle exec jekyll build
```
Now upload the contents of the _site/ directory to your webserver.

### Automating the build & upload with rsync or lftp

Just execute the script you need to run directly from the `_scripts` folder like that:
```sh
sh ./_script/build-n-lftp.sh
```

`build.sh` will build your site while `rsync.sh` and `lftp.sh` will sync it accordingly. `build-n-rsync.sh` and `build-n-lftp.sh` are simply doing both steps in one. Don't forget to add your sync configuration in the `.env` file.

## Customize

### Basics

First thing you want to do is edit a couple of things in `/.env`:

- `TITLE`: The title of your photo stream
- `EMAIL`: Your email address (this line is optional, you can remove it)
- `AUTHOR_NAME`: Your name
- `AUTHOR_EMAIL`: Your email address (optional)
- `AUTHOR_WEBSITE`: Your website (could be the address of this photo stream)
- `DESCRIPTION`: Description of your photo stream
- `BASEURL`: Should be left empty or removed **⚠️ Do not change unless you know what you're doing**
- `URL`: Where will this photo stream live (example: `https://maxvoltar.photo`)
- `SHOW_OFFICIAL_GITHUB`: Set to either `1` or `0` to enable or disable showing the link to the official github repository
- `TWITTER_USERNAME`: Your Twitter username or remove/comment this line
- `GITHUB_USERNAME`: Your Github username or remove/comment this line
- `INSTAGRAM_USERNAME`: Your Instagram username or remove/comment this line
- `SYNCUSER`: Your username being used by lftp/rsync in the shell scripts to sync your site to your webserver
- `SYNCPASS`: Your password being used by lftp/rsync in the shell scripts to sync your site to your webserver
- `SYNCSERVER`: The URL of your webserver being used by lftp/rsync in the shell scripts where your site will be synced to
- `SYNCFOLDER`: The folder on your webserver being used by lftp/rsync in the shell scripts where your site will be synced to

Don't include the `@`-part of your social handles. Links to your Github, Twitter and Instagram profiles are only shown when set.

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
- [@cloudz](https://github.com/cloudz)
- [@waschinski](https://github.com/waschinski)

## Known issues

- You might see a `VIPS-WARNING` message while running `jekyll serve`. This is [a bug in libvips](https://github.com/libvips/libvips/issues/394#issuecomment-359780578) that's being tracked, but it's harmless.
