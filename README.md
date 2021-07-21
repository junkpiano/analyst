# Analyst

## Usage

You need to prepare json file where you define A/B testing variants.

```swift
let sampleJSON = Bundle.main.url(forResource: "sample", withExtension: "json")
var analyst = Analyst(source: sampleJSON)
```

Definitions in JSON must be like,

```JSON
{
    "test1": ["aaaa", "bbbb", "cccc"],
    "test2": [10000, 2000],
    "subscribeButton": ["subscribe", "register", "more detail"]
}
```

I assume the each entity format is a pair of key string and array.


Then in your application,

```Swift
print(analyst.conduct(by: "test1", for String.self)

// "aaaa", "bbbb", or "cccc"
```
