package com.mouseoverstudio.rhyme;

import static com.mouseoverstudio.mosju.Mosju.jruby;
import static com.mouseoverstudio.mosju.Mosju.readerOf;

import java.util.HashSet;
import java.util.Set;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptException;

public class Rhyme {

	private static ScriptEngine engine;
	private static Invocable invocable;
	private static Set includedGems;

	static {
		try {
			engine = jruby();
			engine.eval(readerOf("com/mouseoverstudio/rhyme/mim.rb"));
			invocable = (Invocable) engine;
			includedGems = new HashSet<String>();
		} catch (ScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Object translate(Object obj) {
		try {
			return invocable.invokeFunction("translate", obj);
		} catch (ScriptException e) {
			throw new RuntimeException(e);
		} catch (NoSuchMethodException e) {
			throw new RuntimeException(e);
		}
	}

	public static void require(String text) throws ScriptException {
		if (!includedGems.contains(text)) {
			engine.eval("require '" + text + "'");
			includedGems.add(text);
			invocable = (Invocable) engine;
		}
	}

}
