let ships = [
    "Star Trek" : "Enterprise",
    "Firefly" : "Serenity",
    "Aliens" : "Sulaco"
]

for ship in ships {
    print("\(ship.value) is from \(ship.key)")
}
// Enterprise is from Star Trek
// Serenity is from Firefly
// Sulaco is from Aliens

for ship in ships.reversed() {
    print("\(ship.value) is from \(ship.key)")
}
// Serenity is from Firefly
// Enterprise is from Star Trek
// Sulaco is from Aliens

