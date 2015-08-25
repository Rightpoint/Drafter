# Drafter

<!--[![CI Status](http://img.shields.io/travis/mattThousand/Drafter.svg?style=flat)](https://travis-ci.org/mattThousand/TailoredSwiftAutoLayoutHelpers) -->
[![Version](https://img.shields.io/cocoapods/v/Drafter.svg?style=flat)](http://cocoapods.org/pods/TailoredSwiftAutoLayoutHelpers)
[![License](https://img.shields.io/cocoapods/l/Drafter.svg?style=flat)](http://cocoapods.org/pods/TailoredSwiftAutoLayoutHelpers)
[![Platform](https://img.shields.io/cocoapods/p/Drafter.svg?style=flat)](http://cocoapods.org/pods/TailoredSwiftAutoLayoutHelpers)

Drafter is a set of simple wrapper calls around creating and accessing NSLayoutConstraints which makes it much less verbose when creating them progromatically. It allows for many of the common constraint creation operations to be expressed in a more concise way compared to the standard NSLayoutConstraint creation methods

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation with CocoaPods

Drafter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod "Drafter"`

## Supported Constraint Methods

### Creation

* Pinning sides to container
* Centering in container
* Filling Container
* Setting Size (width, height)
* Spacing subviews
* Aligning Subviews
* Non-Active Constraint Creation

### Access

* Pinned container constraints
* Size constraints 

### Coming Soon

* Max Size Constraints (Coming Soon)
* Min/Max Padding to container

## Usage

Make sure you import the Drafter Module. `import Drafter`

The methods are all a category on `UIView` therefor you want to call these methods on the view you want affected.  
For example pinning the view to the top left of it's superview would be:

	view.pinTopSpaceToSuperview() 
	view.pinLeftSpaceToSuperview()
	
Or to center  

	view.centerInContainer



## Authors


github: [@mattThousand](https://github.com/mattThousand), email: [matt.d.buckley1212@gmail.com](mailto:matt.d.buckley1212@gmail.com), twitter: [@mattThousand](https://twitter.com/mattThousand)  
github: [@dostrander](https://github.com/dostrander), email: [djostran@gmail.com](mailto:djostran@gmail.com), twitter:  [@_derko](https://twitter.com/_derko)  

## License

Drafter is available under the MIT license. See the LICENSE file for more info.
