#CIID - Physical Prototyping
====
This two week workshop was hosted by [Massimo Banzi](http://www.ted.com/talks/massimo_banzi_how_arduino_is_open_sourcing_imagination.html), [Davide Gomba](http://ciid.dk/education/people/visiting-faculty/davide-gomba/) & [Dario Buzzini](http://www.ideo.com/people/dario-buzzini). These italian legands took us on a whirlwind tour of all things physical computing. We were given Arduino Starter Kits and let loose on the CIID Lab. All the projects can be found [here](http://ciid.dk/education/portfolio/idp13/courses/physical-computing/projects/)

### The little Wooden Skype Frame
####Concept
It is often hard to maintain a sense of time and sometimes the most important things to us are forgotten. One of the most common instances of this is remembering to stay in touch with the people that are closest to us. Too often we busy our selves with everyday tasks. The Wooden Skype Frame we created makes the passing of time more evident to the user. A simple picture frame that as time passes, so does the image in the frame pass out of focus. When this loss of focus is noticed and the frame picked up the image returns to focus for as long as the frame is held. This reminds them of the loved one, the distance between them and the time that has passed. When the frame is put down the image returns to the faded state. When the frame is held tightly or squeezed a Skype call is initiated and the picture will return to focus after the call.

####Construction

At the heart of our object is an Arduino board that controls the slow movements of the picture frame through servo motors and a gear mechanism. It also controls the behaviour of the backlight LED array. Skype calls are initiated by a button embedded at the back of the box through serial communication with Applescript. During the construction of the frame, a lot of attention was paid to the materials used, the internal construction and the interaction one would have with the frame. The frame is crafted and the interactions are intended to be intimate.
![The Skype Frame](http://ciid.dk/root_ciidwww/wp-content/uploads/2013/05/IMG_8026.jpg)

###The Rolling Fountain

####Concept

Tasked with visualising the repeating actions of our day, we looked at the obvious, toilet use. Harking at Rube Goldberg machines, the dropping of a ball represents the use of the toilet. When the ball is in suspension the toilet is in use. And when the ball drops, the use of the toilet is complete.A total number of balls collected in the bowl gives us an estimation of how many times the toilet has been used. The idea was to build a playful object that reflects the workings of a very mundane system.

####Construction

This was a one-day project in Physical Computing to learn wireless communication between two Arduino boards using the Xbee shield.  We used a capacitance sensor under the toilet seat to send data wirelessly to the Rolling Fountain which controlled the movement of the balls on the ramp through programmed servo motors.
![The Rolling Fountain Image](http://ciid.dk/root_ciidwww/wp-content/uploads/2013/05/42.jpg)

###Useful Links:
- [Arduino Starter Kit](http://arduino.cc/en/Main/ArduinoStarterKit)
- [Massimos Arduino Youtube Introduction](http://www.youtube.com/playlist?list=PLT6rF_I5kknPf2qlVFlvH47qHvqvzkknd)
- [Encyclopedia of Electronic Components Volume 1](http://shop.oreilly.com/product/0636920026105.do)
