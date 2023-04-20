/**
 * @name Comp3310 workshop 6 query
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */

import java

from MethodAccess call, Method method, MethodAccess child, Method childMethod
where
	call.getMethod() = method and
	(
		(
			call.getNumArgument() = 0 and
			method.hasName("printStackTrace") and
			method.getDeclaringType().hasQualifiedName("java.lang", "Throwable")
		) or
		(
			method.hasName("println") and
			method.getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
			call.getAChildExpr*() = child.getAChildExpr*() and
			child.getMethod() = childMethod and
			childMethod.hasName("getMessage") and
			childMethod.getDeclaringType().hasQualifiedName("java.lang", "Throwable")
		)
	)
select call
