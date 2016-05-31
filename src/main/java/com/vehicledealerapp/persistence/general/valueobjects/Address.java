package com.vehicledealerapp.persistence.general.valueobjects;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.Embedded;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Embeddable
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@NotNull
	@Length(min = 3, max = 45)
	private String street;
	
	@NotNull
	@Length(min = 1, max = 15)
	private String house;
	
	@Valid
	@Embedded
	private City city;

	public String getStreet() {
		return street;
	}

	public String getHouse() {
		return house;
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
