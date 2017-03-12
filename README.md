**Sleeping in the Library**

Coded an iOS app as part of Udacity's [iOS Networking with Swift](https://www.udacity.com/course/ios-networking-with-swift--ud421) class that I am taking as review/prep from MHacks9. 

UI was already given, I wrote code to make an image request to Flickr's API and deserialize the return JSON object and set the image and title by selecting a random photo from Flickr's sleeping in the library gallery. 

Followed course videos, read documentation whenever I came across something new or something that I had taken for granted earlier, wrote code, documented it.

Total time spent: slightly more than 3 hours 

The most useful things I have learned/discovered in this course:

- [NSURLSession](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/URLLoadingSystem/Articles/UsingNSURLSession.html#//apple_ref/doc/uid/TP40013509-SW1)

- [JSONSerialization](https://developer.apple.com/reference/foundation/jsonserialization)
	A class to convert bytes of JSON data into objects

- Gained better understanding of how to use Postman

**Summary of what I coded**: 

1. Sent an HTTP request using flick API to get list of photos in a gallery

2. Deserialzed the returned JSON object to randomly pick a photo's URL

3. Used this url to get an image and display it

*Evertime the 'Grab New Image' button is pressed this process is repeated*

![screenshot 1] (https://github.com/DeeptanshuM/SleepingInTheLibrary/blob/master/Simulator%20Screen%20Shot%20Mar%2011%2C%202017%2C%209.57.24%20PM.png)


![screenshot 2] (https://github.com/DeeptanshuM/SleepingInTheLibrary/blob/master/Simulator%20Screen%20Shot%20Mar%2011%2C%202017%2C%209.57.34%20PM.png)
