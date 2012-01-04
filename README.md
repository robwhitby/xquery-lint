#xquery-lint

Check the quality of XQuery modules

##Invoking
```xquery
xquery version '1.0-ml';
import module namespace lint = "http://github.com/robwhitby/xquery-lint" at "/xquery-lint/src/lint.xqy";

lint:process("/xquery-lint/test/sample.xqy")
```

