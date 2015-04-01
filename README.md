---
tags: UIGestureRecognizer, touch, uiview
languages: objc
---

# zenGarden

Let's make a zen garden app! 

## Instructions

  1. I've included a few items to add to your zen garden. Make sure you have at least one of each.
  2. You should be able to drag any of the `UIImageView` objects on the screen. Make sure to set `userInteractionEnabled` to `YES` in code for each `UIImageView` object.
  3. Games without a way to win suck...let's have a secret "solution" to the perfect zen garden. Humans aren't perfect, feel free to put in some "tolerances" to these requirements.
    * King Arthur's sword, Excalibur, should be in the top left or bottom left.
    * The Shrub and the rake should be near each other (choose what your definition of *near* is)
    * The regular stone needs to be on a different North/South half of the screen as King Arthur's Sword, Excalibur. So if the sword is on the top, the other stone should be on the bottom.
  4. When all of these conditions are met, put up a `UIAlertView` saying you win, when the user selects "OK" randomly scramble the views.

## Advanced

  1. Add in a different way to move the items. Double tap on one to "select" it and give it a background color. Then tap somewhere else to move that item to the new location.
  
## Hints

  * Check out [this StackOverflow](http://stackoverflow.com/questions/19530283/how-do-i-detect-how-close-uiview-view-is-to-the-other-uiview) article on finding distance between two views
  * Gesture Recognizers are one to one, meaning that Gesture Recognizers can only be associated with one view at a time.
