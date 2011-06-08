This is a TextMate Bundle for [Sass](http://sass-lang.com/) using the newer SCSS
syntax. The older Sass syntax that resembles Haml is not supported in this bundle.

## Installation
### Textmate (OS X)

    mkdir -p ~/Library/Application\ Support/TextMate/Bundles
    cd ~/Library/Application\ Support/TextMate/Bundles
    git clone git://github.com/coreyward/SCSS.tmbundle.git
    
Then reload your bundles in TextMate manually (Bundles > Bundle Editor > Reload Bundles) or run the following:

    osascript -e 'tell app "TextMate" to reload bundles'

## Editing/Contributing

The language grammar (syntax) is defined in `./Syntaxes/SCSS.tmLanguage`. You *can* edit this directly,
but it is cryptic and hard to maintain. TextMate allows you to use a friendlier JSON syntax to define these
same rules. You can find this definition in `./Syntaxes/SCSS.textmate`. 

However, TextMate won't just use that file to define the language grammar as-is (of course, there has to be a caveat).
In order to get TextMate to recognize your changes to this file you must do the following:

  1. Copy the entire changed (and saved) `SCSS.textmate` file
  2. In TextMate, go to Bundles > Bundle Editor > Show Bundle Editor
  3. Expand "SCSS" in the list on the left.
  4. Select the SCSS sub-item (near/at the bottom, with an "L" icon)
  5. Select all of the text in the text field on the right and paste in your updated JSON definition
  6. Close the Bundle Editor and reload your bundles (Bundles > Bundle Editor > Reload Bundles)

This will prompt TextMate to regenerate the cryptic SCSS.tmLanguage file and info.plist (if needed). You can then commit your changes and create a pull request.

## Credits and More:

Thanks to [Chris Eppstein](http://github.com/chriseppstein) who developed the base SCSS.tmbundle.
