# The Balham Ukulele Society Songbook Project

## Songsheet Maker

This is a simple Rails application that allows a user to write a song up in our simple format and have it converted to the LaTeX format we use in our Songbook projects. It is a utility app that allows a user to add the song into a songbook -- See the songbook project: <https://github.com/ukulele/songbook> -- as a properly-formatted LaTeX file.

The application is designed to run on Heroku and has minimal features.

### Simple song format example

Ace Of Spades by Motorhead - copyright held by original rights holders.

    // first line is title
    // second line is artist
    // third line is some useful note for the song, must be present as ** even if rest of the line is blank

    ** Ace Of Spades
    ** Motorhead
    ** notes-notes

    // chords begin here, do not use numbers in the chords, only letters

    ** chords

    Bmajor
    Cmajor
    Dmajor
    Emajor
    Gmajor
    Aseven
    Aminor
    Asusfour

    chords **

    // chords end here

    // add two backslashes (\\) for an extra line

    [E]Intro\\

    [G]If you like to gamble, I tell you I'm your man

    [G]You win some, lose some, it's all the same to me[E]

    [D]The pleasure is to [C]play, it makes no difference what you say[E]

    [D]I don't share your [C]greed, the only card I need is\\

    (x2)[E]The Ace Of Spades

    Alright\\

...And so on and so forth

----------------------------------------

The Balham Ukulele Society Songbooks project by Vish Vishvanath, Matt Gunning, Alyn Gwyndaf, Charlie Ullman, et al is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US

