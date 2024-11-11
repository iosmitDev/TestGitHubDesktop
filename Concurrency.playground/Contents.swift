import UIKit

var greeting = "Hello, playground"


let queue = DispatchQueue(label: "downloadData")
let queue1 = DispatchQueue(label: "downloadData1")

let group = DispatchGroup()
let queue3 = DispatchQueue.global()

let sempahore = DispatchSemaphore(value: 1)

queue.async(group:group){
   sleep(5)
    print("calling")
}

queue1.async(group:group) {
    print("calling2")
}


queue3.async(group:group){
    print("global calling")
}

queue3.async(group:group) {
    print("global calling2")
}

queue3.async {
    sempahore.wait()
    sleep(2)
    print("sempahore calling")
    sempahore.signal()
}
queue3.async {
    sempahore.wait()
    print("sempahore calling2")
    sempahore.signal()
}

group.notify(queue: .main){
    print("All done")
}

print("welcome All")




