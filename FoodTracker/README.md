# Food Tracker

- [Start Developing iOS Apps (Swift)](https://developer.apple.com/library/prerelease/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html) lessons supplied by Apple.


### Lesson

- [x] 1. [Build a Basic UI](https://developer.apple.com/library/prerelease/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson2.html)
- [x] 2. [Connect the UI to Code](https://developer.apple.com/library/prerelease/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson3.html)
- [ ] 3. [Work with View Controllers](https://developer.apple.com/library/prerelease/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson4.html)

### Demo

![Demo](xxx.gif)


### Note

#### Lesson 1

- Select the **Auto-enable Return Key** checkbox. This change makes it impossible for the user to tap the Done key before typing text into the text field, ensuring that users can never enter an empty string as a meal name.
- The **outline view** — which appears on the left side of the canvas—lets you see a hierarchical representation of the objects in your storyboard.
- Within that hierarchy, views enclosed within a view are called **subviews**, and the parent view that encloses a view is called its **superview**.
- **intrinsic content size**: The minimum size needed to display all the content in a view without clipping or distorting that content.

#### Lesson 2

- A comment that begins with the characters `// MARK:` is a special type of comment that’s used to organize your code and to help you (and anybody else who reads your code) navigate through it.
- The **IBOutlet** attribute tells Xcode that you can connect to the property from Interface Builder (which is why the attribute has the **IB** prefix). The **weak** keyword means that it’s possible for that property to have no value (be **nil**) at some point in its life.
  - This exclamation point indicates that the type is an [implicitly unwrapped optional](https://developer.apple.com/library/prerelease/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/GlossaryDefinitions.html#//apple_ref/doc/uid/TP40015214-CH12-SW50), which is an optional type that will always have a value after the value is first set.
- iOS apps are based on [event-driven programming](https://developer.apple.com/library/prerelease/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/GlossaryDefinitions.html#//apple_ref/doc/uid/TP40015214-CH12-SW38). That is, the flow of the app is determined by events: system events and user actions.
- An **action** (or an action method) is a piece of code that’s linked to an event that can occur in your app.
- When adding an action to a button, you may have noticed that the value of the Type field defaults to **AnyObject**. In Swift, AnyObject is a type used to describe an object that can belong to any class. Specifying the type of this action method to be **UIButton** means that only button objects can connect to this action.
- A **delegate** is an object that acts on behalf of, or in coordination with, another object.
- When the user taps a text field, it automatically becomes **first responder**. In an app, the first responder is an object that is first on the line for receiving many kinds of app events, including key events, motion events, and action messages, among others.
- `textFieldShouldReturn(_:)` - get called when the user taps Return (or in this case, Done) on the keyboard.
- `textFieldDidEndEditing(_:)` - give you a chance to read the information entered into the text field and do something with it.
- Good habits:
```
    // MARK: Properties

    // MARK: Actions
```
