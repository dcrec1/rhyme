package com.mouseoverstudio.rhyme;

import static com.mouseoverstudio.mosju.Mosju.jruby;
import static com.mouseoverstudio.mosju.Mosju.readerOf;

import javax.script.Compilable;
import javax.script.CompiledScript;
import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import javax.script.ScriptException;
import javax.script.SimpleScriptContext;

public class Rhyme {

	private static CompiledScript compiledScript;

	static {
		try {
			ScriptEngine engine = jruby();
			engine.eval(readerOf("com/mouseoverstudio/rhyme/mim.rb"));
			compiledScript = ((Compilable) engine).compile("translate()");
		} catch (ScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Object translate(Object obj) {
		SimpleScriptContext context = new SimpleScriptContext();
		context.setAttribute("object", obj, ScriptContext.ENGINE_SCOPE);
		try {
			return compiledScript.eval(context);
		} catch (ScriptException e) {
			throw new RuntimeException(e);
		}
	}

}
