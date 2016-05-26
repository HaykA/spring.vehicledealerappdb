package com.vehicledealerapp.persistence.general.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Street implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String name;
	private String postalCodePrefix;
	private String postalCodeSuffix;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "cityid")
	private City city;
	
	protected Street() {}

	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPostalCodePrefix() {
		return postalCodePrefix;
	}
	
	public String getPostalCodeSuffix() {
		return postalCodeSuffix;
	}

	public City getCity() {
		return city;
	}
	
	public String getPostalCode() {
		StringBuilder sb = new StringBuilder();
		if (postalCodePrefix != null) {
			sb.append(" ").append(postalCodePrefix);
		}
		sb.append(city.getPostalCode());
		if (postalCodeSuffix != null) {
			sb.append(" ").append(postalCodeSuffix);
		}
		return sb.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((postalCodePrefix == null) ? 0 : postalCodePrefix.hashCode());
		result = prime * result + ((postalCodeSuffix == null) ? 0 : postalCodeSuffix.hashCode());
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
		Street other = (Street) obj;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (postalCodePrefix == null) {
			if (other.postalCodePrefix != null)
				return false;
		} else if (!postalCodePrefix.equals(other.postalCodePrefix))
			return false;
		if (postalCodeSuffix == null) {
			if (other.postalCodeSuffix != null)
				return false;
		} else if (!postalCodeSuffix.equals(other.postalCodeSuffix))
			return false;
		return true;
	}
	
	
}
