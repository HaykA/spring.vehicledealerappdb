package com.vehicledealerapp.persistence.general.valueobjects;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.vehicledealerapp.persistence.general.entities.City;

@Embeddable
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String street;
	private String house;
	private String apt;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cityid")
	private City city;

	public String getStreet() {
		return street;
	}

	public String getHouse() {
		return house;
	}

	public String getApt() {
		return apt;
	}

	public City getCity() {
		return city;
	}
	
	public String getStreetAndHouse() {
		return street + ' ' + house;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((apt == null) ? 0 : apt.hashCode());
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((house == null) ? 0 : house.hashCode());
		result = prime * result + ((street == null) ? 0 : street.hashCode());
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
		Address other = (Address) obj;
		if (apt == null) {
			if (other.apt != null)
				return false;
		} else if (!apt.equals(other.apt))
			return false;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (house == null) {
			if (other.house != null)
				return false;
		} else if (!house.equals(other.house))
			return false;
		if (street == null) {
			if (other.street != null)
				return false;
		} else if (!street.equals(other.street))
			return false;
		return true;
	}
	
	
}
