package com.vehicledealerapp.persistence.general.entities;

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

import com.vehicledealerapp.persistence.shared.entities.Country;

@Entity

public class City implements Serializable {
	private static final long serialVersionUID = 1L;

	public static final String WITH_COUNTRY = "City.withCountry";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String name;
	
	private String postalCode;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "countryid")
	private Country country;
	
	@OneToMany(mappedBy = "city")
	private Set<Street> streets;
	
	protected City() {}
	
	public long getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getPostalCode() {
		return postalCode;
	}
	
	public Set<Street> getStreets() {
		return Collections.unmodifiableSet(streets);
	}
	
	public Country getCountry() {
		return country;
	}

	public String getPostalCodeAndName() {
		return '(' + postalCode + ") " + name;
	}
	
	public String getPostalCodeNameAndCountry() {
		return postalCode + ' ' + name + ", " + country.getName();
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((postalCode == null) ? 0 : postalCode.hashCode());
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
		City other = (City) obj;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (postalCode == null) {
			if (other.postalCode != null)
				return false;
		} else if (!postalCode.equals(other.postalCode))
			return false;
		return true;
	}
	
}
