package com.vehicledealerapp.persistence.shared.entities;

import java.io.Serializable;
import java.util.Collections;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Pattern;

import com.vehicledealerapp.persistence.general.entities.City;
import com.vehicledealerapp.util.RegexManager;

@Entity
public class Country implements Serializable, Comparable<Country> {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Pattern(regexp = RegexManager.COUNTRY_REGEX)
	private String name;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "continentid")
	private Continent continent;
	
	private boolean enabled;
	
	@OneToMany(mappedBy = "country")
	private Set<City> cities;
	
	protected Country() {}
	
	public String getName() {
		return name;
	}
	
	public void setId(long id) {
		this.id = id;
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
	
	boolean isDisabled() {
		return !isEnabled();
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
