package com.mouseoverstudio.rhyme.test;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;

import org.junit.Test;

import com.mouseoverstudio.rhyme.Rhyme;

public class RhymeTest {

	@Test
	public void translate() {
		HashMap map = new HashMap();
		assertEquals("org.jruby.RubyHash", Rhyme.translate(map).getClass()
				.getName());
	}

}
