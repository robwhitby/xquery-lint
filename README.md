#xquery-lint

Test the quality of XQuery modules

```xquery
xquery version '1.0-ml';
import module namespace lint = "http://github.com/robwhitby/xquery-lint" at "/xquery-lint/src/lint.xqy";

lint:process("/xquery-lint/test/sample.xqy")
```
