package com.vehicledealerapp.persistence.shared.entities;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Continent implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String name;
	
	@OneToMany(mappedBy = "continent")
	private List<Country> countries;
	
	protected Continent() {}
	
	public long getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public List<Country> getCountries() {
		return Collections.unmodifiableList(countries);
	}
	
	public Set<Country> getEnabledCountries() {
		return countries.stream().filter(Country::isEnabled)
				.collect(Collectors.toCollection(TreeSet::new));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Continent other = (Continent) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
}
