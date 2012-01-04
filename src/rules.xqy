xquery version "1.0-ml";

module namespace rules = "http://github.com/robwhitby/xquery-lint/rules";

declare variable $rules :=
	<rules>
		<rule>
			<name>avoid using xdmp:eval and xdmp:value</name>
			<test>//FunctionCall/FunctionName[QName = ("xdmp:eval", "xdmp:value")]</test>
			<level>warn</level>
		</rule>
		<rule>
			<name>declare function return type</name>
			<test>//FunctionDecl[fn:not(TOKEN = "as")]</test>
			<level>warn</level>
		</rule>
		<rule>
			<name>declare function parameter types</name>
			<test>//FunctionDecl/ParamList/Param[fn:not(TypeDeclaration)]</test>
			<level>warn</level>
		</rule>
		<rule>
			<name>avoid using descendant-or-self axis ("//") where possible</name>
			<test>//RelativePathExpr[TOKEN = "//"]</test>
			<level>info</level>
		</rule>
		<rule>
			<name>avoid declaring functions with more than 4 parameters</name>
			<test>//FunctionDecl/ParamList[fn:count(Param) gt 4]</test>
			<level>info</level>
		</rule>
		<rule>
			<name>avoid long functions</name>
			<test>//FunctionDecl[fn:string-length(.) gt 1000]</test>
			<level>warn</level>
		</rule>
		<rule>
			<name>avoid nesting FLWOR expressions more than one level deep</name>
			<test>//FLWORExpr[fn:count(ancestor::FLWORExpr) gt 1]</test>
			<level>warn</level>
		</rule>
	</rules>/rule;
