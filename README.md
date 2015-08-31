# Drafter

[![CI Status](http://img.shields.io/travis/mattThousand/Drafter.svg?style=flat)](https://travis-ci.org/mattThousand/Drafter)
[![Version](https://img.shields.io/cocoapods/v/Drafter.svg?style=flat)](http://cocoapods.org/pods/Drafter)
[![License](https://img.shields.io/cocoapods/l/Drafter.svg?style=flat)](http://cocoapods.org/pods/Drafter)
[![Platform](https://img.shields.io/cocoapods/p/Drafter.svg?style=flat)](http://cocoapods.org/pods/Drafter)


Drafter is a set of simple wrapper calls around creating and accessing NSLayoutConstraints which makes it much less verbose when creating them progromatically. It allows for many of the common constraint creation operations to be expressed in a more concise way compared to the standard NSLayoutConstraint creation methods

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation with CocoaPods

Drafter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod "Drafter"`


## Usage

Make sure you import the Drafter Module. `import Drafter`

The methods are all a category on `UIView` therefor you want to call these methods on the view you want affected.   
	
### Access
All access to constraint right now are presented with a variable interface. These iterate through the appropriate constraints locating the right correct one

#### Pinned container constraints  

	view.pinedLeftConstraint
	view.pinnedRightConstraint
	view.pinnedTopConstraint
	view.pinnedBottomConstraint
	
#### Size constraints 
	// Note these only access height constraints that are to a constant, not bounded to a view.
	view.pinnedHeightConstraint
	view.pinnedWidthConstraint
	
#### Coming Soon

* Max and Min size constraints access
* Max and Min pinned padding constraints access
	

### Creation
All Creation Methods have optional parameters:  
	`active`,  Default `true`
	`priority`, Default `UILayoutPriorityRequired`  
They also all return `NSLayoutConstraint` unless otherwise noted

#### Pinning sides to container  
Pins the view side to it's container respectively. These will crash if the caller doesn't have a `superview`
Pinning methods have an optional parameter of `padding`, Default `0.0`  

	view.pinTopSpaceToContainer()
	view.pinLeftSpaceToConainer()
	view.pinRightSpaceToContainer()
	view.pinBottomSpaceToContainer()
	
The fill method are a mass Pinning to Container functional for ease of use  
The fill has an optional parameter `insets`, Default `UIEdgeInsetsZero`  

	// NOTE: This method returns a named tuple mimicking `UIEdgeInsets` but with constraints
	view.fillContainer()
	
#### Centering in container  
The centering interface is very similar to the pinning however it is centering based on the axis you specify, if no axis is specified it will center in both dimensions. These will crash if the caller doesn't have a `superview`.  
Centering constraints have an optional parameter `offset`. Default `0.0`

	view.centerInContainer(.Horizontal)
	view.centerInContainer(.Vertical)

	
	// NOTE: This method returns a named tuple mimicking `CGPoint` but with constraints
	view.centerInContainer() 
	
#### Setting Size (width, height)
You can either set the size of the view directly or bind it to another view.  
The view binding functions have an optional parameter `multiplier`. Default `1.0`
		
	view.pinHeight(toView: v)
	view.pinHeight(toHeight: h)
	view.pinWidth(toView: v)
	view.pinWidth(toWidth: w)
	
	// NOTE: This method returns a named tuple mimicking `CGSize` but with constraints.
	// this method doesn't take a multiplier
	view.pinSize(toSize: s)


#### Aligning & Attaching views
This interface requires you to pass in the view you are aligning the caller to. We don't enforce the two views being in the same heirarchy so you have to be careful about that.  
These have an optional parameter `offset`. Default `0.0`

	view.alignLeft(toLeftOfView: v)
	view.alignRight(toRightOfView: v)
	view.alignBottom(toBottomOfView: v)
	view.alignTop(toTopOfView: v)
	
	view.attachLeft(toRightOfView: v)	
	view.attachRight(toLeftOfView: v)
	view.attachBottom(toTopOfView: v)	
	view.attachTop(toBottomOfView: v)
	
	// NOTE the following return an array of constraints
	// these have an optional param realtion. Default .Equal
	view.align(subviews: vs, attribute: NSLayoutAttribute)
	view.space(subviews: vs, alongAxis: UILayoutConstraintAxis,
				isPositive: true) // optional: defaults to true 


#### Coming Soon

* Min/Max Size Constraints
* Min/Max Padding to container


## Authors  

github: [@mattThousand](https://github.com/mattThousand), email: [matt.d.buckley1212@gmail.com](mailto:matt.d.buckley1212@gmail.com), twitter: [@mattThousand](https://twitter.com/mattThousand)  
github: [@dostrander](https://github.com/dostrander), email: [djostran@gmail.com](mailto:djostran@gmail.com), twitter:  [@_derko](https://twitter.com/_derko)  

## License

Drafter is available under the MIT license. See the LICENSE file for more info.
