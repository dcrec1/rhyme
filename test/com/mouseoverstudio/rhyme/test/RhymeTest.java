package com.mouseoverstudio.rhyme.test;

import static com.mouseoverstudio.mosju.Mosju.jruby;
import static com.mouseoverstudio.mosju.Mosju.readerOf;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptException;

import org.junit.Test;

import com.mouseoverstudio.rhyme.Rhyme;

public class RhymeTest {

	@Test
	public void translation() {
		HashMap map = new HashMap();
		assertEquals("org.jruby.RubyHash", Rhyme.translate(map).getClass()
				.getName());
	}

	@Test
	public void requireAGem() throws ScriptException,
			NoSuchMethodException {
		Map map = new HashMap();
		map.put("name", "MacBook");
		map.put("price", 3000.00);
		map.put("category", "Hi-Tech");
		Rhyme.require("liquid");
		assertTrue(hasToLiquid(Rhyme.translate(map)));
	}
	
	@Test
	public void requireAGemTwiceDontThrowsAnError() throws ScriptException {
		Rhyme.require("liquid");
		Rhyme.require("liquid");
		assertTrue(true);
	}

	public boolean hasToLiquid(Object x) throws ScriptException,
			NoSuchMethodException {
		ScriptEngine engine = jruby();
		engine.eval(readerOf("resources/liquid.rb"));
		Invocable invocable = (Invocable) engine;
		return (Boolean) invocable.invokeFunction("has_to_liquid", x);
	}

}
