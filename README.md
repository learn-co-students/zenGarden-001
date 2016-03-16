

# zenGarden


## Goals

Let's make a zen garden app! 

<iframe width="560" height="315" src="https://www.youtube.com/embed/YmUNNvzSRrU?rel=0&modestbranding=1" frameborder="0" allowfullscreen></iframe><p><a href="https://www.youtube.com/watch?v=YmUNNvzSRrU">ZenGarden Demo</a></p>

The goal of this lab is to help you become familiar with `UIGestureRecognizers`. You'll implement different gestures in order to move views around on the screen.

## Instructions

  0. Set up a storyboard with a plain old View Controller to get started. **How to make a new Storyboard file**: (File --> New --> User Interface (under the iOS section) --> Select the Storyboard template then hit **Next**. After creating your Storyboard, make sure to set your Main Interface to this new Storyboard file you created. You do this by selecting the zenGarden project file (near the top in the left pane), then under the General Tab you should see various options you can change like Deployment Target, Devices, and **Main Interface**. In the dropdown menu next to **Main Interface**, select the Storyboard file you just created.
  1. Included with this project are four Images (shrub.png, swordinrock.png, rake.png & rock1.png) which you can find in the Resources folder in the left pane in xcode. 
  2. Drag four(4) `UIImageView` objects onto your `UIViewController`. Set the **Image** of each `UIImageView` to equal one of the four png files mentioned above. **How to do this**: After selecting a `UIImageView`, in the right pane after selecting the **Attributes Inspector**, you should see underneath Image View that you can open up a drop down menu and select any of the four images. After you've selected an image for all four `UIImageView`'s - you should see those images in your `UIViewController`. 
  3. You should be able to drag any of the `UIImageView` objects on the screen. Make sure to set `userInteractionEnabled` to `YES` in code for each `UIImageView` object. *This can also be done in InterfaceBuilder in the Attributes Inspector* **How to drag?**: *Hint*: `UIPanGestureRecognizer`. After creating a `UIPanGestureRecognizer` object in code, you need to add it to a view (in our case, we will need to add it to a `UIImageView` object.)
  4. Games without a way to win suck...let's have a secret "solution" to the perfect zen garden. Humans aren't perfect, feel free to put in some "tolerances" to these requirements.
    * King Arthur's sword (swordinrock.png), should be in the top left or bottom left.
    * The Shrub (shrub.png) and the rake (rake.png) should be near each other (choose what your definition of *near* is)
    * The regular stone (rock1.png) needs to be on a different North/South half of the screen as King Arthur's Sword (swordinrock.png). So if the sword is on the top, the other stone should be on the bottom.
  5. When all of these conditions are met, present a `UIAlertViewController` informing the user that they won. Add a `UIAlertAction` that dismisses the alert. When the alert is dismissed, scramble the locations of the `UIImageViews` (i.e. give all of them a random location in the garden).

## Advanced

  1. Add in a different way to move the items. Double tap on one to "select" it and give it a background color. Then tap somewhere else to move that item to the new location. *Hint:* You can do this with a `UITapGestureRecognizer`.
  
## Hints

  * Check out [this StackOverflow](http://stackoverflow.com/questions/19530283/how-do-i-detect-how-close-uiview-view-is-to-the-other-uiview) article on finding distance between two views
  * Gesture Recognizers are one to one, meaning that Gesture Recognizers can only be associated with one view at a time.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/zenGarden' title='zenGarden'>zenGarden</a> on Learn.co and start learning to code for free.</p>
