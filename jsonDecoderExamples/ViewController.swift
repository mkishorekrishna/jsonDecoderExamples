import Foundation

var json = """
{
    "message": {
        "affenpinscher": [],
        "african": [],
        "airedale": [],
        "akita": [],
        "appenzeller": [],
        "australian": [
            "shepherd"
        ],
        "basenji": [],
        "beagle": [],
        "bluetick": [],
        "borzoi": [],
        "bouvier": [],
        "boxer": [],
        "brabancon": [],
        "briard": [],
        "buhund": [
            "norwegian"
        ],
        "bulldog": [
            "boston",
            "english",
            "french"
        ],
        "bullterrier": [
            "staffordshire"
        ],
        "cairn": [],
        "cattledog": [
            "australian"
        ],
        "chihuahua": [],
        "chow": [],
        "clumber": [],
        "cockapoo": [],
        "collie": [
            "border"
        ],
        "coonhound": [],
        "corgi": [
            "cardigan"
        ],
        "cotondetulear": [],
        "dachshund": [],
        "dalmatian": [],
        "dane": [
            "great"
        ],
        "deerhound": [
            "scottish"
        ],
        "dhole": [],
        "dingo": [],
        "doberman": [],
        "elkhound": [
            "norwegian"
        ],
        "entlebucher": [],
        "eskimo": [],
        "finnish": [
            "lapphund"
        ],
        "frise": [
            "bichon"
        ],
        "germanshepherd": [],
        "greyhound": [
            "italian"
        ],
        "groenendael": [],
        "havanese": [],
        "hound": [
            "afghan",
            "basset",
            "blood",
            "english",
            "ibizan",
            "plott",
            "walker"
        ],
        "husky": [],
        "keeshond": [],
        "kelpie": [],
        "komondor": [],
        "kuvasz": [],
        "labrador": [],
        "leonberg": [],
        "lhasa": [],
        "malamute": [],
        "malinois": [],
        "maltese": [],
        "mastiff": [
            "bull",
            "english",
            "tibetan"
        ],
        "mexicanhairless": [],
        "mix": [],
        "mountain": [
            "bernese",
            "swiss"
        ],
        "newfoundland": [],
        "otterhound": [],
        "ovcharka": [
            "caucasian"
        ],
        "papillon": [],
        "pekinese": [],
        "pembroke": [],
        "pinscher": [
            "miniature"
        ],
        "pitbull": [],
        "pointer": [
            "german",
            "germanlonghair"
        ],
        "pomeranian": [],
        "poodle": [
            "miniature",
            "standard",
            "toy"
        ],
        "pug": [],
        "puggle": [],
        "pyrenees": [],
        "redbone": [],
        "retriever": [
            "chesapeake",
            "curly",
            "flatcoated",
            "golden"
        ],
        "ridgeback": [
            "rhodesian"
        ],
        "rottweiler": [],
        "saluki": [],
        "samoyed": [],
        "schipperke": [],
        "schnauzer": [
            "giant",
            "miniature"
        ],
        "setter": [
            "english",
            "gordon",
            "irish"
        ],
        "sheepdog": [
            "english",
            "shetland"
        ],
        "shiba": [],
        "shihtzu": [],
        "spaniel": [
            "blenheim",
            "brittany",
            "cocker",
            "irish",
            "japanese",
            "sussex",
            "welsh"
        ],
        "springer": [
            "english"
        ],
        "stbernard": [],
        "terrier": [
            "american",
            "australian",
            "bedlington",
            "border",
            "dandie",
            "fox",
            "irish",
            "kerryblue",
            "lakeland",
            "norfolk",
            "norwich",
            "patterdale",
            "russell",
            "scottish",
            "sealyham",
            "silky",
            "tibetan",
            "toy",
            "westhighland",
            "wheaten",
            "yorkshire"
        ],
        "vizsla": [],
        "waterdog": [
            "spanish"
        ],
        "weimaraner": [],
        "whippet": [],
        "wolfhound": [
            "irish"
        ]
    },
    "status": "success"
}
""".data(using: .utf8)!

// create a struct called "Planet" that conforms to Codable
// the struct should have properties with matching names and data types to the JSON

struct Planet: Codable {
    var message: [String : [String]]
    var status: String
}



// create a JSON decoder


let decoder = JSONDecoder()

// decode the JSON into your model object and print the result

do {
    let earth = try  decoder.decode(Planet.self, from: json)
    print(earth)
} catch {
    print(error)
}


/*
 
 // Array of jsons
import Foundation

var json = """
[
    {
        "title": "Groundhog Day",
        "released": 1993,
        "starring": ["Bill Murray", "Andie MacDowell", "Chris Elliot"]
    },
    {
        "title": "Home Alone",
        "released": 1990,
        "starring": ["Macaulay Culkin", "Joe Pesci", "Daniel Stern", "John Heard", "Catherine O'Hara"]
    }
]
""".data(using: .utf8)!

struct Movie: Codable {
    let titleMr: String
    let releasedMr: Int
    let starring : [String]

    enum CodingKeys: String, CodingKey {
        case titleMr = "title"
        case releasedMr = "released"
        case starring
     }
}


let decoder = JSONDecoder()
var comedies: [Movie]

do {

    comedies = try decoder.decode([Movie].self, from: json)
    print(comedies)
} catch {
    print(error)
}
*/

// Parsing nested json
import Foundation

var json = """
{
    "name": "Neha",
    "studentId": 326156,
    "academics": {
        "field": "iOS",
        "grade": "A"
    }
}
""".data(using: .utf8)!

// define model objects here

struct Academics: Codable {
    let myfield: String
    let mygrade: String
    
    enum  CodingKeys: String, CodingKey {
        case myfield = "field"
        case mygrade = "grade"
    }
}

struct Student: Codable {
    let myname: String
    let mystudentId: Int
    let myacademics: Academics
    
    enum CodingKeys: String, CodingKey {
        case myname = "name"
        case mystudentId = "studentId"
        case myacademics = "academics"
    }
}



let decoder = JSONDecoder()
let student: Student

do {
    // decode the JSON into the "student" constant
   student =  try  decoder.decode(Student.self, from: json)
    print(student)
} catch {
    print(error)
}
