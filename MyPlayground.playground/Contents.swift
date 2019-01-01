import UIKit

var str = "Hello, playground"
let line = "BLANCHE:   I don't want realism. I want magic!"
print(line.split(separator: " "))


func validTime(time: String) -> Bool {
    var newTime = time.split(separator: ":")
    
    var hour = ""
    hour = String(newTime[0])
    var min = ""
    min = String(newTime[1])
    print(hour)
    print(min)
    if (hour.first == "0"){
        
    }
    print(hour)
    return false
}

validTime(time: "23:02")
