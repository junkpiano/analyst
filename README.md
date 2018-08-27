# Analyst

## Usage

You need to prepare `analyst.json`, which contains A/B test variants. Don't forget to add `analyst.json` to your build target.

```JSON
{
    "test1": ["aaaa", "bbbb", "cccc"],
    "test2": [10000, 2000],
    "error1": [1100, "test"],
    "subscribeButton": ["subscribe", "register", "more detail"]
}
```

```Swift
print(Analyst.shared.conduct(by: "test1").value ?? "aaa")
// "aaaa", "bbbb", or "cccc"
```
