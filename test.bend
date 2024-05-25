
# this creates an object called V2 that is initialized with x and y
object V2 { x, y }


def distance(a, b):
  # this will "open" the vectors a and b into their respective x and y components
  open V2: a
  open V2: b
  # a and b are V2 objects so we can access their x and y values
  dx = b.x - a.x
  dy = b.y - a.y
  return (dx * dx + dy * dy)**0.5


# this makes a new data type "Shape" with two sub classes, i.e. circle and rectangle are both of type "Shape"
#   but their parameters may differ
type Shape:
  Circle {radius}
  Rectangle { width, height }

def area(shape):
  # this tells the passed "Shape" object to "match" the parameters with the data types we are about to call on it
  match shape:
    # here we check is the Shape object is a circle, if so, we retrive its parameters and calculate the area
    case Shape/Circle:
      return 3.14 * shape.radius ** 2.0
    # now we check if the Shape is a rectangle, if so, we return the area
    case Shape/Rectangle:
      return shape.width * shape.height


def main():
  # here we assign two V2 objects to variables
#   vec1 = V2 { x: 10.0, y: 10.0 }
#   vec2 = V2 { x: 20.0, y: 20.0 }
  circ = Shape/Circle { radius: 10.0 }
#   rect = Shape/Rectangle { width: 5.0, height: 2.0 }

#   we can only return one thing, to ensure it is the area of circ, we can only initialize circ and
#       nothing else
  return area(circ)