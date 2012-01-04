xquery version "1.0-ml";

module namespace sample = "sample";

declare function s1() as xs:string
{
	xdmp:value("eval and value are nasty")
};

declare function s2() (: as xs:string :)
{
	"no return type"	
};

declare function s3($foo, $bar as xs:string)
{
	"missing param type"
};

declare function s4($foo as element())
{
	$foo//some/path	
};

declare function s5() as xs:string
{
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	let $foo := "this function is considered to be too long"
	return $foo
};

declare function s6($a as item(), $b as item(), $c as item(), $d as item(), $e as item()) as xs:string
{
	"this function takes too many params"
};

declare function s7() as xs:string+
{
	for $x in (1 to 10)
	return
		for $y in (1 to 10)
		return
			for $z in (1 to 10)
			return "FLWORs nested too deep"
};
