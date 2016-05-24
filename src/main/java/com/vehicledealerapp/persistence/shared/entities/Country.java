package com.vehicledealerapp.persistence.shared.entities;

import java.io.Serializable;
import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;
import javax.persistence.OneToMany;

import com.vehicledealerapp.persistence.general.entities.City;

@Entity
@NamedEntityGraph(name = Country.WITH_CONTINENT,
attributeNodes = @NamedAttributeNode("continent"))
public class Country implements Serializable, Comparable<Country> {
	private static final long serialVersionUID = 1L;
	
	public static final String WITH_CONTINENT = "Country.withContinent";
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String name;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "continentid")
	private Continent continent;
	
	private boolean enabled;
	
	@OneToMany(mappedBy = "country")
	private Set<City> cities = new TreeSet<>();
	
	protected Country() {}
	
	public long getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public boolean isEnabled() {
		return enabled;
	}
	
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public Set<City> getCities() {
		return Collections.unmodifiableSet(cities);
	}
	
	public boolean addCity(City city) {
		return (!cities.contains(city)) ? cities.add(city) : false;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.toLowerCase().hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Country other = (Country) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equalsIgnoreCase(other.name))
			return false;
		return true;
	}


	@Override
	public int compareTo(Country country) {
		return name.compareToIgnoreCase(country.name);
	}
}
