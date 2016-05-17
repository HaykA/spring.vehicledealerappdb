package com.vehicledealerapp.entities.shared;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import org.junit.Before;
import org.junit.Test;

public class CountryTest {

	private Country germany;
	private Country gERManY;
	private Country belgium;
	
	@Before
	public void before() {
		germany = new Country("Germany");
		gERManY = new Country("gERManY");
		belgium = new Country("Belgium");
	}
	
	@Test
	public void country_is_equal_to_another_country_if_both_have_same_name() {
		assertEquals(germany,  gERManY);
	}
	
	@Test
	public void country_is_not_equal_to_another_country_if_they_have_different_names() {
		assertThat(germany, is(not(equalTo(belgium))));
	}
	
	@Test
	public void country_hashCode_is_same_for_countries_having_same_name() {
		assertEquals(germany.hashCode(), gERManY.hashCode());
	}
	
	@Test
	public void country_hashCode_is_not_same_for_countries_having_different_names() {
		assertThat(germany.hashCode(), is(not(equalTo(belgium).hashCode())));
	}
}
