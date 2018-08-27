# Analyst

## Usage

```Swift
let analyst = Analyst(with: [
    "test": [
        "aProb": 0.25,
        "aValue": "test1",
        "bValue": "test2"
    ],
    "test2": [
        "aProb": 0.5,
        "aValue": 500,
        "bValue": 100
    ],
    "error1": [
        "aProb": "0.5", // aProb must be `Double`
        "aValue": 500,
        "bValue": 100
    ],
    "error2": [
        "aProb": 0.5,
        "aValue": "500", // aValue and
        "bValue": 100    // bValue must match type.
    ]
    ])

for _ in 1...1000 {
    print(analyst.stringValue(by: "test"))
    print(analyst.integerValue(by: "test2"))
    print(analyst.integerValue(by: "error1")) // => aProb is missing due to type mismatch.
    print(analyst.stringValue(by: "error2")) // => value type mismatches.
}
```
