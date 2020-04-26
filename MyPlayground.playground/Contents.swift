import UIKit

var ServerVersionA1 = "1.1.8"
var AppVersionB1 = "1.1.10"




//let currentVersion = "0.9.25"
//let targetVersion = "0.10.1"
//let shouldUpdate = currentVersion.compare(targetVersion, options: .numeric) == .orderedAscending
//
//if shouldUpdate {
//    print("current version (\(currentVersion))", "<", "target version (\(targetVersion))")
//}
//else {
//    print("current version (\(currentVersion))", ">=", "target version (\(targetVersion))")
//}

if ServerVersionA1.compare(AppVersionB1) == .orderedDescending {
    print("現在のバージョンより下です")
} else {
    print("現在のバージョンより同じか上です")
}


if ServerVersionA1.compare(AppVersionB1, options: .numeric) == .orderedDescending {
    print("現在のバージョンより下です")
} else {
    print("現在のバージョンより同じか上です")
}
