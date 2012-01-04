xquery version "1.0-ml";

module namespace lint = "http://github.com/robwhitby/xquery-lint";
import module namespace parser = "XQueryML10" at "parsers/XQueryML10.xq";
import module namespace rules = "http://github.com/robwhitby/xquery-lint/rules" at "rules.xqy";

declare function process($filepath as xs:string) {
	process($filepath, fn:false())
};

declare function process($filepath as xs:string, $debug as xs:boolean)
{
	let $ast := parse($filepath)
	return
		<lint src="{$filepath}">
			{
				apply-rules($ast), 
				if ($debug) then $ast else ()
			}
		</lint>
};

declare private function parse($module-path as xs:string) as element(XQuery)?
{
  let $source := fn:string(xdmp:filesystem-file($module-path))
  where $source
  return parser:parse-XQuery($source)
};

declare private function apply-rules($ast as element(XQuery))
{
	for $rule in $rules:rules
	return apply-rule($ast, $rule)
};

declare private function apply-rule($ast as element(XQuery), $rule)
{
	let $failures := xdmp:value(fn:concat("$ast", $rule/test))
	where $failures
	return 
		<rule>
			{
				$rule/(name|level),
				for $f in $failures
				return <source>{$f//ancestor-or-self::FunctionDecl/fn:string()}</source>
			}
		</rule>
};




