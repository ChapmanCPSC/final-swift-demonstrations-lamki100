//: Playground - noun: a place where people can play

import UIKit

// ternary operators
let num = (rand() % 2 == 0) ? "even" : "odd"

// switch statement
switch num
{
case "even":
    print("The number was even!")
case "odd":
    print("The number was odd...")
    fallthrough
default:
    print("It fell through...")
}

// while binding
func sum(var nums : [Int]) -> Int
{
    var sum = 0
    while let num = nums.popLast()
    {
        sum+=num
    }
    return sum
}

// array initialization
var arr1 : [Int] = []
var arr2 = [2,3,4,5]
var sum1 = sum(arr1)
print(sum1)
var sum2 = sum(arr2)
print(sum2)

// for binding
func findNumbers(nums: [Int], greaterThan compareNum: Int) -> [Int]
{
    var arr : [Int] = []
    var i = 0
    
    for num in nums where num > compareNum
    {
        arr.append(num)
        i+=1
    }
    return arr
}

var newArr = findNumbers(arr2, greaterThan: 3)
print(newArr)

// labeled break
var arr3: [[Int]] = [[1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9]]

var x : Int = 0
outer: for i in 0...2
{
    for j in 0...2
    {
        print("\(i),\(j)")
        if (arr3[i][j] == 5)
        {
            x = arr3[i][j]
            break outer
        }
    }
}
print(x)

// enumerations
let newArr2 = arr2.filter { (num : Int) -> Bool in
    return num < 4
}
print(newArr2)

// transformations
let doubledNumbers = arr2.map { (num : Int) -> Int in
    return num * 2
}
print(doubledNumbers)


// object types and protocol
protocol Mammal
{
    var speed : Int  { get }
    func prance() -> String
}

class Elephant : Mammal
{
    var speed : Int
    
    init(speed: Int)
    {
        self.speed = speed
    }
    
    // convenience init
    convenience init()
    {
        self.init(speed: 15)
    }
    
    func prance() -> String
    {
        return "Stomping quickly along at \(speed)mph"
    }
}

class Tiger : Mammal
{
    var speed : Int
    
    // failable initializer
    init?(speed: Int)
    {
        self.speed = speed
        
        if speed > 40
        {
            return nil
        }
    }
    
    func prance() -> String
    {
        return "Leaping quickly along at \(speed)mph"
    }
}

// inheritance
final class Lion : Tiger
{
    // class functions
    func eat()
    {
        print("EATS ALL THE THINGS")
    }
    
    // final override function
    final override func prance() -> String
    {
        return "Running quickly along at \(speed)mph"
    }
}

// example struct
struct Zebra : Mammal
{
    var speed : Int = 65
    func prance() -> String
    {
        return "Galaping quickly along at \(speed)mph"
    }
    
    // testing static function
    static func eats()
    {
        print("EATS ALL THE GRASS")
    }
}

func testAnimalSkills(creature : Mammal?)
{
    if (creature != nil)
    {
        print(creature!.prance())
        let lion = creature as? Lion
        lion?.eat()
    }
}

// dictionaries and optional types
var zoo = [String:[Mammal?]]()
zoo["Orange"] = [Elephant(), Elephant(), Zebra()]
zoo["San Diego"] = [Elephant(), Elephant(), Elephant(), Lion(speed: 35), Tiger(speed: 50), Zebra(), Zebra()]

func testAllAnimals(zoo : [String:[Mammal?]]) throws
{
    for (_, group) in zoo
    {
        for animal in group
        {
            testAnimalSkills(animal)
        }
    }
}

// throwing errors
do
{
    try testAllAnimals(zoo)
    
    // testing static method for struct
    Zebra.eats()
}
catch let error {
    print(error)
}

// enums
enum ReptileType : Int
{
    case Regular = 0
    case Komodo = 1
    case Dragon = 2
    case Godzilla = 3
    
    // mutated functions
    mutating func advanceLevel()
    {
        let nextStanding = ReptileType(rawValue: self.rawValue+1)
        self = nextStanding!
    }
}

struct Lizard
{
    var type : ReptileType = .Komodo
    func slither(times : Int)
    {
        for _ in 0...times
        {
            print("Slither Slither")
        }
    }
    
    mutating func advance()
    {
        self.type.advanceLevel()
    }
}

struct Snake
{
    var type : ReptileType = .Regular
    
    mutating func advance()
    {
        self.type.advanceLevel()
    }
}

// umbrella types
var reptileHouse : [Any] = [Lizard(), Snake()]

 