package com.mouseoverstudio.rhyme.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.mouseoverstudio.rhyme.Rhyme;

public class RhymeTest {

	@Test
	public void map() {
		Map map = new HashMap();
		System.out.println(Rhyme.translate(map));
	}

}
