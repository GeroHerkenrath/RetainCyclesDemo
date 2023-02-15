# Demo Project to Illustrate Retain Cycles #

This repository holds a very simple iOS project to show and explain what a retain cycles (a form of memory leak) is.

It is pretty straight-forward and can be run on the simulator. While the retain cycle is also present when running a
Preview, you will not see the helpful print statements that show the involved objects lifetimes, so I suggest to
run on a device or simulator with attached debugger.

## Types to look at ##

The types whose instances create the retain cycle are both contained in the `ProblemModel.swift` file.

The comments in there explain things a bit further and there is also a commented out solution of the retain cycle.

## Further Info ##

Retain cycles are by far not the only way to have memory leaks, even in modern Swift.
Also, this is by far not the only way to have a retain cycle, but I wanted to show something that can happen
in modern Swift and even in SwiftUI.

However, in my opinion this mixture of reference types and escaping callback closures (or delegates) are the most 
common scenario to shoot yourself in the foot that way, especially for beginners.

Other than that, the project was quickly done from the normal iOS project template in Xcode 14.2, so basically
everything is "default" (e.g. deployment target is iOS 16.2).
I will most likely not keep this up to date with newer Swift versions (which could introduce ways to mitigate
the problem or make it more visible, e.g. by including more warnings or some such), so if it no longer 
compiles: Tough luck... :)
